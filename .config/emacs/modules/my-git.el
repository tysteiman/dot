(provide 'my-git)

(use-package magit
  :defer t
  :commands magit-status
  :bind (("C-c m s" . magit-status)
         ("C-M-i"   . magit-status)
         ("C-c m b" . magit-blame)))

(use-package diff-hl
  :after magit
  :hook (magit-post-refresh . diff-hl-magit-post-refresh))

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

(global-set-key (kbd "C-c m l") 'my/git-blame-line)
(global-set-key (kbd "C-c m f") 'my/git-blame-file)
(global-set-key (kbd "C-c m r") 'my/git-blame-region)