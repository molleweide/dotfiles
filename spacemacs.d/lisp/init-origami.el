(defun aj/origami-toggle-or-TAB (&optional arg)
  "Toggle current fold or use regular tab."
  (interactive)
  (if (and (local-variable-p 'origami-fold-style)
           (eq origami-fold-style 'triple-braces)
           (save-excursion
             (beginning-of-line)
             (or (looking-at-p (concat ".*}}" "}"))
                 (looking-at-p (concat ".*{{" "{")))))
      (progn
        (beginning-of-line)
        (origami-forward-toggle-node (current-buffer) (point)))
    (call-interactively 'indent-for-tab-command)))

(global-set-key [remap indent-for-tab-command] 'aj/origami-toggle-or-TAB)

;; Fold automatically if origami-fold-style is triple-braces
(add-hook 'hack-local-variables-hook
          (lambda ()
            (when (and (local-variable-p 'origami-fold-style)
                       (eq origami-fold-style 'triple-braces))
              (origami-mode)
              (origami-close-all-nodes (current-buffer)))))

(provide 'init-origami)
