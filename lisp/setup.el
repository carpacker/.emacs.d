;; setup.el
;; Carson Packer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INITIAL SET UP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initial buffer - TODO
;; (setq initial-buffer-chose string-here)

;; Theme - current is MONOKAI
(load-theme 'monokai t)

;; Font - consolas
(set-frame-font "Consolas" nil t)

;; set-goal-column : ???
(put 'set-goal-column 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DEFAULT MINOR MODES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Line number mode, sets line numbers on the left hand side globally 
(global-linum-mode 1)
(global-hl-line-mode 1)

;; Not sure what this does yet
(transient-mark-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DEFAULT VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; inhibit-stratup-screen TRUE ::  don't display initial startup screen
(setq inhibit-startup-screen t)
;; backup-directory-alist :: Change backup directory to one directory. Future will be implemented
;;  dynamically. Backs up by copying.
(setq backup-directory-alist '(("." . "~/.saves")))
(setq backup-by-copy t)

;; Possibly add in later: delete-old-versions
;(setq delete-old-versions t
;  kept-new-versions 6
;  kept-old-versions 2
;  version-control t)
