(provide 'my-corfu)

(use-package corfu
  :hook (prog-mode . corfu-mode))

(use-package corfu-terminal
  :hook (prog-mode . corfu-terminal-mode)
  :if (not (display-graphic-p)))
