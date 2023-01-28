(provide 'my-use-package)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)
;; (setq use-package-verbose t)

;; TODO i would like to be able to bind keys etc and have emacs and our "mode"
;; bindings without HAVING to use evil mode.
;;
;; TODO i'm actually thinking about using god mode instead? That simply eliminates
;; our prefix keys.
;;
;; TODO also, i hate our kbd's not being tied to their packages and all in 1 place...
;;
;; TODO should we use general and just call that in individual use package blocks?
;;
;; NOTE at the same time i do actually kind of like all the bindings being in one place...
;; i feel like it's a bit of a lose-lose ... maybe a pros/cons list would be good...
