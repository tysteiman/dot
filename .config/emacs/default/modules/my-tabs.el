(provide 'my-tabs)

(use-package centaur-tabs
  :defer t
  :init (setq centaur-tabs-style "bar"
              centaur-tabs-set-bar 'under
              x-underline-at-descent-line t
              centaur-tabs-set-icons t
              centaur-tabs-gray-out-icons 'buffer
              centaur-tabs-height 32
              centaur-tabs-show-new-tab-button nil
              centaur-tabs-set-close-button nil)
  :bind (:map centaur-tabs-mode-map
              ("C-<right>" . 'centaur-tabs-forward-tab)
              ("C-<left>" . 'centaur-tabs-backward-tab)
              ("C-<down>" . 'centaur-tabs-counsel-switch-group)
              ("M-C-<left>" . 'centaur-tabs-move-current-tab-to-left)
              ("M-C-<right>" . 'centaur-tabs-move-current-tab-to-right)))
