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

(defcustom fzf/args "--tiebreak=index --print-query"
  "Additional arguments to pass into fzf."
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

(define-minor-mode fzf-mode
  "Minor mode for the FZF buffer"
  :init-value nil
  :lighter " FZF mode"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<escape>") 'term-kill-subjob)
            (define-key map (kbd "C-c") 'term-kill-subjob)
            (define-key map (kbd "C-x") 'term-sent-raw)
            (define-key map (kbd "C-8") 'describe-key)
            map))

(evil-set-initial-state 'fzf-mode 'emacs)
(add-to-list 'evil-emacs-state-modes 'fzf-mode)

;; https://oremacs.com/2014/12/31/keymap-arms-race/
(defun fzf/raise-minor-mode (mode)
  "Make MODE the first on `minor-mode-map-alist'."
  (let ((x (assq mode minor-mode-map-alist)))
      (when x
        (setq minor-mode-map-alist
              (cons x (delq mode minor-mode-map-alist))))))

(defun fzf/after-term-handle-exit (process-name msg)
  (let* ((text (buffer-substring-no-properties (point-min) (point-max)))
         (lines (split-string text "\n" t "\s*>\s+"))
         (last-line (car (last (butlast lines 1))))
         (selected (split-string last-line ":"))
         (file (expand-file-name (pop selected)))
         (linenumber (pop selected))
         (key-press (car (last (butlast lines 2)))))
    (kill-buffer "*fzf*")
    (jump-to-register :fzf-windows)

    (when (equal key-press "ctrl-v")
      (split-window-right)
      (windmove-right))

    (when (file-exists-p file)
      (find-file file))

    (when linenumber
      (goto-char (point-min))
      (forward-line (- (string-to-number linenumber) 1))
      (back-to-indentation)))

  (advice-remove 'term-handle-exit #'fzf/after-term-handle-exit))

(defun fzf/start (directory)
  (require 'term)
  (window-configuration-to-register :fzf-windows)
  (advice-add 'term-handle-exit :after #'fzf/after-term-handle-exit)
  (let* ((buf (get-buffer-create "*fzf*"))
         (min-height (min fzf/window-height (/ (window-height) 2)))
         (window-height (if fzf/position-bottom (- min-height) min-height))
         (window-system-args (when window-system " --no-height --margin=1,0"))
         (kb-args " --expect=ctrl-v,ctrl-x")
         (fzf-args (concat fzf/args window-system-args kb-args))
         (sh-cmd (concat fzf/executable " " fzf-args)))
    (with-current-buffer buf
      (evil-local-mode -1)
      (setq default-directory directory))
    (split-window-vertically window-height)
    (when fzf/position-bottom (other-window 1))
    (make-term "fzf" "sh" nil "-c" sh-cmd)
    (switch-to-buffer buf)
    ;; (progn
    ;;   (evil-local-set-key 'normal (kbd "<escape>") 'term-kill-subjob)
    ;;   (evil-local-set-key 'normal (kbd "C-c") 'term-kill-subjob)
    ;;   (evil-local-set-key 'normal (kbd "C-x") 'term-send-raw)
    ;;   (evil-local-set-key 'insert (kbd "<escape>") 'term-kill-subjob)
    ;;   (evil-local-set-key 'insert (kbd "C-c") 'term-kill-subjob)
      ;; (evil-local-set-key 'insert (kbd "C-x") 'term-send-raw))
    (linum-mode 0)
    (visual-line-mode 0)
    (fzf-mode)
    (turn-off-evil-mode)
    ;; (fzf/raise-minor-mode fzf-mode)

    ;; (local-set-key (kbd "C-x") 'term-send-raw)

    ;; disable various settings known to cause artifacts, see #1 for more details
    (setq-local scroll-margin 0)
    (setq-local scroll-conservatively 0)
    (setq-local term-suppress-hard-newline t) ;for paths wider than the window
    (setq-local show-trailing-whitespace nil)
    (setq-local display-line-numbers nil)
    (face-remap-add-relative 'mode-line '(:box nil))

    (term-char-mode)
    (setq mode-line-format (format "   FZF  %s" directory))))

;;;###autoload
(defun fzf-projectile ()
  "Starts a fzf session at the root of the projectile project."
  (interactive)
  (require 'projectile)
  (fzf/start (projectile-project-root)))

(provide 'fzf)
