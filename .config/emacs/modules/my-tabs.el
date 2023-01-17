(provide 'my-tabs)

(use-package centaur-tabs
  :init (setq centaur-tabs-style "bar"
              centaur-tabs-set-bar 'under
              x-underline-at-descent-line t
              centaur-tabs-set-icons t
              centaur-tabs-gray-out-icons 'buffer
              centaur-tabs-height 32
              centaur-tabs-show-new-tab-button nil
              centaur-tabs-set-close-button nil)
  :bind (("C-<right>" . 'centaur-tabs-forward-tab)
         ("C-<left>" . 'centaur-tabs-backward-tab)
         ("C-<down>" . 'centaur-tabs-counsel-switch-group))
  :config (centaur-tabs-mode 1))

(use-package counsel)
