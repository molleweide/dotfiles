(setq base16-evil-cursors
      '(("normal" :base0B box)
        ("insert" :base0C (bar . 2))
        ("emacs" :base0D (bar . 2))
        ("hybrid" :base0D (bar . 2))
        ("replace" :base08 (hbar . 2))
        ("evilified" :base0A box)
        ("visual" :base09 (hbar . 2))
        ("motion" :base0E box)
        ("lisp" :base0E box)
        ("iedit" :base08 box)
        ("iedit-insert" :base08 (bar . 2))))

(defun base16-set-evil-cursor (state color shape)
  (set (intern (format "evil-%s-state-cursor" state))
       (list color shape)))

(defun base16-update-evil-cursors ()
  (let ((current-theme (symbol-name (car custom-enabled-themes))))
    (if (string-prefix-p "base16" current-theme)
        (let* ((description (symbol-value (intern (concat current-theme "-colors"))))
               (theme-colors (cl-loop for (name value) on description by #'cddr
                                      collect (cons name value))))
          (cl-loop for (state color style) in base16-evil-cursors
                   do
                   (base16-set-evil-cursor state (alist-get color theme-colors color) style)))
      ;; not base16 theme, restore default spacemacs cursors
      (if (functionp (spacemacs/add-evil-cursor))
          (cl-loop for (state color shape) in spacemacs-evil-cursors
                   do (spacemacs/add-evil-cursor state color shape))))
    ))

(add-hook 'spacemacs-post-theme-change-hook #'base16-update-evil-cursors)

(provide 'init-base16-evil)
