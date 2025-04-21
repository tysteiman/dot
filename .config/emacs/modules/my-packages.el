(provide 'my-packages)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package-ensure)

(setq use-package-always-ensure t
      use-package-verbose t)

;; (require 'my-lsp)
(require 'my-vertico)
(require 'my-orderless)
(require 'my-langs)
;; (require 'my-dashboard)
(require 'my-ui)
;; (require 'my-corfu)
(require 'my-gpt)
;; (require 'my-term)
(require 'my-git)
(require 'my-swiper)
(require 'my-snippets)
(require 'my-org-roam)
(require 'my-prettier)
;; (require 'my-evil)
;; (require 'my-dap)
