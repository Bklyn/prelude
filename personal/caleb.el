(setq prelude-guru nil)
(setq sp-use-paredit-bindings nil)
(setq ibuffer-expert t)
(desktop-save-mode 1)
(remove-hook 'prog-mode 'flycheck-mode)

(require 'diminish)

(eval-after-load "diminish"
  '(progn
     (eval-after-load "projectile"
       '(diminish 'projectile-mode "⌕"))))

(require 'undo-tree)
(global-undo-tree-mode 1)

(eval-after-load "diminish"
  '(progn
     (eval-after-load "undo-tree"
       '(diminish 'undo-tree-mode "↺"))))

(eval-after-load "diminish"
  '(progn
     (eval-after-load "whitespace"
       '(diminish 'global-whitespace-mode "ᗣ"))
     (eval-after-load "whitespace"
       '(diminish 'whitespace-mode ""))))

(global-set-key [remap move-beginning-of-line] 'move-beginning-of-line)

(global-set-key (kbd "<f2>") 'rgrep)
(global-set-key (kbd "C-<return>") 'helm-M-x)
(define-key prelude-mode-map (kbd "s-g") nil)

(setq helm-command-prefix-key "C-c h")
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)

;; Unbind C-x C-c when using a display
(if window-system
    (global-unset-key (kbd "C-x C-c")))
