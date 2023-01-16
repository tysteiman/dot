(provide 'my-posframe)

;; use posframe
(use-package posframe :defer t)

(defvar my/eshell-posframe-buffer "*my/eshell-posframe*"
  "Local posframe toggle buffer")

(defun my/eshell-posframe--init ()
  "Initialize callback"
  (with-current-buffer (get-buffer my-posframe-buffer)
    (erase-buffer)
    (require 'eshell)
    (eshell-mode)))

(defun my/eshell-posframe ()
  "Open `eshell-mode' inside of a posframe window"
  (interactive)
  (when (posframe-workable-p)
    (let ((pos (posframe-show my-posframe-buffer
                              :poshandler #'posframe-poshandler-frame-center
                              :height 30
                              :width 100
                              :border-width 3
                              :border-color "indianred"
                              :accept-focus t
                              :left-fringe 20
                              :right-fringe 20
                              :initialize #'my/eshell-posframe--init)))
      (select-frame-set-input-focus pos)
      (end-of-buffer)
      (add-hook 'eshell-exit-hook (lambda ()
                                    (interactive)
                                    (select-frame-set-input-focus (get-other-frame)))
                0
                t))))

;; (posframe-delete-all)
;; (posframe-hide-all)

