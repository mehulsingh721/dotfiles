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
(doom-modeline-mode 1)


;; GUI Settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;; Which Key
(which-key-mode)

;; Zooming in and out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
