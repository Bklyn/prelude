;; Change C headers to be treater as C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Treat Slice files as IDL
(add-to-list 'auto-mode-alist '("\\.ice\\'" . idl-mode))

;; Style mode hook for C++
(c-add-style "snail-cpp-style"
             '((c-tab-always-indent        . t)
               (indent-tabs-mode . nil)
               (c-basic-offset . 4)
               (c-comment-only-line-offset . 4)
               (c-hanging-braces-alist     . ((substatement-open after)
                                              (brace-list-open)))
               (c-hanging-colons-alist     . ((member-init-intro before)
                                              (inher-intro)
                                              (case-label after)
                                              (label after)
                                              (access-label after)))
               (c-cleanup-list             . (scope-operator
                                              empty-defun-braces
                                              space-before-funcall
                                              defun-close-semi))
               (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                              (substatement-open . 0)
                                              (inmodule          . 0)
                                              (case-label        . +)
                                              (block-open        . 0)
                                              (innamespace       . 0)
                                              (inextern-lang     . 0)
                                              (comment-intro     . 0)
                                              (inline-open       . 0)
                                              (knr-argdecl-intro . -)))
               ))

(defun snail-style-c++-mode-hook ()
  (c-set-style "snail-cpp-style")
  ;; (auto-fill-mode)
  (c-toggle-auto-hungry-state 1)
  (c-toggle-electric-state 1)
  (c-toggle-auto-newline -1))

;; (add-hook 'c++-mode-hook 'snail-style-c++-mode-hook)
(add-hook 'prelude-c-mode-common-hook 'snail-style-c++-mode-hook)
(add-hook 'prelude-c-mode-common-hook 'ggtags-mode)

;; Use C++ style for IDL files
(add-hook 'idl-mode-hook 'snail-style-c++-mode-hook)

;; (sp-local-pair 'c-mode "(" nil :pre-handlers '(:rem " "))
;; (sp-local-pair 'c++-mode "(" nil :pre-handlers '(:rem " "))
