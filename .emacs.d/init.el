;; Load other files from this directory
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "packages.el")
(load-user-file "keybindings.el")

(require 'helm-projectile)

;;Dashboard

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
; (setq dashboard-startup-banner [VALUE])

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)


;;Fonts
(set-face-attribute 'default nil
                    :font "SauceCodePro Nerd Font 11"
                    :weight 'medium)
(set-face-attribute 'variable-pitch nil
                    :font "Ubuntu Nerd Font 11"
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :font "SauceCodePro Nerd Font 11"
                    :weight 'medium)

;; Theme
(setq doom-themes-enable-bold t 
      doom-themes-enable-italic t)
(load-theme 'doom-one t)

(add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font 11"))


;; GUI Settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tab-bar-mode 1)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)
(setq neo-smart-open t)

;; Which Key
(which-key-mode)

;; Zooming in and out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
(helm-projectile-on)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(setq projectile-project-search-path '("~/Projects"))
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 10)
                        (agenda . 5)
                        (registers . 5)))
;; Terminal
(setq vterm-toggle-fullscreen-p nil)
(add-to-list 'display-buffer-alist
             '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                (display-buffer-reuse-window display-buffer-at-bottom)
                ;;(display-buffer-reuse-window display-buffer-in-direction)
                ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                ;;(direction . bottom)
                ;;(dedicated . t) ;dedicated is supported in emacs27
                (reusable-frames . visible)
               (window-height . 0.3)))
