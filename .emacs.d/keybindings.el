(nvmap :prefix "SPC"
       "SPC" '(counsel-M-x :which-key "M-x")
       ".." '(find-file :which-key "Find file")

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
       "o p" '(neotree-toggle :which-key "Open Neotree")

       ;;terminal
       "o t" '(vterm-toggle :which-key "Toggle Vterm")

       ;;terminal
       "o t" '(vterm-toggle :which-key "Toggle Vterm")

       ;;terminal
       "o t" '(vterm-toggle :which-key "Toggle Vterm")
       )
