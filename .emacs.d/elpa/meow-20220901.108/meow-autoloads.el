;;; meow-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "meow-beacon" "meow-beacon.el" (0 0 0 0))
;;; Generated autoloads from meow-beacon.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-beacon" '("meow-")))

;;;***

;;;### (autoloads nil "meow-cheatsheet" "meow-cheatsheet.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from meow-cheatsheet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-cheatsheet" '("meow-")))

;;;***

;;;### (autoloads nil "meow-cheatsheet-layout" "meow-cheatsheet-layout.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from meow-cheatsheet-layout.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-cheatsheet-layout" '("meow-cheatsheet-")))

;;;***

;;;### (autoloads nil "meow-command" "meow-command.el" (0 0 0 0))
;;; Generated autoloads from meow-command.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-command" '("meow-")))

;;;***

;;;### (autoloads nil "meow-core" "meow-core.el" (0 0 0 0))
;;; Generated autoloads from meow-core.el

(autoload 'meow-mode "meow-core" "\
Meow minor mode.

If called interactively, enable Meow mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp, also
enable the mode if ARG is omitted or nil, and toggle it if ARG is
`toggle'; disable the mode otherwise.

This minor mode is used by meow-global-mode, should not be enabled directly.

\(fn &optional ARG)" t nil)

(autoload 'meow-indicator "meow-core" "\
Indicator showing current mode." nil nil)

(put 'meow-global-mode 'globalized-minor-mode t)

(defvar meow-global-mode nil "\
Non-nil if Meow-Global mode is enabled.
See the `meow-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `meow-global-mode'.")

(custom-autoload 'meow-global-mode "meow-core" nil)

(autoload 'meow-global-mode "meow-core" "\
Toggle Meow mode in all buffers.
With prefix ARG, enable Meow-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Meow mode is enabled in all buffers where
`(lambda nil (unless (minibufferp) (meow-mode 1)))' would do it.
See `meow-mode' for more information on Meow mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-core" '("meow--")))

;;;***

;;;### (autoloads nil "meow-esc" "meow-esc.el" (0 0 0 0))
;;; Generated autoloads from meow-esc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-esc" '("meow-")))

;;;***

;;;### (autoloads nil "meow-face" "meow-face.el" (0 0 0 0))
;;; Generated autoloads from meow-face.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-face" '("meow--prepare-face")))

;;;***

;;;### (autoloads nil "meow-helpers" "meow-helpers.el" (0 0 0 0))
;;; Generated autoloads from meow-helpers.el

(autoload 'meow-define-state "meow-helpers" "\
Define a custom meow state.

The state will be called NAME-SYM, and have description
DESCRIPTION. Following these two arguments, pairs of keywords and
values should be passed, similarly to define-minor-mode syntax.

Recognized keywords:
:keymap - the keymap to use for the state
:lighter - the text to display in the mode line while state is active
:face - custom cursor face
:form - one lisp form that will be run when the minor mode turns on AND off.
If you want to hook into only the turn-on event, check whether
\(meow-NAME-SYM-mode) is true.

Example usage:
\(meow-define-state mystate
  \"My meow state\"
  :lighter \" [M]\"
  :keymap 'my-keymap)

Also see meow-register-state, which is used internally by this
function, if you want more control over defining your state. This
is more helpful if you already have a keymap and defined minor
mode that you only need to integrate with meow.

This function produces several items:
1. meow-NAME-mode: a minor mode for the state. This is the main entry point.
2. meow-NAME-mode-p: a predicate for whether the state is active.
3. meow-cursor-type-NAME: a variable for the cursor type for the state.
4. meow--update-cursor-NAME: a function that sets the cursor type to 3.
 and face FACE or 'meow-unknown cursor if FACE is nil.

\(fn NAME-SYM DESCRIPTION &rest BODY)" nil t)

(function-put 'meow-define-state 'lisp-indent-function '1)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-helpers" '("meow-")))

;;;***

;;;### (autoloads nil "meow-keymap" "meow-keymap.el" (0 0 0 0))
;;; Generated autoloads from meow-keymap.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-keymap" '("meow-")))

;;;***

;;;### (autoloads nil "meow-keypad" "meow-keypad.el" (0 0 0 0))
;;; Generated autoloads from meow-keypad.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-keypad" '("meow-")))

;;;***

;;;### (autoloads nil "meow-shims" "meow-shims.el" (0 0 0 0))
;;; Generated autoloads from meow-shims.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-shims" '("meow--")))

;;;***

;;;### (autoloads nil "meow-thing" "meow-thing.el" (0 0 0 0))
;;; Generated autoloads from meow-thing.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-thing" '("meow-")))

;;;***

;;;### (autoloads nil "meow-tutor" "meow-tutor.el" (0 0 0 0))
;;; Generated autoloads from meow-tutor.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-tutor" '("meow-")))

;;;***

;;;### (autoloads nil "meow-util" "meow-util.el" (0 0 0 0))
;;; Generated autoloads from meow-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-util" '("meow-")))

;;;***

;;;### (autoloads nil "meow-var" "meow-var.el" (0 0 0 0))
;;; Generated autoloads from meow-var.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-var" '("meow-")))

;;;***

;;;### (autoloads nil "meow-visual" "meow-visual.el" (0 0 0 0))
;;; Generated autoloads from meow-visual.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "meow-visual" '("meow--")))

;;;***

;;;### (autoloads nil nil ("meow-pkg.el" "meow.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; meow-autoloads.el ends here
