;; Carson Packer
   ;; init.el
;;; Top level initialization file for emacs

;; Load paths 
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/themes")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))

  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  
  ;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)

  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Custom sets: added automatically, don't edit by hand
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages
   (quote
    (font-lock-studio jedi elpygen company-jedi elpy monokai-theme org-agenda-property use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822" :family "Consolas" :foundry "outline" :slant normal :weight normal :height 98 :width normal)) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C" :family "Consolas" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 '(font-lock-function-name-face ((t (:foreground "#A6E22E"))))
 '(font-lock-variable-name-face ((t (:foreground "lavender")))))

			
;;;;;;;;;;;;;

;; Add packages to list
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-verbose t)
(setq use-package-always-ensure t)

;; Load lisp directory
(setq active-directory-files (list "~/.emacs.d/lisp/"))

;; Not sure yet
(defun active-config-directory ()
  "Where active package configurations are kept."
  (format "%slisp/" user-emacs-directory))

;; Note sure yet
(defun load-use-file (name)
  "Load a use file NAME expect an error if it doesn't map to an existing file."
  (let (file)
    (setq file (concat (active-config-directory) name))
    (unless (or (equal name ".") (equal name ".."))
      (message "Using config: %s" file)
      (if (file-exists-p file)
          (load-file file)
        (message "Warning: %s doesn't exist" file)))))

;; Load each lisp file to be executed
(dolist (use-file
         (directory-files (active-config-directory)))
  (load-use-file use-file))

;; Add custom hooks, move elsewhere in a bit:
;; Last to do:
;; 20.0 formats the . to purple
;; final keywords like >=, >, <=, <, /, * and so on, @, &, %, ^
;; Tuple and list brackets colore dto differentiate
;; Color initialize strings/ints based on type for convinience
(defface test-defaults
  '(( t :foreground "white"))
  "test face."
  :group 'python-mode)
(defvar test-defaults 'test-defaults)
(defface function-name
  '((t :foreground "#FD971F"))
  "Intended function name face."
  :group 'python-mode)
(defvar function-name 'function-name)
;; Gotta do: class name, class inputs, fix comma workaround,
(add-hook 'python-mode-hook
	  (lambda()
	    (font-lock-add-keywords nil
				    '(("def\\|class" 0
				       font-lock-type-face append)
				      ("\\+\\|-\\|=\\|%\\|@\\|\\^\\|&\\|\\*\\|>\\|<\\|\\\\" 0 font-lock-builtin-face append)
				      ("\\([[:word:]]\\|_\\)+\\(?5:,\\)" 5 test-defaults)
				      ("\\_<def[[:space:]]+\\(\\(?2:[[:word:]]\\|_\\)+\\)(\\(?5:\\([[:word:]]\\|_\\)+\\(,[[:space:]]\\([[:word:]]\\|_\\)+\\)*\\)" 5  function-name append)
				      ("\\_<class[[:space:]]+\\(\\(?:[[:word:]]\\|_\\)+\\)(\\(?5:\\([[:word:]]\\|_\\)+\\(,[[:space:]]\\([[:word:]]\\|_\\)+\\)*\\)" 5  font-lock-function-name-face append)
				      ("\\([[:digit:]]+\\|[[:digit:]]+\\.[[:digit:]]+\\)" 0 font-lock-constant-face append)
				      ("\\_<\\(def\\|class\\)[[:space:]]\\(?3:\\([[:word:]]\\|_\\)+\\)" 3 font-lock-function-name-face append)
				      ("\\(?3:\\([[:word:]]\\|_\\)+\\)(" 3 font-lock-type-face append)))))
