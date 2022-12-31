(provide 'my-org)

(use-package org
  :defer t
  :init
  (setq org-startup-folded t)
  (setq org-todo-keywords '((sequence "TODO" "QUESTION" "OPTIONAL" "|" "DONE" "ANSWERED")))
  (setq org-todo-keyword-faces '(("QUESTION" . (:foreground "indianred"))
                                 ("OPTIONAL" . (:foreground "tan"))))
  :config
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("el"   . "src elisp"))
  (add-to-list 'org-structure-template-alist '("rb"   . "src ruby"))
  (add-to-list 'org-structure-template-alist '("js"   . "src javascript"))
  (add-to-list 'org-structure-template-alist '("json" . "src json"))
  :bind (("C-c t i" . org-timer-set-timer)
         ("C-c t s" . org-timer-stop))
  :hook
  (org-mode . org-indent-mode)
  (org-mode . toggle-truncate-lines))


(defun my/flyspell ()
  "Turn on flyspell mode for the whole buffer"
  (flyspell-mode 1)
  (flyspell-buffer))

(use-package flyspell
  :hook (org-mode . my/flyspell))
