 
;; --- init-configure.el -- ;;

;; this file configures newly installed packages; builtin packages are configured inside init.el

(require 'meow) ; load meow-edit
(add-hook 'after-init-hook 'global-company-mode)

(gcmh-mode 1) ; enable gcmh mode

(load-theme 'base16-chalk t) ; load chalk theme

(vertico-mode) ; enable vertico-mode
(setq vertico-count 40)

(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles partial-completion)))
      completion-pcm-leading-wildcard t)

(setq eat-query-before-killing-running-terminal nil)
(setq eat-shell (or (executable-find "zsh") eat-shell))

  (let ((auto-save-dir (no-littering-expand-var-file-name "auto-save/")))
    (make-directory auto-save-dir t)
    (setq auto-save-file-name-transforms
             `(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'"
                ,(concat (file-name-as-directory temporary-file-directory) "\\2") t)
               ("\\`/tmp\\([^/]*/\\)*\\(.*\\)\\'" "\\2")
               ("\\`/dev/shm\\([^/]*/\\)*\\(.*\\)\\'" "\\2")
               ("." ,auto-save-dir t))))

  (let ((backup-dir (no-littering-expand-var-file-name "backup/")))
    (make-directory backup-dir t)
    (setq backup-directory-alist
             `(("\\`/tmp/" . nil)
               ("\\`/dev/shm/" . nil)
               ("." . ,backup-dir))))
;; keybinds

(global-set-key (kbd "C-c c") 'company-manual-begin)

(global-set-key (kbd "C-c v") 'eat-other-window)  ; open eat in a splice

(global-set-key (kbd "C-c t") 'tab-bar-new-tab)
(global-set-key (kbd "C-c d") 'tab-bar-switch-to-next-tab)
(global-set-key (kbd "C-c a") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "C-S-c t") 'tab-bar-close-tab-by-name)

(setq meow-expand-hint-remove-delay 0.1)
(setq meow-keypad-describe-delay 0.1)
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-define-key

   '("s" . meow-next)
   '("w" . meow-prev)
   '("<escape>" . ignore))

  (meow-leader-define-key
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))

  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)

   ;; -- navigation -- ;;
   ; uses wasd navigation because im used to it

   '("a" . meow-left)
   '("A" . meow-left-expand)
   '("q" . meow-insert)
   '("s" . meow-next)
   '("S" . meow-next-expand)
   '("w" . meow-prev)
   '("W" . meow-prev-expand)
   '("d" . meow-right)
   '("D" . meow-right-expand)

   ;; -- text insertion -- ;;

   '("o" . meow-append)
   '("O" . meow-open-below)
   '("i" . meow-insert)
   '("I" . meow-open-above)

   ;; -- undo-redo via undo-fu.el -- ;;
   
   '("u" . undo-fu-only-undo)
   '("U" . undo-fu-only-redo)

   ;; -- escape exits the mode -- ;;
   
   '("<escape>" . ignore)))

(meow-setup)
(meow-global-mode 1)

(provide 'init-configure)
