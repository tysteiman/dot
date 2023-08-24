(provide 'my-tree-sitter)

(use-package tree-sitter
  :defer t
  :hook
  (php-mode . tree-sitter-hl-mode)
  (ruby-mode . tree-sitter-hl-mode)
  (js2-mode . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :defer t)
