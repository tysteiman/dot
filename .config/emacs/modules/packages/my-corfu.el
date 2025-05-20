(provide 'my-corfu)

(use-package corfu
  :defer t
  :init (setq corfu-auto t)
  :bind (("C-c u c" . corfu-mode)))

(use-package corfu-terminal
  :hook (prog-mode . corfu-terminal-mode)
  :if (not (display-graphic-p)))
