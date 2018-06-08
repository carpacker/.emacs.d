;; Carson Packer
;; init.el


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

(require 'monokai-theme)

; Custom sets: added automatically, don't edit by hand
(custom-set-variables
 '(package-selected-packages
   (quote
    (company-jedi elpy monokai-theme org-agenda-property use-package))))
(custom-set-faces
 )

;;;;;;;;;;;;;

;; I don't know yet
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
(defun active-config-directory ()
  "Where active package configurations are kept."
  (format "%slisp/" user-emacs-directory))

(defun load-use-file (name)
  "Load a use file NAME expect an error if it doesn't map to an existing file."
  (let (file)
    (setq file (concat (active-config-directory) name))
    (unless (or (equal name ".") (equal name ".."))
      (message "Using config: %s" file)
      (if (file-exists-p file)
          (load-file file)
        (message "Warning: %s doesn't exist" file)))))

(dolist (use-file
         (directory-files (active-config-directory)))
(load-use-file use-file))



