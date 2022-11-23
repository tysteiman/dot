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

(defun my/react-tags ()
  "Generate ctags for React (create-react-app) projects"
  (interactive)
  (my/project-tags "src"))

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

(defun my/async-shell-command-on-file (command)
  "Send current file as the argument to `command' i.e. <`command'> <current-file>"
  (interactive "sAsync shell command on file: ")
  (let* ((file (expand-file-name (buffer-file-name)))
         (command-to-run (concat command " " file)))
    (async-shell-command command-to-run)))

(defun my/async-shell-command-rubocop ()
  (interactive)
  (my/async-shell-command-on-file "rubocop"))

(defun my/async-shell-command-docker (command)
  (interactive "sAsync Docker shell command: ")
  (let ((command-to-run (concat "docker-compose exec app " command)))
    (async-shell-command command-to-run)))

(defun my/configure-prog-mode ()
  "Configure prog mode buffer"
  (interactive)
  (setq show-trailing-whitespace t)
  (display-line-numbers-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-mode 1)
  (rainbow-mode)
  (when (display-graphic-p)
    (hl-line-mode 1)))

(defun my/quit-emacs (yn)
  "Prompt the user if they're sure before closing Emacs."
  (interactive "cAre you sure you want to close Emacs? (y/n): ")
  (when (char-equal yn ?y)
    (save-buffers-kill-terminal)))

(defun my/sync-notes ()
  "Run AWS sync-notes binary for my notes directory"
  (interactive)
  (async-shell-command "sync-notes" (get-buffer-create "*notes*")))

(defun my/open-notes ()
  "Open notes directory in dired"
  (interactive)
  (dired "~/notes"))

;; TODO this should also configure bspwm workspaces, same was laptop-off below...
(defun my/laptop-on ()
  "Turn laptop screen on using xrandr"
  (interactive)
  (shell-command "xrandr --output eDP-1 --mode 1920x1080 --brightness 1 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1"))

(defun my/laptop-off ()
  "Turn laptop screen off using xrandr"
  (interactive)
  (shell-command "xrandr --output eDP-1 --mode 1920x1080 --brightness 0 --output HDMI-1-0 --mode 2560x1440 --primary --right-of eDP-1"))

(defun my/update-arch ()
  "Run async shell command to fetch for updates in yay"
  (interactive)
  (async-shell-command "yay -Syyu" (get-buffer-create "*yay*")))

(defun my/find-file-emacs (file)
  "Find file in user emacs directory matching `file'.el"
  (find-file (concat user-emacs-directory file ".el")))

(defun my/reset-dunst ()
  "Kill dunst and fire a test message using notify-send"
  (interactive)
  (shell-command "killall -q dunst && notify-send hello dunst"))

(defun my/configure-prettier ()
  "Configure Prettier by turning it on only if there is a pretterrc file in the projectile root"
  (let ((prettier-rc (concat (projectile-project-root) ".prettierrc.json")))
    (if (file-exists-p prettier-rc)
        (prettier-mode 1)
      (message ".prettierrc.json not detected in project root -- skipped loading."))))

(defun my/vterm (&optional bufname ignore-split)
  "Create a new VTERM buffer named `bufname'. Runs at projectile root when in a projectile directory."
  (interactive "sBuffer name: ")
  (let ((targetname (if (string-empty-p bufname) "vterm" bufname))
        (projectp (projectile-project-p)))
    (unless ignore-split
      (split-window-right))
    (if projectp
        (projectile-run-vterm)
      (vterm))
    (rename-buffer (concat "*" targetname "*"))))

(defun my/launch-vterm-with-command (bufname command)
  "Launch vterm named `buffer-name' and run `command'."
  (my/vterm (my/project-vterm-name bufname) t)
  (vterm-send-string command)
  (vterm-send-return))

(defun my/project-vterm-name (typename)
  "Return target buffer name for project vterm buffer name e.g. foo-rails server"
  (concat (if (projectile-project-p)
              (projectile-project-name)
            (projectile-default-project-name default-directory))
          " " typename))

(defun my/launch-docker-project ()
  "Launch general docker project by running docker-compose up"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "up" "docker-compose up"))

(defun my/launch-rails-docker-project ()
  "Launch rails docker project by launching docker-compose up and rails s inside of the app container"
  (interactive)
  (my/launch-docker-project)
  (sit-for 5)
  (split-window-below)
  (my/launch-vterm-with-command "server" "docker-compose exec app rails s -b 0.0.0.0"))

(defun my/launch-rails-console ()
  "Launch a rails console in vterm"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "console" "docker-compose exec app rails c"))

(defun my/launch-rails-bash ()
  "Launch a bash session in a rails container"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "app" "docker-compose exec app bash"))

(defun my/launch-yarn-project ()
  "Launch yarn project by launching yarn start"
  (interactive)
  (split-window-right)
  (my/launch-vterm-with-command "yarn" "yarn start"))

(defun my/flyspell ()
  "Turn on flyspell mode for the whole buffer"
  (flyspell-mode 1)
  (flyspell-buffer))

(defun my/process-running-p (procname)
  "Helper to check system processes for PROCNAME (string).

If PROCNAME is running, return t, otherwise nil."
  (let ((runningp nil))
    (dolist (pc (list-system-processes))
      (let* ((psattr (process-attributes pc))
             (psname (cdr (assoc 'comm psattr))))
        (when (string= psname procname)
          (setq runningp t))))
    runningp))

(defun my/increment ()
  "Increment word at point"
  (interactive)
  (let ((number (string-to-number (thing-at-point 'word t)))
        (thingpos (bounds-of-thing-at-point 'word)))
    (delete-region (car thingpos) (cdr thingpos))
    (insert (format "%s" (+ number 1)))))
