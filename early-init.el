
;; --- early init --- ;;

(setq package-enable-at-startup nil)                    ; disable package.el

(setq inhibit-startup-screen t                          ; disable splash message
      inhibit-startup-message t                         ; disable splash message
      inhibit-startup-echo-area-message user-login-name ; disable "for information about gnu emacs..." text
      initial-scratch-message nil                       ; disable scratch buffer message
      initial-major-mode 'fundamental-mode)             ; scratch opens as plain buffer
(setq default-frame-alist                   
      (append '((menu-bar-lines . 0)        ; no menu bar
                (tool-bar-lines . 0)        ; no tool bar
                (vertical-scroll-bars)      ; no scroll bars
                (horizontal-scroll-bars)    ; no scroll bars
                (internal-border-width . 0) ; no padding
                (fullscreen . maximized))   ; maximize frame
              default-frame-alist))

(setq-default truncate-lines t)                ; default to truncating lines for most buffers
(setq truncate-partial-width-windows nil       ; wrapping for split windows
      fast-but-imprecise-scrolling t           ; performant scrolling in heavy buffers
      redisplay-skip-fontification-on-input t) ; handle inputs faster in heavy buffers

(setq native-comp-async-report-warnings-errors 'silent ; silence warnings buffer
      native-comp-jit-compilation t)                   ; enable jit

(setq load-prefer-newer t) ; load newer .el over older .elc

(setq load-suffixes (remove ".so" load-suffixes)) ; remove .so from load-suffixes to reduce file operations during load

(setq-default bidi-display-reordering 'left-to-right   
              bidi-paragraph-direction 'left-to-right) ; disable bidirectional text scanning 
(setq bidi-inhibit-bpa t)                              ; for performance


(setq frame-inhibit-implied-resize t) ; prevent flickering during resize

(setq inhibit-compacting-font-caches t) ; prevent font cache compaction for better performance

(setq gc-cons-threshold most-positive-fixnum ; increase gc threshold during startup for faster loading
      gc-cons-percentage 0.6)                ; gcmh-mode (loaded in init.el) handles GC during idle time
