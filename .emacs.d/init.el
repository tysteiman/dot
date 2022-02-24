(require 'org)

(let ((source-file (concat user-emacs-directory "init.org"))
      (target-file (concat user-emacs-directory "init-tangle.el")))
  (org-babel-tangle-file source-file target-file)
  (load-file target-file))
