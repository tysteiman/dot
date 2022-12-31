(provide 'my-treesitter)

(use-package tree-sitter
  :hook
  (ruby-mode . tree-sitter-hl-mode)
  (java-mode . tree-sitter-hl-mode)
  (css-mode  . tree-sitter-hl-mode)
  (rust-mode . tree-sitter-hl-mode)
  (c-mode    . tree-sitter-hl-mode)
  (sh-mode   . tree-sitter-hl-mode)
  (yaml-mode . tree-sitter-hl-mode)
  (php-mode  . tree-sitter-hl-mode))

(use-package tree-sitter-langs :defer t)
