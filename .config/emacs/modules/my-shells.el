(provide 'my-shells)

(use-package vterm
  :init (setq vterm-shell "/usr/bin/fish")
  :bind (("C-c e v" . my/vterm)
         ("C-c d u" . my/launch-docker-project)
         ("C-c d r" . my/launch-rails-docker-project)
         ("C-c d y" . my/launch-yarn-project)
         ("C-c d c" . my/launch-rails-console)
         ("C-c d a" . my/launch-rails-bash)))
