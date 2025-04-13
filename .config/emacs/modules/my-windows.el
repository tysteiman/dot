(provide 'my-windows)

(defvar my--windows-applications-dir "C:/ProgramData/Microsoft/Windows/Start Menu/Programs/"
  "Path where Windows applications are for Start Menu.")

(defvar my--steam-games-dir "C:/Users/Tyler/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Steam/"
  "Path where Windows Steam games Start Menu entries are located in the form of .url files.")

(defvar my--last-steam-game ""
  "The last Steam game launched from Emacs.")

(defun my/launch-steam-game (ARG)
  "Launch `ARG' game .url file. `ARG' will default to the last played game this session."
  (interactive (list (read-file-name (if (not (string-empty-p my--last-steam-game))
                                         (format "Launch Game (%s): "
                                                 (car (last (split-string my--last-steam-game "/"))))
                                       "Launch Game: ")
                                     my--steam-games-dir
                                     my--last-steam-game
                                     t)))
  (setq my--last-steam-game ARG)
  (w32-shell-execute "open" ARG))

(defun my/launch-edge ()
  "Launch Edge."
  (interactive)
  (w32-shell-execute "open" (concat my--windows-applications-dir "Microsoft Edge.lnk")))

(defun my/launch-steam ()
  "Launch Steam."
  (interactive)
  (w32-shell-execute "open" (concat my--windows-applications-dir "Steam/Steam.lnk")))

(defun my/launch-ableton ()
  "Launch Ableton Live."
  (interactive)
  (w32-shell-execute "open" (concat my--windows-applications-dir "Ableton Live 12 Standard.lnk")))

(defun my/search-steam-games (ARG)
  "Search Steam for game `ARG' in browser (using `w32-shell-execute' with 'open' flag)."
  (interactive "sGame to search: ")
  (w32-shell-execute "open" (concat "https://store.steampowered.com/search/?term=" ARG)))

(defun my/search-youtube (ARG)
  "Search YouTube for `ARG'"
  (interactive "sThing to search on YouTube: ")
  (w32-shell-execute "open" (concat "https://www.youtube.com/results?search_query=" ARG)))

(global-set-key (kbd "C-c o a") 'my/launch-ableton)
(global-set-key (kbd "C-c o g") 'my/launch-steam-game)
(global-set-key (kbd "C-c o e") 'my/launch-edge)
(global-set-key (kbd "C-c o s") 'my/launch-steam)
(global-set-key (kbd "C-c o S") 'my/search-steam-games)
(global-set-key (kbd "C-c o y") 'my/search-youtube)
