;;; packages.el --- db-ruby layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: David Balatero <dbalatero@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst db-ruby-packages
  '(ggtags
    helm-gtags
    inf-ruby
    rspec-mode
    ruby-block
    ruby-hash-syntax
    ruby-mode
    ruby-test-mode))

(defun db-ruby/post-init-ggtags ()
  (add-hook 'enh-ruby-mode-local-vars-hook #'spacemacs/ggtags-mode-enable)
)

(defun db-ruby/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'enh-ruby-mode)
)

(defun db-ruby/init-inf-ruby ()
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)
)

(defun db-ruby/post-init-rspec-mode()
  (setq rspec-autosave-buffer t)
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets))
)

(defun db-ruby/init-ruby-hash-syntax ()
  (require 'ruby-hash-syntax)
)

(defun db-ruby/post-init-ruby-block ()
  (require 'ruby-block)
  (setq ruby-block-highlight-toggle 'overlay)
  (ruby-block-mode t)
)

(defun db-ruby/post-init-ruby-mode ()
  (add-hook 'ruby-mode-hook #'db-ruby/rubocop-set-flycheck-executable)

  (with-eval-after-load 'ruby-mode
    (modify-syntax-entry ?_ "w" ruby-mode-syntax-table))
  (with-eval-after-load 'enh-ruby-mode
    (modify-syntax-entry ?_ "w" enh-ruby-mode-syntax-table))
)

(defun db-ruby/post-init-ruby-test-mode ()
  ;; Disable screenshot inlining, which slows emacs down and doesn't work
  (setenv "RAILS_SYSTEM_TESTING_SCREENSHOT" "simple")

  (with-eval-after-load 'compile
    (add-to-list 'compilation-error-regexp-alist 'screenshot-link)
    (add-to-list 'compilation-error-regexp-alist-alist
                 '(screenshot-link "\\[Screenshot\\]: \\(.*\\)$" 1 2)))

  (with-eval-after-load 'ruby-test-mode
    (advice-add 'ruby-test-run-at-point :before (lambda (&rest r) (save-buffer)))
    (advice-add 'ruby-test-run :before (lambda (&rest r) (save-buffer))))

  (setq ruby-test-rspec-options '())
)
;;; packages.el ends here
