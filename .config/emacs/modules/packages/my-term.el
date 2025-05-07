(provide 'my-term)

(use-package vterm
  :bind ("C-c v" . vterm)
  :config (add-to-list 'display-buffer-alist
                       '("*vterm"
                         (display-buffer-in-side-window)
                         (side . bottom)
                         (slot . -1)
                         (window-height . 0.20))))
