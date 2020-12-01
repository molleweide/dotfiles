;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "David Balatero"
      user-mail-address "d@balatero.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; stop nagging me when I quit
(setq confirm-kill-emacs nil)

;; 80 chars
(setq-default fill-column 80)

;; Allow moving between panes with C-hjkl
(use-package! tmux-pane
  :config
  (tmux-pane-mode))

(load! "+fzf")
(setq fzf/files-source "ripgrep")

(map! :leader
      :desc "FZF file search" "SPC" #'fzf-projectile)

;; ripgrep
;; (after! counsel
;;   (setq counsel-fzf-cmd "rg --files --color=never --hidden | fzf -f \"%s\""))

;; make indexing faster
(after! projectile (setq projectile-indexing-method 'alien))

;; go back, vim style
(map! :nvi "C-6" #'pop-global-mark)

;; Split hot keys
;; (map! :n "v v" 'split-window-right
;;      :n "s s" 'split-window-below)

;; (map! :n "s" nil)
;; (map! :prefix "s"
;;       :n "s" 'split-window-below
;;       :n "v" 'split-window-right)

;; always push force with lease
(setq magit-push-arguments '("--force-with-lease"))

;; spacebar menu delay
(setq which-key-idle-delay 0.001)

;; split horizontal windows below
(setq evil-split-window-below t)

;; always split vertically
(setq split-width-threshold nil)

;; system clipboard
(use-package! xclip
  :config
  (xclip-mode 1))

;; ctrl p
(map! :g "C-p" #'+ivy/projectile-find-file)

;; All projectile, all the time.
(setq doom-modeline-lsp t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-persp-name t)
(setq doom-modeline-project-detection 'projectile)

;; Enable emoji!
(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji"))

;; modeline
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; company
(after! company
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 2)
  (setq company-show-numbers t)

(add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.

(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

;; show ANSI color codes in plain text
(after! text-mode
  (add-hook! 'text-mode-hook
    ;; Apply ANSI color codes
    (with-silent-modifications
      (ansi-color-apply-on-region (point-min) (point-max)))))
