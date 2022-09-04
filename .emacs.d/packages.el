(require 'package)

;; Setup package.el to work with MELPA
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

; (package-refresh-contents)
(package-initialize)

;; Install use-package
(unless(package-installed-p 'use-package)
  (package-install 'use-package))

;; General Keybindings Package
(use-package general
             :ensure t
             :config
             (general-evil-setup t))


;; Evil Mode Package
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;;Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package projectile
  :ensure t
  :config
(projectile-global-mode 1))

;; Theme Package
(use-package doom-themes
             :ensure t)
(use-package doom-modeline
             :ensure t)
;; Which Key Package
(use-package which-key
             :ensure t)

;;file tree
(use-package neotree
  :ensure t)

;;terminal
(use-package vterm
        :ensure t)
(use-package vterm-toggle
           :ensure t)

(use-package highlight-indent-guides
             :ensure t)
