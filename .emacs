;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq custom-file "~/.emacs.d/custom.el")                  ;; save custom changes away

(setq package-archives '(("elpa" .                         ;; add melpa
                          "http://tromey.com/elpa/")
                         ("melpa" .
                          "https://melpa.org/packages/")))

;; funcs
(package-initialize)                                       ;; init packages
(menu-bar-mode 0)                                          ;; no menu bar
(scroll-bar-mode 0)                                        ;; disable scroll bars
(tool-bar-mode 0)                                          ;; disable tool bar
(show-paren-mode)                                          ;; hl parens

;; vars
(setq make-backup-files nil)                               ;; no backup files
(setq ns-pop-up-frames nil)                                ;; load files in same frame
(setq vc-follow-symlinks t)                                ;; don't prompt for symlinks
(setq tags-revert-without-query t)                         ;; don't prompt for tag refresh
(setq initial-buffer-choice t)                             ;; open scratch buffer on startup
(setq custom-safe-themes t)                                ;; allow custom themes

;; vars - defaults
(setq-default truncate-lines t)                            ;; truncate lines
(setq-default c-basic-offset 4)                            ;; C indentation to 4
(setq-default indent-tabs-mode nil)                        ;; only use spaces

;; puts
(put 'narrow-to-region 'disabled nil)                      ;; allow narrow

(load-theme 'wombat)                                       ;; use wombat
(set-cursor-color "red")                                   ;; make cursor red

;; key bindings
;; ;; Since I'm lazy I find it easier to bind simple Emacs procedures
;; ;; like movement commands etc directly into global-set-key by using
;; ;; lambdas. For more complex functions custom functions in general
;; ;; they shouldn't be defined here. However it should be fine if we
;; ;; have our own functions used inside of simple procedures in a lambda.
(let ((keys '(("C-x C-b" (lambda ()
                           "Visit the last visited (other) buffer"
                           (interactive)
                           (switch-to-buffer (other-buffer))))
              ("C-o"     (lambda ()
                           "Create a new line below the cursor"
                           (interactive)
                           (move-end-of-line 1)
                           (newline-and-indent)))
              ("C-M-o"   (lambda ()
                           "New line above"
                           (interactive)
                           (move-beginning-of-line 1)
                           (newline)
                           (previous-line)
                           (indent-for-tab-command))))))
  (dolist (binding keys)
    (let ((key (car binding))
          (fun (car (cdr binding))))
      (when (and key fun)
        (global-set-key (kbd key) fun)))))
