(defun db-ruby/rubocop-set-flycheck-executable ()
  (interactive)
  (let* ((dir (locate-dominating-file buffer-file-name "bin/rubocop"))
         (executable (if dir
                         (concat dir "bin/rubocop")
                       (executable-find "rubocop"))))
    (when executable
      (setq-local flycheck-ruby-rubocop-executable executable))))
