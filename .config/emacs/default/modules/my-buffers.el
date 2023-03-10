(provide 'my-buffers)

(setq display-buffer-alist
      `(("\\*notes\\*"
         (display-buffer-in-side-window)
         (side . bottom)
         (window-height . 0.15)
         (slot . -1))
        ("\\*\\(helpful.*\\|[hH]elp\\|Messages\\)\\*"
         (display-buffer-in-side-window)
         (side . left)
         (window-width . 0.30)
         (slot . 0))
        ("\\*compilation\\*"
         (display-buffer-in-side-window)
         (side . left)
         (window-width . 0.30)
         (window-height . 0.30)
         (slot . 1))
        ("\\(magit\\:.*\\|magit\\-log\\:.*\\)"
         (display-buffer-in-side-window)
         (side . right)
         (window-width . 0.40)
         (slot . 0))))

(defun my/pop-side-window ()
  "Transform the current window into a bottom buffer. This is useful
for side windows that we want to transform/treat like normal windows instead."
  (interactive)
  (let ((buffer (current-buffer)))
    (with-current-buffer buffer
      (delete-window)
      (display-buffer-at-bottom
       buffer `(())))))
