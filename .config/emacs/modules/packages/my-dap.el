(provide 'my-dap)

(use-package dap-mode
  :defer t
  :config
  (require 'dap-node)
  (require 'dap-php)
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-ui-controls-mode 1)
  (dap-ui-many-windows-mode 1))
