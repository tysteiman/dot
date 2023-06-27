(provide 'my-buffers)

(use-package ibuffer
  :elpaca nil
  :bind (("C-x C-b" . ibuffer)))

(use-package windmove
  :elpaca nil
  :config (windmove-mode 1)
  :bind (("M-l" . windmove-right)
         ("M-h" . windmove-left)
         ("M-k" . windmove-up)
         ("M-j" . windmove-down)))

(setq display-buffer-alist
      `(("\\*\\(helpful.*\\|[hH]elp\\|Messages\\)\\*"
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
