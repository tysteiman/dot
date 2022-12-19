(provide 'gui)

(tool-bar-mode 0)
(scroll-bar-mode 0)

(use-package vertico-posframe
  :init
  (setq vertico-posframe-width 100)
  (setq vertico-posframe-parameters '((left-fringe . 10)
                                      (right-fringe . 20)))
  :config (vertico-posframe-mode)
  :hook (server-after-make-frame . (lambda ()
                                     (posframe-delete-all))))
