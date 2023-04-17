(provide 'my-defuns)

(defun my/open-module (module)
  "Opens Emacs module file"
  (interactive
   (list
    (read-file-name "Emacs Module: " (concat user-emacs-directory "modules/"))))
  (find-file module))

(defun open-config ()
  "Open Emacs init.el"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun my/delete-and-balance-windows ()
  "Delete current window and balance windows"
  (interactive)
  (delete-window)
  (balance-windows))

(defun my/comment-current-line ()
  "Comment current line while keeping point the same."
  (interactive)
  (save-excursion
    (comment-line 1)))
