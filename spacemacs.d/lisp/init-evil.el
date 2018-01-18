(with-eval-after-load 'evil
  ;; Move text up and down in visual mode with J/K
  (define-key evil-visual-state-map "J"
    (concat ":move '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "K"
    (concat ":move '<-2" (kbd "RET") "gv=gv"))

  ;; Retain selection, but also use a named command so we can reference it in
  ;; parinfer and such
  (define-key evil-visual-state-map "<" 'aj/evil-shift-left)
  (define-key evil-visual-state-map ">" 'aj/evil-shift-right)

  ;; make j & k behave as g j & g k:
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  ;; Use more simple */# so we don't drop into symbol-highlight mode
  (define-key evil-normal-state-map (kbd "*") 'evil-search-word-forward)
  (define-key evil-normal-state-map (kbd "#") 'evil-search-word-backward)

  ;; Remove C-a and C-b from ex (:) so we can use the regular emacs varieties
  (define-key evil-ex-completion-map (kbd "C-a") nil)
  (define-key evil-ex-completion-map (kbd "C-b") nil)

  ;; Remove this mapping so C-z can suspend in tty
  (define-key evil-motion-state-map (kbd "C-z") nil)

  ;; Hide point in company-childframe
  (add-to-list 'evil-buffer-regexps '("^ \\*company-childframe\\*")))

(defun aj/evil-shift-right ()
  (interactive)
  (call-interactively 'evil-shift-right)
  (execute-kbd-macro "gv"))

(defun aj/evil-shift-left ()
  (interactive)
  (call-interactively 'evil-shift-left)
  (execute-kbd-macro "gv"))

(defun minibuffer-inactive-mode-hook-setup ()
  ;; make `try-expand-dabbrev' from `hippie-expand' work in mini-buffer
  ;; @see `he-dabbrev-beg', so we need re-define syntax for '/'
  (set-syntax-table (let* ((table (make-syntax-table)))
                      (modify-syntax-entry ?/ "." table)
                      table)))
(add-hook 'minibuffer-inactive-mode-hook 'minibuffer-inactive-mode-hook-setup)

;; search by symbols in emacs
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq evil-symbol-word-search t)))

;; Make > and < round to tab stops
(setq evil-shift-round nil)

;; Account for our collective ability to hit escape and then another key quickly
(setq evil-esc-delay 0.001)

(provide 'init-evil)
