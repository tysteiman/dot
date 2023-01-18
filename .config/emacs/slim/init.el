(set-face-attribute 'default nil :height 130)

;; set some variables
(setq make-backup-files nil
      create-lockfiles nil
      vc-follow-symlinks t
      dired-listing-switches "-lah"
      shr-use-colors nil   ;; eww
      shr-inhibit-images t ;; eww
      shr-use-fonts nil    ;; eww
      compilation-scroll-output t)

(setq-default truncate-lines t
	      indent-tabs-mode nil)

;; only stuff built into emacs!
(column-number-mode)
(display-time-mode)
(windmove-default-keybindings)
(winner-mode)

;; if we want ivy/vertico type stuff, we can actually use fido-mode!

;; write some defuns
(defun open-config ()
  "Open Emacs init.el"
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

;; ----- PRETTIER -----
(defun prettier--eval-load ()
  "Initialize prettier if we are in a project"
  (require 'project)
  (if (project-current)
      (prettier--initialize)
    (message "Not in a project. Skipping prettier.")))

(defun prettier--initialize ()
  "Check if project has prettierrc and if so add save hook to this file"
  (let ((root (project-root (project-current))))
    (if (file-exists-p (concat root ".prettierrc.json"))
        (add-hook 'after-save-hook 'prettier--prettify-file 0 t)
      (message "No .prettierrc.json found. Skipping prettier."))))

(defun prettier--prettify-file ()
  "Fires prettier process, passing the current file along with the configuration file.

Right now we use a process sentinel to wait for prettier to finish. I'm not sure that's
the best implementation, but it seemed to be the easiest for now while not blocking
for a shell command response...

Using call-process-shell-command and revert-buffer seems to be maybe a tad faster,
but who cares, it works!"
  (let* ((file (buffer-file-name))
         (pconf (concat (project-root (project-current)) ".prettierrc.json"))
         (command (format "prettier -w --config %s %s" pconf file))
         (output (get-buffer-create "*prettier-response*")))
    ;; (set-process-sentinel (start-process-shell-command "prettier" nil command) #'prettier--respond)
    (with-current-buffer output
      (erase-buffer))
    (call-process-shell-command command nil output nil)
    ;; (replace-buffer-contents output)
    (revert-buffer nil t)))

;; (defun prettier--respond (proc msg)
;;   "Respond to prettier sentinel message. Right now the buffer is simply revert
;; the buffer, however there is probably a faster implementation."
;;   (revert-buffer nil t))

(add-hook 'js-mode-hook 'prettier--eval-load)
