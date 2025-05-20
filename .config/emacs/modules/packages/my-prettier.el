(provide 'my-prettier)

(defun my/prettier ()
  "Enable `prettier-mode' if the current `project-root', `vc-root-dir' or `pwd', has an rc file."
  (interactive)
  (let ((root (or (project-root (project-current))
                  (vc-root-dir)
                  (pwd))))
    (message (format "prettier root to use: %s" root))
    (if (my--prettier-rc-exists-p root)
        (prettier-mode 1)
      (message "no prettierrc file detected"))))

(defun my--prettier-rc-exists-p (DIR)
  "Checks if a prettierrc file exists for `DIR'."
  (or (file-exists-p (concat DIR ".prettierrc.json"))
      (file-exists-p (concat DIR ".prettierrc"))))

(use-package prettier
  :defer t
  ;;:hook (js-mode . my/prettier)
  :bind (("C-c u p" . my/prettier))
  )
