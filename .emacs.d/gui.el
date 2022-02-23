;; gui-related startup configuration

(set-face-attribute 'default nil :height 130)

(set-frame-parameter (selected-frame) 'alpha '(85 . 60))
(add-to-list 'default-frame-alist '(alpha . (85 . 60)))

(fringe-mode 10)

(my/load-config-file "gui-packages")

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
