;;; ../.dotfiles/doom.d/fzf.el -*- lexical-binding: t; -*-

;; /Users/dbalatero/.fzf/bin/fzf --history
;; /Users/dbalatero/.local/share/fzf-history/files
;; --color=bg+:#343D46,bg:#1B2B34,spinner:#FAC863,hl:#65737E,fg:#C0C5CE,header:#65737E,info:#FAC863,pointer:#EC5f67,marker:#C594C5,fg+:#C0C5CE,prompt:#C594C5,hl+:#EC5f67
;; -m --prompt ~/.emacs.d/ --tiebreak=index --expect=ctrl-v,ctrl-x,ctrl-t
;; --no-height

;;; fzf.el --- A front-end for fzf.
;;
;; Copyright (C) 2015 by Bailey Ling
;; Author: Bailey Ling
;; URL: https://github.com/bling/fzf.el
;; Package-Version: 20180619.145
;; Filename: fzf.el
;; Description: A front-end for fzf
;; Created: 2015-09-18
;; Version: 0.0.2
;; Package-Requires: ((emacs "24.4"))
;; Keywords: fzf fuzzy search
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING. If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Install:
;;
;; Autoloads will be set up automatically if you use package.el.
;;
;; Usage:
;;
;; M-x fzf
;; M-x fzf-directory
;; M-x fzf-git
;; M-x fzf-git-files
;; M-x fzf-hg
;; M-x fzf-hg-files
;; M-x fzf-projectile
;; M-x fzf-git-grep
;;
;;; Code:

