(provide 'my-theme)

(defvar my/theme 'doom-tokyo-night
  "Theme to use")

(use-package doom-themes
  :init
  (setq doom-themes-treemacs-theme "doom-colors")
  :config (load-theme my/theme t)
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme my/theme t))))