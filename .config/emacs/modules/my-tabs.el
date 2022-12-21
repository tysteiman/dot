(provide 'my-tabs)

(use-package centaur-tabs
  :demand
  :init
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-bar 'left)
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<left>" . centaur-tabs-backward-tab)
  ("C-<right>" . centaur-tabs-forward-tab)
  ("C-<up>" . centaur-tabs-switch-group))
