;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ORG MODE SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq org-todo-keywords
					;  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))


					; org-support-shift-select here
;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)
