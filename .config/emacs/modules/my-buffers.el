(provide 'my-buffers)

(use-package ibuffer
  :elpaca nil
  :bind (("C-x C-b" . ibuffer)))

(setq display-buffer-alist
      `(("\\*\\(helpful.*\\|[hH]elp\\|Messages\\)\\*"
         (display-buffer-in-side-window)
         (side . left)
         (window-width . 0.40)
         (slot . 0))
        ("\\*compilation\\*"
         (display-buffer-in-side-window)
         (side . left)
         (window-width . 0.40)
         (window-height . 0.40)
         (slot . 1))
        ("\\(magit\\:.*\\|magit\\-log\\:.*\\)"
         (display-buffer-in-side-window)
         (side . right)
         (window-width . 0.50)
         (slot . 0))))
