(provide 'my-tree-sitter)

(use-package tree-sitter
  :defer t
  :hook (prog-mode . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :defer t)
