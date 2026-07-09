
;; --- early init --- ;;

(defvar emacs/root-dir user-emacs-directory)                           ; set variable for emacs root

(defmacro ri/defpath (name sub)                                        ; macro for defining paths
  (declare (indent defun))
  `(defvar ,name
     (expand-file-name ,sub emacs/root-dir)))

(ri/defpath emacs/init-dir "init/")
(ri/defpath emacs/local-dir "local/")
(ri/defpath emacs/custom-file "local/custom-vars.el")
(setq custom-file (expand-file-name "custom-vars.el" emacs/local-dir))
(setq package-user-dir (expand-file-name "elpa" emacs/local-dir))
(setq user-emacs-directory emacs/local-dir)

(defun ri/add-to-load-path-recursively (path)
  "Add PATH and all its subdirs to the `load-path'."
  (when path
    (let ((default-directory path))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))))

(ri/add-to-load-path-recursively emacs/init-dir)

(when (and (fboundp 'startup-redirect-eln-cache)
           (fboundp 'native-comp-available-p)
           (native-comp-available-p))
  ;; change the eln-cache dir for cleanliness
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name  "var/eln-cache/" emacs/local-dir))))
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
