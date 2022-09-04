(nvmap :prefix "SPC"
       "SPC" '(counsel-M-x :which-key "M-x")
       ".." '(helm-find-files :which-key "Find files using helm")

       ;;Buffers
       "b b" '(ibuffer :which-key "Ibuffer")
       "b k" '(kill-current-buffer :which-key "Kill Current Buffer")
       "b n" '(next-buffer :which-key "Next Buffer")
       "b p" '(previous-buffer :which-key "Previous Buffer")
       "b B" '(ibuffer-list-buffers :which-key "Ibuffer list buffers")

       ;; Eshell
       "h r r" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload emacs config")

       ;; Window Splits
       "w c" '(evil-window-delete :which-key "Close window")
       "w n" '(evil-window-new :which-key "New window")
       "w s" '(evil-window-split :which-key "Horizontal split window")
       "w v" '(evil-window-vsplit :which-key "Vertical split window")

       ;;Window motions
       "w h" '(evil-window-left :which-key "Window left")
       "w j" '(evil-window-down :which-key "Window down")
       "w k" '(evil-window-up :which-key "Window up")
       "w l" '(evil-window-right :which-key "Window right")
       "w w" '(evil-window-next :which-key "Goto next window")

       ;;neotree
       "TAB" '(neotree-toggle :which-key "Open Neotree")

       ;;terminal
       "o t" '(vterm-toggle :which-key "Toggle Vterm")

       ;; Tabbar
       "t t" '(tab-new :which-key "New Tab")
       "t c" '(tab-close :which-key "Close Current Tab")
       "t n" '(tab-next :which-key "Next Tab")
       "t p" '(tab-previous :which-key "Previous Tab")

       "1" '(tab-bar-select-tab 1 :which-key "Select tab 1")
       "2" '(tab-bar-select-tab 2 :which-key "Select tab 2")
       "3" '(tab-bar-select-tab 3 :which-key "Select tab 3")
       "4" '(tab-bar-select-tab 4 :which-key "Select tab 4")
       "5" '(tab-bar-select-tab 5 :which-key "Select tab 5")
       "6" '(tab-bar-select-tab 6 :which-key "Select tab 6")
  )
