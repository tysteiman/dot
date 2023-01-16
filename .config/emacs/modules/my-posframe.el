(provide 'my-posframe)

;; TODO check out vterm-exit-functions for vterm implementation

;; use posframe
(use-package posframe :defer t)

(defvar my/eshell-posframe-buffer "*my/eshell-posframe*"
  "Local posframe toggle buffer")

(defun my/eshell-posframe--init ()
  "Initialize callback"
  (with-current-buffer (get-buffer my/eshell-posframe-buffer)
    (erase-buffer)
    (require 'eshell)
    (eshell-mode)))

(defun my/eshell-posframe ()
  "Open `eshell-mode' inside of a posframe window"
  (interactive)
  (when (posframe-workable-p)
    (let ((pos (posframe-show my/eshell-posframe-buffer
                              :poshandler #'posframe-poshandler-frame-center
                              :height (/ (frame-height) 2)
                              :width (/ (frame-width) 2)
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

(defvar my/vterm-posframe-buffer "*my/vterm-posframe*"
  "Local vterm posframe toggle buffer")

(defun my/exit-vterm (buffer desc)
  (interactive)
  (select-frame-set-input-focus (get-other-frame)))

(defun my/vterm-posframe--init ()
  "Initialize callback for vterm posframe"
  (with-current-buffer (get-buffer my/vterm-posframe-buffer)
    (erase-buffer)
    (require 'vterm)
    (vterm-mode)))

(defun my/vterm-posframe ()
  "Open `vterm-mode' inside of a vterm posframe window"
  (interactive)
  (when (posframe-workable-p)
    (let ((pos (posframe-show my/vterm-posframe-buffer
                              :poshandler #'posframe-poshandler-frame-center
                              :height (/ (frame-height) 2)
                              :width (/ (frame-width) 2)
                              :border-width 3
                              :border-color "indianred"
                              :accept-focus t
                              :left-fringe 20
                              :right-fringe 20
                              :initialize #'my/vterm-posframe--init)))
      (select-frame-set-input-focus pos)
      (end-of-buffer)
      (setq-local vterm-exit-functions '(my/exit-vterm)))))

;; TODO make defun for toggling on/off without blowing up

;; (posframe-delete-all)
;; (posframe-hide-all)

