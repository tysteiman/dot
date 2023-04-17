(provide 'my-defuns)

(defun my/open-module (module)
  "Opens Emacs module file"
  (interactive
   (list
    (read-file-name "Emacs Module: " (concat user-emacs-directory "modules/"))))
  (find-file module))
