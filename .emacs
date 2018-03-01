;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(let ((files '(install
               funs
               conf
               keys
               vars
               hooks
               env)))
  (dolist (file files)
    (let ((file-path (format "~/.emacs.d/%s.el" file)))
      (if (file-exists-p file-path)
          (load file-path)
        (message "File: %s could not be found." file-path)))))
