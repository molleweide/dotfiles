;;; packages.el --- db-spaceline layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: David Balatero <dbalatero@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `db-spaceline-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `db-spaceline/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `db-spaceline/pre-init-PACKAGE' and/or
;;   `db-spaceline/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst db-spaceline-packages
  '(all-the-icons
    spaceline
    spaceline-all-the-icons))

(defun db-spaceline/post-init-all-the-icons ()
  (use-package all-the-icons
    :config (setq neo-theme 'icons)))

(defun db-spaceline/post-init-spaceline ()
  (setq ns-use-srgb-colorspace nil)
  (use-package spaceline)

  ; (spaceline-toggle-battery-on)
  ; (spaceline-toggle-org-clock-on)
  ; (spaceline-toggle-evil-state-on)
  (setq powerline-default-separator 'arrow))

(defun db-spaceline/post-init-spaceline-all-the-icons ()
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-anzu)
  (spaceline-all-the-icons--setup-package-updates)
  (setq spaceline-all-the-icons-separator-type 'arrow)
)


;;; packages.el ends here
