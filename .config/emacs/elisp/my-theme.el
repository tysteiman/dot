(provide 'my-theme)

(defvar my/theme 'doom-wilmersdorf
  "Theme to use")

(defvar my/term-theme 'doom-tokyo-night
  "Terminal theme to use")

(use-package doom-themes
  :init
  (setq doom-themes-treemacs-theme "doom-colors")
  ;; :config (load-theme my/theme t)
  :config (when
              (and
               (not (daemonp))
               (not (display-graphic-p)))
            (load-theme my/term-theme t))
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme my/theme t))))
