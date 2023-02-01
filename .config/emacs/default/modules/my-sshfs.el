;; Simple wrapper around sshfs commands to mount our work ssh directory to a local
;; directory and unmount it. This relies more on manual debugging if errors are encountered
;; and is not intended to be anything more than a simple wrapper for convenience.
(provide 'my-sshfs)

(defvar my/sshfs-local-directory "~/mnt"
  "The directory to use for sshfs.")

(defvar my/sshfs-config-file "~/.ssh-emacs/config"
  "Configuration file SSH will connect with. Useful for when services like
1Password don't work well with TRAMP and we need a custom configuration.")

(defvar my/sshfs-remote-directory "/ssh:work:/home/admin/proj/"
  "Which directory to mount to local filesystem using sshfs.")

(defun my/mount-work-directory (dir)
  "Use sshfs to mount remote directory DIR onto the local filesystem.

This will mount the selected remote directory to `my/sshfs-local-directory'.

This uses the custom ssh config file found at `my/sshfs-config-file'."
  (interactive
   (list
    (read-directory-name "Work directory to mount: " my/sshfs-remote-directory)))
  (let* ((remote-dir (string-replace "/ssh:" "" dir))
         (cmd (format "sshfs -F %s %s %s"
                      my/sshfs-config-file
                      remote-dir
                      my/sshfs-local-directory)))
    (shell-command cmd "*sshfs*")
    (dired my/sshfs-local-directory)
    (revert-buffer-quick)))

(defun my/unmount-work-directory ()
  "Unmount sshfs directory located at `my/sshfs-local-directory'."
  (interactive)
  (shell-command (format "fusermount3 -u %s" my/sshfs-local-directory) "*sshfs"))

(add-hook 'kill-emacs-hook 'my/unmount-work-directory)
