;;; packages.el --- db-term layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Aaron Jensen <aaronjensen@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst db-term-packages
  '(eterm-256color))

(defun db-term/init-eterm-256color ()
  (use-package eterm-256color
    :init
    (add-hook 'term-mode-hook #'eterm-256color-mode)))

;;; packages.el ends here
