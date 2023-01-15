(provide 'my-vterm)

(use-package vterm
  :defer t
  :init
  (setq vterm-shell "fish")
  :bind (("C-c e v" . my/vterm)
         ("C-c d u" . my/launch-docker-project)
         ("C-c d r" . my/launch-rails-docker-project)
         ("C-c d y" . my/launch-yarn-project)
         ("C-c d c" . my/launch-rails-console)
         ("C-c d a" . my/launch-rails-bash)))

;; (use-package vterm-toggle
;;   :defer t)

(defun my/vterm (&optional bufname ignore-split)
  "Create a new VTERM buffer named `bufname'. Runs at projectile root when in a projectile directory."
  (interactive "sBuffer name: ")
  (let ((targetname (if (string-empty-p bufname) "vterm" bufname))
        (projectp (projectile-project-p)))
    ;; (unless ignore-split
    ;;   (split-window-right))
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
  ;; (split-window-right)
  (my/launch-vterm-with-command "up" "docker-compose up"))

(defun my/launch-rails-docker-project ()
  "Launch rails docker project by launching docker-compose up and rails s inside of the app container"
  (interactive)
  (my/launch-docker-project)
  (sit-for 5)
  ;; (split-window-below)
  (my/launch-vterm-with-command "server" "docker-compose exec app rails s -b 0.0.0.0"))

(defun my/launch-rails-console ()
  "Launch a rails console in vterm"
  (interactive)
  ;; (split-window-right)
  (my/launch-vterm-with-command "console" "docker-compose exec app rails c"))

(defun my/launch-rails-bash ()
  "Launch a bash session in a rails container"
  (interactive)
  ;; (split-window-right)
  (my/launch-vterm-with-command "app" "docker-compose exec app bash"))

(defun my/launch-yarn-project ()
  "Launch yarn project by launching yarn start"
  (interactive)
  ;; (split-window-right)
  (my/launch-vterm-with-command "yarn" "yarn start"))
