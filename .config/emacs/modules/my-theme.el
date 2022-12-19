(provide 'my-theme)

(defvar my/theme 'doom-vibrant
  "Theme to use")

(use-package doom-themes
  :config (load-theme my/theme t)
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme my/theme t))))