(require 'subr-x)

(defgroup fzf nil
  "Configuration options for fzf.el"
  :group 'convenience)

(defcustom fzf/window-height 15
  "The window height of the fzf buffer"
  :type 'integer
  :group 'fzf)

(defcustom fzf/executable "fzf"
  "The path to the fzf executable."
  :type 'string
  :group 'fzf)

(defcustom fzf/args "-x --print-query"
  "Additional arguments to pass into fzf."
  :type 'string
  :group 'fzf)

(defcustom fzf/git-grep-args "-i --line-number %s"
  "Arguments to pass into git grep. %s is the search term placeholder"
  :type 'string
  :group 'fzf)

(defcustom fzf/position-bottom t
  "Set the position of the fzf window. Set to nil to position on top."
  :type 'bool
  :group 'fzf)

(defcustom fzf/directory-start nil
  "The path of the default start directory for fzf-directory."
  :type 'string
  :group 'fzf)

(defcustom fzf/use-rg-files t
  "If set, use `rg --files` to list files instead of the default."
  :type 'bool
  :group 'fzf)

(defcustom fzf/input-command "rg --files")

(defcustom fzf/evil-esc-to-kill-buffer t
  "If set, ESC will kill the FZF buffer."
  :type 'bool
  :group 'fzf)

(defun fzf/grep-cmd (cmd args)
  (format (concat cmd " " args)
          (shell-quote-argument
           (if (region-active-p)
               (buffer-substring-no-properties (region-beginning) (region-end))
             (read-from-minibuffer (concat cmd ": "))))))

(defun fzf/after-term-handle-exit (process-name msg)
  (let* ((text (buffer-substring-no-properties (point-min) (point-max)))
         (lines (split-string text "\n" t "\s*>\s+"))
         (line (car (last (butlast lines 1))))
         (selected (split-string line ":"))
         (file (expand-file-name (pop selected)))
         (linenumber (pop selected)))
    (kill-buffer "*fzf*")
    (jump-to-register :fzf-windows)
    (when (file-exists-p file)
      (find-file file))
    (when linenumber
      (goto-char (point-min))
      (forward-line (- (string-to-number linenumber) 1))
      (back-to-indentation)))
  (advice-remove 'term-handle-exit #'fzf/after-term-handle-exit))

(defun fzf/start (directory &optional cmd-stream)
  (require 'term)
  (window-configuration-to-register :fzf-windows)
  (advice-add 'term-handle-exit :after #'fzf/after-term-handle-exit)
  (let* ((buf (get-buffer-create "*fzf*"))
         (min-height (min fzf/window-height (/ (window-height) 2)))
         (window-height (if fzf/position-bottom (- min-height) min-height))
         (window-system-args (when window-system " --margin=1,0"))
         (fzf-args (concat fzf/args window-system-args))
         (sh-cmd (if cmd-stream (concat cmd-stream " | " fzf/executable " " fzf-args)
                   (concat fzf/executable " " fzf-args))))
    (with-current-buffer buf
      (setq default-directory directory))
    (split-window-vertically window-height)
    (when fzf/position-bottom (other-window 1))
    (make-term "fzf" "sh" nil "-c" sh-cmd)
    (switch-to-buffer buf)
    (if fzf/evil-esc-to-kill-buffer
        (progn
          (evil-local-set-key 'normal (kbd "<escape>") 'term-kill-subjob)
          (evil-local-set-key 'normal (kbd "C-c") 'term-kill-subjob)
          (evil-local-set-key 'insert (kbd "<escape>") 'term-kill-subjob)))
          (evil-local-set-key 'insert (kbd "C-c") 'term-kill-subjob)
    (linum-mode 0)
    (visual-line-mode 0)

    ;; disable various settings known to cause artifacts, see #1 for more details
    (setq-local scroll-margin 0)
    (setq-local scroll-conservatively 0)
    (setq-local term-suppress-hard-newline t) ;for paths wider than the window
    (setq-local show-trailing-whitespace nil)
    (setq-local display-line-numbers nil)
    (face-remap-add-relative 'mode-line '(:box nil))

    (term-char-mode)
    (setq mode-line-format (format "   FZF  %s" directory))))

(defun fzf/vcs (match)
  (let ((path (locate-dominating-file default-directory match)))
    (if path
        (fzf/start path)
      (fzf-directory))))

(defun fzf/git-files ()
  (let* ((fzf-command (if fzf/use-rg-files "rg --files" "git ls-files"))
         (process-environment
          (cons (concat (format "FZF_DEFAULT_COMMAND=%s" fzf-command))
                process-environment))
         (path (locate-dominating-file default-directory ".git")))
    (if path
        (fzf/start path)
      (user-error "Not inside a Git repository"))))

;;;###autoload
(defun fzf ()
  "Starts a fzf session."
  (interactive)
  (if (fboundp #'projectile-project-root)
      (fzf/start (condition-case err
                     (projectile-project-root)
                   (error
                    default-directory)))
    (fzf/start default-directory)))

;;;###autoload
(defun fzf-directory ()
  "Starts a fzf session at the specified directory."
  (interactive)
  (fzf/start (ido-read-directory-name "Directory: " fzf/directory-start)))

;;;###autoload
(defun fzf-git ()
  "Starts a fzf session at the root of the current git."
  (interactive)
  (fzf/vcs ".git"))

;;;###autoload
(defun fzf-git-files ()
  "Starts a fzf session only searching for git tracked files."
  (interactive)
  (fzf/git-files))

;;;###autoload
(defun fzf-hg ()
  "Starts a fzf session at the root of the current hg."
  (interactive)
  (fzf/vcs ".hg"))

;;;###autoload
(defun fzf-hg-files ()
  "Starts a fzf session only searching for hg tracked files."
  (interactive)
  (fzf/hg-files))

;;;###autoload
(defun fzf-projectile ()
  "Starts a fzf session at the root of the projectile project."
  (interactive)
  (require 'projectile)
  (fzf/start (projectile-project-root)))

;;;###autoload
(defun fzf-git-grep ()
  "Starts a fzf session based on git grep result. The input comes
   from the prompt or the selected region"
  (interactive)
  (fzf/start (locate-dominating-file default-directory ".git")
             (fzf/grep-cmd "git grep" fzf/git-grep-args)))

(provide 'fzf)
;;; fzf.el ends here


;; (defvar fzf/args
;;   (concat
;;     "--history "
;;     (getenv "HOME")
;;     "/.local/share/fzf-history/files "
;;     "-m --tiebreak=index --expect=ctrl-v,ctrl-x,ctrl-t --no-height"))

;; (define-minor-mode fzf-mode
;;   "Minor mode for the FZF buffer"
;;   :init-value nil
;;   :lighter " FZF"
;;   :keymap (let ((map (make-sparse-keymap)))
;;             (define-key map (kbd "C-c") 'term-interrupt-subjob)
;;               map))

;; (map! :mode fzf-mode :i "ESC" 'term-interrupt-subjob)

;; (defun dotfiles/fzf-override-start-args (original-fn &rest args)
;;   (message "called with args %S" args)
;;   (apply original-fn args)

;;   ;; set the FZF buffer to fzf-mode so we can hook ctrl+c
;;   (set-buffer "*fzf*")
;;   (fzf-mode)
;;   ;; (term-line-mode)
;; )

;; (advice-add 'fzf/start :around #'dotfiles/fzf-override-start-args)