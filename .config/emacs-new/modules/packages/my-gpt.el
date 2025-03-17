(provide 'my-gpt)

(use-package gptel
  :defer t
  :init (let ((keyfile "~/.gptel.el"))
          (when (file-exists-p keyfile)
            (load-file keyfile)
            (setq gptel-api-key 'my--gptel-key))))
