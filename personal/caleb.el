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
(global-set-key (kbd "s-g") 'projectile-grep)
