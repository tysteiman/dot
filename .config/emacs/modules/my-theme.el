;; -*- lexical-binding: t; -*-
(provide 'my-theme)

;; Theme Variables
(let ((background "black")
      (foreground "wheat3")
      (keyword "indianred")
      (constant "royalblue")
      (builtin "palegreen4")
      (comment "gray20")
      (highlight "gray20")
      (string "plum4")
      (mode-line-height 4))

  ;; Shells
  (add-hook 'eshell-mode-hook (lambda ()
                                (setq mode-line-format nil)))

  ;; Base Emacs faces
  (set-background-color background)
  (set-foreground-color foreground)
  (set-cursor-color keyword)

  (set-face-attribute 'highlight nil :background highlight :foreground foreground)
  (set-face-attribute 'region nil :background highlight :foreground foreground)
  (set-face-attribute 'font-lock-keyword-face nil :foreground keyword)
  (set-face-attribute 'font-lock-comment-delimiter-face nil :foreground comment)
  (set-face-attribute 'font-lock-comment-face nil :foreground comment)
  (set-face-attribute 'vertical-border nil :foreground comment)
  (set-face-attribute 'font-lock-builtin-face nil :foreground builtin)
  (set-face-attribute 'font-lock-constant-face nil :foreground constant)
  (set-face-attribute 'font-lock-string-face nil :foreground string)
  (set-face-attribute 'minibuffer-prompt nil :foreground string)
  (set-face-attribute 'fringe nil :background background)
  (set-face-attribute 'link nil :foreground string :underline nil)
  (set-face-attribute 'font-lock-function-name-face nil :foreground builtin)
  (set-face-attribute 'font-lock-variable-name-face nil :foreground constant)
  (set-face-attribute 'font-lock-type-face nil :foreground constant)

  ;; Modeline & Headerline
  (set-face-attribute 'mode-line nil :background background :foreground foreground :box `(:line-width ,mode-line-height :color ,background) :overline t)
  (set-face-attribute 'header-line nil :background background :foreground comment :overline nil :underline t)
  (set-face-attribute 'mode-line-inactive nil :background background :foreground comment :box `(:line-width ,mode-line-height :color ,background) :overline t)

  ;; Rainbow delimiters
  (add-hook 'rainbow-delimiters-mode-hook (lambda ()
                                            (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground string)
                                            (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground keyword)
                                            (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground builtin)
                                            (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground constant)))
  ;; SHR (Web)
  (add-hook 'eww-mode-hook (lambda ()
                             (set-face-attribute 'shr-h1 nil :foreground keyword)
                             (set-face-attribute 'shr-h2 nil :foreground builtin)))

  ;; Modeline
  (setq-default mode-line-format
                `("%1 %b "
                  (:eval (propertize (format-time-string " %l:%M ") 'face '(:foreground ,builtin)))))

  ;; Dired
  (add-hook 'diredfl-mode-hook (lambda ()
                                 (set-face-attribute 'diredfl-file-name nil :foreground foreground)
                                 (set-face-attribute 'diredfl-dir-name nil :foreground string :background nil)
                                 (set-face-attribute 'diredfl-dir-priv nil :foreground constant :background nil)
                                 (set-face-attribute 'diredfl-no-priv nil :foreground comment :background nil)
                                 (set-face-attribute 'diredfl-read-priv nil :foreground keyword :background nil)
                                 (set-face-attribute 'diredfl-write-priv nil :foreground builtin :background nil)
                                 (set-face-attribute 'diredfl-exec-priv nil :foreground string :background nil)
                                 (set-face-attribute 'diredfl-number nil :foreground comment :background nil)
                                 (set-face-attribute 'diredfl-date-time nil :foreground builtin :background nil)
                                 (set-face-attribute 'diredfl-dir-heading nil :foreground comment :background nil)))

  ;; Org
  (add-hook 'org-mode-hook (lambda ()
                             (set-face-attribute 'org-drawer nil :foreground comment)
                             (set-face-attribute 'org-document-title nil :foreground constant)
                             (set-face-attribute 'org-level-1 nil :height 1.5)
                             (set-face-attribute 'org-level-2 nil :height 1.25)
                             (set-face-attribute 'org-level-3 nil :height 1.10)))

  ;; Typescript Mode
  (add-hook 'typescript-mode-hook (lambda ()
                                    (set-face-attribute 'typescript-primitive-face nil :foreground constant))))
