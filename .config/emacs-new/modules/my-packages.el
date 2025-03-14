(provide 'my-packages)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; (setq use-package-verbose t)

(use-package vterm :defer t)

(use-package magit :defer t)

(use-package swiper
  :bind ("C-M-/" . swiper))

(require 'my-lsp)
(require 'my-vertico)
