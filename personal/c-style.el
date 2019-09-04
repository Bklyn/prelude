;; Change C headers to be treater as C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Treat Slice files as IDL
(add-to-list 'auto-mode-alist '("\\.ice\\'" . idl-mode))

;; (add-hook 'prelude-c-mode-common-hook 'snail-style-c++-mode-hook)
(add-hook 'prelude-c-mode-common-hook 'ggtags-mode)

(add-hook 'prelude-c-mode-common-hook 'google-set-c-style)
(add-hook 'idl-mode-hook 'google-set-c-style)

;; (sp-local-pair 'c-mode "(" nil :pre-handlers '(:rem " "))
;; (sp-local-pair 'c++-mode "(" nil :pre-handlers '(:rem " "))
