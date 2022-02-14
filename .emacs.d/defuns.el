;; DEFUNS
(defun my/open-config-file (file)
  (interactive "sWhich config file (name) do you want to open?")
  (find-file (concat user-emacs-directory file ".el")))

(defun my/trim-current-line-region ()
  "Trim whitespace for the given line"
  (let ((end (point))
        (beg (save-excursion
               (move-beginning-of-line 1)
               (point))))
    (whitespace-cleanup-region beg end)))

(defun my/new-next-line ()
  "Create a new line under the current one"
  (interactive)
  (move-end-of-line 1)
  (my/trim-current-line-region)
  (newline)
  (indent-for-tab-command))

(defun my/new-previous-line ()
  "Create a new line above the current one"
  (interactive)
  (my/trim-current-line-region)
  (move-beginning-of-line 1)
  (newline)
  (previous-line)
  (indent-for-tab-command))

(defun my/project-tags (dir &optional excludes)
  "Generate etags for the current project (if in one). This will only generate tags for the app (rails) directory."
  (interactive "sCode dir to generate tags for: ")
  (let* ((project (projectile-project-root))
         (target-dir (concat project dir))
         (tags-file (concat project "TAGS")))
    (if project
        (if (file-exists-p target-dir)
            ;; are never that big...
            (progn
              ;; it may be possible that this command is not finished by the time we reun visit-tags-table....
              ;; if we ever notice that we could probably just switch this to being a sync exec since our files
              (async-shell-command (concat "ctags " (or excludes "") " -eR -f " tags-file " " target-dir))
              ;; TODO: might not need to do this -- i was generating the tags in the wrong dir previously
              (visit-tags-table tags-file))
          (message "Directory [%s] does not exist." dir))
      (message "Not in a project."))))

(defun my/rails-tags ()
  "Generate etags for rails projects (src)"
  (interactive)
  (my/project-tags "app" "--exclude=*css --exclude=*scss --exclude=*.erb"))

(defun my/quit-emacs (yn)
  "Prompt the user if they're sure before closing Emacs."
  (interactive "cAre you sure you want to close Emacs? y/n ): ")
  (when (char-equal yn ?y)
    ;; (start-process-shell-command "xrandr" nil "xrandr --output eDP-1 --mode 1920x1080 --brightness .8")
    (save-buffers-kill-terminal)))

(defun my/send-region-to-shell (&optional start end)
  "Simple function to send the contents of a region to a shell command -- useful for debugging configs."
  (interactive)
  (let ((region-text (if (and start end)
                         (buffer-substring start end)
                       (buffer-substring (region-beginning) (region-end)))))
    (shell-command region-text)))

(defun my/send-line-to-shell ()
  "Function to use my/send-region-to-shell, giving it the whole line to run"
  (interactive)
  (my/send-region-to-shell (line-beginning-position) (line-end-position)))

(defvar my/opacity-level 85
  "The default opacity level that emacs should start with")

(defun my/set-opacity (&optional direction)
  "Function to update the opacity of the emacs window"
  (interactive "cSet Opacity +/- :")
  (if (or (char-equal direction ?-)
          (char-equal direction ?+))
      (my/set--opacity-level direction)
    (message "INVALID INPUT")))

(defun my/set--opacity-level (direction)
  "Evaluate whether the new opacity level is valid or not, if so apply it, otherwise message"
  (let ((new-value (if (char-equal direction ?-)
                       (- my/opacity-level 5)
                     (+ my/opacity-level 5))))
    (if (or (<= new-value 30)
            (> new-value 100))
        (message "REACHED MAX")
      (my/apply--opacity new-value direction))))

(defun my/apply--opacity (new-value direction)
  "Apply the new opacity level to the frame parameters, setq, and call our entry point again"
  (set-frame-parameter (selected-frame) 'alpha `(,new-value . 60))
  (add-to-list 'default-frame-alist `(alpha . (,new-value . 60)))
  (setq my/opacity-level new-value)
  (call-interactively 'my/set-opacity direction))
