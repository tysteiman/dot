(provide 'my-theme)

(defvar my/theme 'doom-tokyo-night
  "Theme to use")

(defvar my/themes '(doom-one
                    doom-feather-dark
                    doom-pine
                    doom-gruvbox
                    doom-nord
                    doom-rouge
                    doom-ayu-dark
                    doom-moonlight
                    doom-shades-of-purple)
  "Themes to be selected from when randomly selecting themes")

(use-package doom-themes
  :config
  (load-theme my/theme t)
  :hook (server-after-make-frame . (lambda ()
                                     (load-theme my/theme t))))

(defun my/select-random-theme ()
  "Load random theme from list of themes in `my/themes'"
  (let* ((len (length my/themes))
         (listlen (- len 1))
         (randno (random listlen))
         (theme (nth randno my/themes)))
    theme))

(defun my/set-random-theme ()
  "Set `my/theme' variable to result of selecting a random theme"
  (let ((theme (my/select-random-theme)))
    (setq my/theme theme)))

(defun my/set-and-load-random-theme ()
  "Set random theme and load it"
  (interactive)
  (my/set-random-theme)
  (load-theme my/theme t))
