(provide 'my-packages)

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

(require 'my-evil)
(require 'my-git)
;; (require 'my-vertico)
(require 'my-ivy)
(require 'my-completion)
(require 'my-lsp)
(require 'my-org)
(require 'my-theme)
(require 'my-shells)
(require 'my-ui)
(require 'my-navigation)
(require 'my-languages)
(require 'my-prettier)
(require 'my-treesitter)
(require 'my-icons)
(require 'my-tabs)
;; (require 'my-treemacs)
;; (require 'my-dashboard)

(use-package pulseaudio-control
  :config (pulseaudio-control-default-keybindings))

(use-package sudo-edit
  :defer t)

(use-package dictionary
  :defer t)

(use-package restart-emacs
  :defer t)
