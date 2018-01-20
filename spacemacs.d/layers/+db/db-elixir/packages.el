(defconst db-elixir-packages
  '(
    alchemist
    elixir-mode
    flycheck-dialyxir
    flycheck-dogma
    flycheck
    ))

(defun db-elixir/post-init-alchemist ()
  (setq alchemist-test-ask-about-save nil)
  (setq alchemist-goto-elixir-source-dir "~/Source/elixir")
  (setq alchemist-goto-erlang-source-dir "~/Source/otp")

  (with-eval-after-load 'popwin
    ;; Pin alchemist windows to bottom
    (push '("*alchemist test report*"
            :position bottom :noselect t :dedicated t :stick t :height 25)
          popwin:special-display-config)
    (push '("*alchemist mix*"
            :position bottom :noselect t :dedicated t :stick t :height 25)
          popwin:special-display-config)
    (push '("*alchemist help*"
            :position bottom :noselect t :dedicated t :stick t :height 25)
          popwin:special-display-config)
    (push '("*Alchemist-IEx*"
            :position bottom :noselect t :dedicated t :stick t :height 25)
          popwin:special-display-config)))

(defun db-elixir/post-init-elixir-mode ()
  (with-eval-after-load 'elixir-mode
    ;; Treat _ as a word character
    (modify-syntax-entry ?_ "w" elixir-mode-syntax-table)))

(defun db-elixir/init-flycheck-dogma ()
  (use-package flycheck-dogma
    :defer t
    :commands flycheck-dogma-setup
    ))

(defun db-elixir/init-flycheck-dialyxir ()
  (use-package flycheck-dialyxir
    :defer t
    :commands flycheck-dialyxir-setup
    ))

(defun db-elixir/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (with-eval-after-load 'elixir-mode
      (flycheck-dogma-setup)
      (flycheck-credo-setup)
      (flycheck-dialyxir-setup)
      (flycheck-add-next-checker 'elixir-dogma 'elixir-credo)
      (flycheck-add-next-checker 'elixir-credo 'elixir-dialyxir))))
