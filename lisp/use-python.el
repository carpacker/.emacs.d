;; Use python packages

;; ELPY enable
; (elpy-enable)

;; JEDI enable
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)  

;; Adding indents for 4
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))
