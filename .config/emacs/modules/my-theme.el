(provide 'my-theme)

(defvar my/theme 'doom-feather-dark
  "Theme to use")

(use-package doom-themes
  :config
  (load-theme my/theme t)
  ;; :hook (server-after-make-frame . (lambda ()
  ;;                                    (load-theme my/theme t)))
  )

;; (use-package emacs
;;   :init
;;   (require-theme 'modus-themes)
;;   :config
;;   (load-theme 'modus-vivendi))
