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

(defcustom fzf/git-grep-args "-i --line-number %s"
  "Arguments to pass into git grep. %s is the search term placeholder"
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

(defcustom fzf/files-source "find"
  "The source to use for finding files. Can be one of 'find' (find . -path), 'ripgrep' (rg --files), 'git' (git ls-files), or 'custom'."
  :type 'string
  :group 'fzf)

(defcustom fzf/files-source-custom-command nil
  "The source command to pipe for searching for files with FZF"
  :type 'string
  :group 'fzf)

(defcustom fzf/proximity-sort-executable (concat (getenv "HOME") "/.cargo/bin/proximity-sort")
  "The path to proximity-sort to use"
  :type 'string
  :group 'fzf)

(defvar fzf-mode-map
  (let ((map (make-sparse-keymap)))
    ;; bind only the keys we need
    (define-key map (kbd "<escape>") 'term-kill-subjob)
    (define-key map (kbd "C-c") 'term-kill-subjob)
    (define-key map (kbd "C-s") 'term-sent-raw)
    (define-key map (kbd "C-v") 'term-sent-raw)
    map))

(defun fzf/grep-cmd (cmd args)
  (format (concat cmd " " args)
          (shell-quote-argument
           (if (region-active-p)
               (buffer-substring-no-properties (region-beginning) (region-end))
             (read-from-minibuffer (concat cmd ": "))))))

(define-derived-mode fzf-mode
  term-mode "FZF"
  "Major mode for FZF finder.")

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

    (when (file-exists-p file)
      (when (equal key-press "ctrl-s")
        (split-window-below)
        (windmove-down))

      (when (equal key-press "ctrl-v")
        (split-window-right)
        (windmove-right))

      (find-file file))

    (when linenumber
      (goto-char (point-min))
      (forward-line (- (string-to-number linenumber) 1))
      (back-to-indentation)))

  (advice-remove 'term-handle-exit #'fzf/after-term-handle-exit))

(defun fzf/current-relative-file (directory)
  (let* ((current-file (buffer-file-name)))
    (if (and (print current-file) (file-exists-p current-file))
        (string-remove-prefix directory (buffer-file-name))
      nil)))

(defun fzf/proximity-sort-command (directory)
  (let* ((current-file (fzf/current-relative-file directory))
         (relative-dir (if current-file (file-name-directory current-file) nil))
         (in-project-root (or (equal "" relative-dir) (not relative-dir)))
         (proximity-sort-command-available (file-executable-p fzf/proximity-sort-executable)))
    (if (and (print current-file) (not in-project-root) (print proximity-sort-command-available))
        (concat fzf/proximity-sort-executable " " current-file)
      nil)))

(defun fzf/start (directory &optional cmd-stream)
  ;; kill any orphaned buffers
  ;; (when (get-buffer "*fzf*")
    ;; (kill-buffer "*fzf*"))

  (require 'term)
  (window-configuration-to-register :fzf-windows)
  (advice-add 'term-handle-exit :after #'fzf/after-term-handle-exit)
  (let* ((buf (get-buffer-create "*fzf*"))
         (min-height (min fzf/window-height (/ (window-height) 2)))
         (window-height (if fzf/position-bottom (- min-height) min-height))
         (window-system-args (when window-system " --no-height --margin=1,0"))
         (kb-args " --expect=ctrl-v,ctrl-s")
         (fzf-args (concat fzf/args window-system-args kb-args))
         (fzf-command (concat fzf/executable " " fzf-args))
         (proximity-sort-command (if cmd-stream (fzf/proximity-sort-command directory) nil))
         (commands (remove nil (list cmd-stream proximity-sort-command fzf-command)))
         (sh-cmd (string-join commands " | ")))

    (with-current-buffer buf
      (setq default-directory directory))

    (split-window-vertically window-height)
    (when fzf/position-bottom (other-window 1))

    (make-term "fzf" "sh" nil "-c" sh-cmd)
    (switch-to-buffer buf)

    (linum-mode 0) (visual-line-mode 0)
    (fzf-mode)

    ;; disable various settings known to cause artifacts, see #1 for more details
    (setq-local scroll-margin 0)
    (setq-local scroll-conservatively 0)
    (setq-local term-suppress-hard-newline t) ;for paths wider than the window
    (setq-local show-trailing-whitespace nil)
    (setq-local display-line-numbers nil)
    (face-remap-add-relative 'mode-line '(:box nil))

    (term-char-mode)
    (setq mode-line-format (format "   FZF  %s" directory))))

(defun fzf/get-files-source ()
  (cond ((equal "find" fzf/files-source)
                "find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
                ((equal "ripgrep" fzf/files-source)
                "rg --files --hidden --ignore")
                ((equal "git" fzf/files-source)
                "git ls-files")
                ((equal "custom" fzf/files-source)
                fzf/files-source-custom-command)
                (t nil)))

(defun fzf/git-files ()
  (let ((process-environment
         (cons (concat "FZF_DEFAULT_COMMAND=git ls-files")
               process-environment))
        (path (locate-dominating-file default-directory ".git")))
    (if path
        (fzf/start path)
      (user-error "Not inside a Git repository"))))

(defun fzf/vcs (match)
  (let ((path (locate-dominating-file default-directory match)))
    (if path
        (fzf/start path (fzf/get-files-source))
      (fzf-directory))))

;;;###autoload
(defun fzf-directory ()
  "Starts a fzf session at the specified directory."
  (interactive)
  (fzf/start (ido-read-directory-name "Directory: " fzf/directory-start) (fzf/get-files-source)))

;;;###autoload
(defun fzf-git ()
  "Starts a fzf session at the root of the current git."
  (interactive)
  (fzf/vcs ".git"))

;;;###autoload
(defun fzf-git-files ()
  "Starts a fzf session only searching for git tracked files."
  (interactive)
  (fzf/git-files))

;;;###autoload
(defun fzf-hg ()
  "Starts a fzf session at the root of the current hg."
  (interactiv)
  (fzf/vcs ".hg"))

;;;###autoload
(defun fzf-projectile ()
  "Starts a fzf session at the root of the projectile project."
  (interactive)
  (require 'projectile)
  (fzf/start (projectile-project-root) (fzf/get-files-source)))

;;;###autoload
(defun fzf-git-grep ()
  "Starts a fzf session based on git grep result. The input comes
   from the prompt or the selected region"
  (interactive)
  (fzf/start (locate-dominating-file default-directory ".git")
             (fzf/grep-cmd "git grep" fzf/git-grep-args)))

;;;###autoload
(defun fzf-current-directory ()
  "Starts a fzf session from the current directory"
  (interactive)
  (fzf/start "." (fzf/get-files-source)))

(provide 'fzf)
