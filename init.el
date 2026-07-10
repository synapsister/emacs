
 ;; --- init.el --- ;;

(require 'init-elpaca)
(setq ring-bell-function 'ignore     ; disable bell
      use-short-answers t            ; short answers to y/n questions
      use-dialog-box nil             ; no gtk dialogs
      confirm-kill-emacs 'y-or-n-p)  ; prevent accidental emacs kills

(setq make-backup-files nil    ; dont litter
      auto-save-default nil    ; my file
      create-lockfiles nil     ; system tree
      require-final-newline t) ; add newline at the end of file on save

(setq indent-tabs-mode nil           ; indents insert spaces
      tab-width 4                    ; indents insert 4 spaces
      fill-column 100                ; target line width for full columns
      sentence-end-double-space nil) ; improvements for sentence-based commands

(setq scroll-margin 2
      scroll-conservatively 101
      scroll-preserve-screen-position t
      auto-window-vscroll nil)

(setq show-paren-delay 0
      indicate-empty-lines nil
      indicate-buffer-boundaries nil)

(setq read-process-output-max (* 4 1024 1024)
      process-adaptive-read-buffering nil)

(setq enable-recursive-minibuffers t
      minibuffer-depth-indicate-mode t)

(setq which-key-idle-delay 0.1)

(set-frame-font "IosevkaTerm Nerd Font Mono" nil t)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(tab-bar-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative) ; turn relative line numbers on
(delete-selection-mode 1)                  ; when text is selected, inserting a character deletes selection
(column-number-mode 1)                     ; show column number in modeline 
(electric-pair-mode 1)                     ; braces and whatnot spawn a closing variant when opened
(global-auto-revert-mode 1)                ; automatically refresh buffer when files are changed
(pixel-scroll-precision-mode 1)            ; pixel by pixel scrolling
(repeat-mode 1)                            ; certain commands can be repeated 
(global-hl-line-mode 1)                    ; highlights the active line
(which-key-mode)                           ; enable which-key-mode to show shortcuts        
(dolist (hook '(text-mode-hook
            org-mode-hook
            markdown-mode-hook
            message-mode-hook
            help-mode-hook
            Info-mode-hook
            eww-mode-hook))
(add-hook hook #'visual-line-mode))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror 'nomessage))

(require 'init-packages)
(require 'init-configure)
