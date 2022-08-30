(add-hook 'prog-mode-hook 'my/configure-prog-mode)

(add-hook 'sh-mode-hook (lambda ((define-key sh-mode-map (kbd "C-M-x") 'my/send-line-to-shell)) ()))

(eval-after-load 'ruby-mode '(progn
                               (define-key ruby-mode-map (kbd "C-c r r") 'my/async-shell-command-rubocop)))
