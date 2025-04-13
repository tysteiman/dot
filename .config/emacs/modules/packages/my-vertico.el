(provide 'my-vertico)

(use-package vertico
  ;; :init (setq vertico-count 20)
  :config (vertico-mode 1))

(use-package marginalia
  :after vertico
  :config (marginalia-mode)
  :init (setq marginalia-align 'right))

;; ----------------------------------------------
;; @TODO: i'd like to get this into something
;; i can toggle when i'm working full screen.
;; @TODO: could i actually toggle this when the
;; screen goes fullscreen or something?
;; ----------------------------------------------
;; (use-package vertico-posframe
;;   :after vertico
;;   :init (setq vertico-posframe-poshandler #'posframe-poshandler-frame-center
;;               vertico-posframe-border-width 5)
;;   :config
;;   (set-face-attribute 'vertico-posframe-border nil :background "plum4"))


;; ----------------------------------------------------------------------------------------------------------
;; @TODO: make a custom defun that can handle these...
;; i want to do something like:
;;   (my/with-fullscreen #'enter-func #'exit-func)
;; that automatically handles the hooks and all that shit.
;; ----------------------------------------------------------------------------------------------------------
;; (defun my--check-vertico-posframe-fullscreen (ARG)
;;   "Check if fullscreen is entered, and if so turn on `vertico-posframe-mode', otherwise turn it off."
;;   (let ((ful (frame-parameter ARG 'fullscreen)))
;;     (vertico-posframe-mode (if (eq ful 'fullboth) 1 -1))))

;; (add-hook 'window-size-change-functions 'my--check-vertico-posframe-fullscreen)
;; ----------------------------------------------------------------------------------------------------------

