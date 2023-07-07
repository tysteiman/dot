(provide 'my-notes)

(defun my/open-work-note (file)
  "Opens work notes file"
  (interactive
   (list
    (read-file-name "Note: " (concat "~/notes/work/switchbox/"))))
  (find-file file))

(global-set-key (kbd "C-c n w") 'my/open-work-note)

(defun my/sync-notes ()
  "Uploads work notes"
  (interactive)
  (async-shell-command "aws s3 sync ~/notes/ s3://tyler-steiman-notes" "*Notes*"))

(global-set-key (kbd "C-c n s") 'my/sync-notes)

