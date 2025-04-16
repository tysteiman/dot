(provide 'my-org-roam)

(use-package org-roam
  :init (setq org-roam-directory "~/notes/notes")
  :config (org-roam-db-autosync-mode)
  :bind (("C-c n n" . org-roam-capture)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n b" . org-roam-buffer-toggle)))
