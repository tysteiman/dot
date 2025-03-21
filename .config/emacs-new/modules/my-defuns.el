(provide 'my-defuns)

(defun my/git-blame-line ()
  "Run git blame on current line in file"
  (interactive)
  (let ((linum (line-number-at-pos))
        (file (buffer-file-name)))
    (shell-command (format "git blame -L%s,%s %s" linum linum file) "*Git blame*")))

(defun my/git-blame-file ()
  "Run git blame on current file"
  (interactive)
  (let ((file (buffer-file-name)))
    (shell-command (format "git blame %s" file) "*Git blame*")))

(defun my/git-blame-region ()
  "Run git blame on active region"
  (interactive)
  (let ((beg (line-number-at-pos (region-beginning)))
        (end (line-number-at-pos (region-end)))
        (file (buffer-file-name)))
    (if (region-active-p)
        (shell-command (format "git blame -L%s,%s %s" beg end file) "*Git blame*")
      (message "No active region."))))

(defun my/open-init-file ()
  "Open init.el"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun my/open-module (file)
  "Open custom emacs module in modules/ dir"
  (interactive (list (read-file-name "Open Module: " (concat user-emacs-directory "modules/"))))
  (when (file-exists-p file)
    (find-file file)))

(defun my/open-package (file)
  "Open custom emacs package file in modules/packages/"
  (interactive (list (read-file-name "Open Package: " (concat user-emacs-directory "modules/packages/"))))
  (when (file-exists-p file)
    (find-file file)))

(defun my--send-region-to-cmd (cmd)
  "Send the region to `cmd'."
  (if (use-region-p)
      (let ((start (region-beginning))
            (end (region-end)))
        (funcall cmd (buffer-substring-no-properties start end) "*Region to Shell*"))
    (message "Select the text you want to send to shell.")))

(defun my/send-region-to-shell-sync ()
  "Send the region to `shell-command'"
  (interactive)
  (my--send-region-to-cmd 'shell-command))

(defun my/send-region-to-shell-async ()
  "Send the region to `async-shell-command'"
  (interactive)
  (my--send-region-to-cmd 'async-shell-command))
