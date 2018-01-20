(defconst db-javascript-packages
  '(
    add-node-modules-path
    ;; (eslintd-fix :location (recipe :fetcher github :repo "aaronjensen/eslintd-fix" :branch "master"))
    eslintd-fix
    flycheck
    prettier-js
    rjsx-mode))

(defun db-javascript/init-eslintd-fix ()
  (use-package eslintd-fix
    :defer t
    :commands eslintd-fix-mode
    :init
    (progn
      (add-hook 'rjsx-mode-hook #'eslintd-fix-mode t))))

(defun db-javascript/init-rjsx-mode ()
  (use-package rjsx-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

      (setq
       js2-mode-show-strict-warnings nil
       js2-mode-show-parse-errors nil
       js-indent-level 2
       js2-basic-offset 2
       js2-strict-trailing-comma-warning nil
       js2-strict-missing-semi-warning nil)

      (advice-add #'js-jsx-indent-line
                  :after
                  #'db-javascript/js-jsx-indent-line-align-closing-bracket)
      (add-hook 'rjsx-mode-hook #'db-javascript/set-eslint-executable t))
    :config
    (modify-syntax-entry ?_ "w" js2-mode-syntax-table)))

(defun db-javascript/post-init-add-node-modules-path ()
  (with-eval-after-load 'rjsx-mode
    (add-hook 'rjsx-mode-hook #'add-node-modules-path)))

(defun db-javascript//flycheck-eslint-disable-prettier (oldfun checker &rest args)
  (let ((arguments (apply oldfun checker args)))
    (if (eq checker 'javascript-eslint)
        (cons "--rule=prettier/prettier:off" arguments)
      arguments)))

(defun db-javascript/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (advice-add 'flycheck-checker-substituted-arguments :around
                'db-javascript//flycheck-eslint-disable-prettier)

    (push 'javascript-jshint flycheck-disabled-checkers)
    (push 'json-jsonlint flycheck-disabled-checkers))

  (spacemacs/enable-flycheck 'rjsx-mode))

(defun db-javascript//enable-prettier ()
  "Enable prettier if there is a config and we're not in node_modules"
  (when (and (locate-dominating-file buffer-file-name "prettier.config.js")
             (not (string-match "\/node_modules\/" buffer-file-name)))
    (db-javascript/set-prettier-command)
    (prettier-js-mode)))

(defun db-javascript//enable-prettier-in-web-mode ()
  "Enable prettier in web mode if we're in a tsx file"
  (when (and buffer-file-name
           (string-match "\\.tsx?\\'" buffer-file-name))
    (db-javascript//enable-prettier)))

(defun db-javascript/init-prettier-js ()
  (use-package prettier-js
    :defer t
    :init
    (progn
      ;; (add-hook 'rjsx-mode-hook 'db-javascript//enable-prettier)
      ;; (add-hook 'web-mode-hook 'db-javascript//enable-prettier-in-web-mode)
      )))
