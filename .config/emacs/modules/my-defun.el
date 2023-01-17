(provide 'my-defun)

(defun my/open-module (module)
  "Opens Emacs module file"
  (interactive
   (list
    (read-file-name "Emacs Module: " (concat user-emacs-directory "modules/"))))
  (find-file module))

(defun my/open-init ()
  "Open our init file and run occur on the sections"
  (interactive)
  (find-file "~/dot/.config/emacs/init.el"))

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

;; (defun my/async-shell-command-on-file (command)
;;   "Send current file as the argument to `command' i.e. <`command'> <current-file>"
;;   (interactive "sAsync shell command on file: ")
;;   (let* ((file (expand-file-name (buffer-file-name)))
;;          (command-to-run (concat command " " file)))
;;     (async-shell-command command-to-run)))

(defun my/async-shell-command-docker (command)
  (interactive "sAsync Docker shell command: ")
  (let ((command-to-run (concat "docker-compose exec app " command)))
    (async-shell-command command-to-run)))

(defun my/configure-prog-mode ()
  "Configure prog mode buffer"
  (interactive)
  (setq show-trailing-whitespace t)
  (diff-hl-margin-mode 1)
  (diff-hl-mode 1)
  (hl-line-mode 1))

(defun my/sync-notes ()
  "Run AWS sync-notes binary for my notes directory"
  (interactive)
  (async-shell-command "sync-notes" (get-buffer-create "*notes*")))

(defun my/dired-notes ()
  "Open notes directory with dired"
  (interactive)
  (dired "~/notes"))

(defun my/find-note (note)
  "Find note (all dirs)"
  (interactive
   (list
    (read-file-name "Note: " "~/notes/")))
  (find-file note))

(defun my/find-work-note (note)
  "Find work note"
  (interactive
   (list
    (read-file-name "Note: " "~/notes/work/switchbox/")))
  (find-file note))

(defun my/find-home-note (note)
  "Find home note"
  (interactive
   (list
    (read-file-name "Note: " "~/notes/home/")))
  (find-file note))

(defun my/update-arch ()
  "Run async shell command to fetch for updates in yay"
  (interactive)
  (async-shell-command "yay -Syyu" (get-buffer-create "*yay*")))

;; (defun my/process-running-p (procname)
;;   "Helper to check system processes for PROCNAME (string).
;;
;; If PROCNAME is running, return t, otherwise nil."
;;   (let ((runningp nil))
;;     (dolist (pc (list-system-processes))
;;       (let* ((psattr (process-attributes pc))
;;              (psname (cdr (assoc 'comm psattr))))
;;         (when (string= psname procname)
;;           (setq runningp t))))
;;     runningp))
