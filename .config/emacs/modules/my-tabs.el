(provide 'my-tabs)

(use-package centaur-tabs
  :defer t
  :init
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-bar 'left)
  :bind
  ("C-<left>" . centaur-tabs-backward-tab)
  ("C-<right>" . centaur-tabs-forward-tab)
  ("C-<up>" . centaur-tabs-switch-group)
  :hook
  (server-after-make-frame . (lambda()
                               (centaur-tabs-mode t))))
