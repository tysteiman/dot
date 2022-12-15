(provide 'my-hooks)

(add-hook 'prog-mode-hook 'my/configure-prog-mode)

(add-hook 'sh-mode-hook (lambda ((define-key sh-mode-map (kbd "C-M-x") 'my/send-line-to-shell)) ()))

(eval-after-load 'ruby-mode '(progn
                               (define-key ruby-mode-map (kbd "C-c r r") 'my/async-shell-command-rubocop)))

(defvar my/dired-hide-details 1
  "Whether or not to show dired details")

;; dired hook
(add-hook 'dired-mode-hook (lambda ()
                             (interactive)
                             ;; launch hide details mode based on current value
                             (dired-hide-details-mode my/dired-hide-details)
                             ;; set keybinding to toggle that hide details value
                             (define-key dired-mode-map (kbd "C-c d d") (lambda ()
                                                                          (interactive)
                                                                          (let ((newval (if (eql my/dired-hide-details 0)
                                                                                            1
                                                                                          0)))
                                                                            (dired-hide-details-mode newval)
                                                                            (setq my/dired-hide-details newval))))))
