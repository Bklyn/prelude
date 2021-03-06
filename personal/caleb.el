;;; caleb.el --- Personal Emacs customizations

;;; Commentary:

;;; Code:
(setq prelude-guru nil)
(setq sp-use-paredit-bindings nil)
(setq ibuffer-expert t)
(desktop-save-mode 1)
(global-undo-tree-mode -1)

;; Smartparens kinda sucks
(setq smartparens-mode -1)
(add-hook 'prog-mode-hook (lambda () (smartparens-mode -1)) t)
(add-hook 'python-mode-hook (lambda () (anaconda-mode -1)) t)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;; (add-hook 'python-mode-hook 'py-yapf-enable-on-save)
(add-hook 'python-mode-hook 'blacken-mode)
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)

(require 'diminish)

(eval-after-load "diminish"
  '(progn
     (eval-after-load "projectile"
       '(diminish 'projectile-mode "⌕"))))

(eval-after-load "diminish"
  '(progn
     (eval-after-load "whitespace"
       '(diminish 'global-whitespace-mode "ᗣ"))
     (eval-after-load "whitespace"
       '(diminish 'whitespace-mode ""))))

(setq whitespace-line-column nil)
(global-set-key [remap move-beginning-of-line] 'move-beginning-of-line)

(global-set-key (kbd "<f2>") 'rgrep)
(global-set-key (kbd "<XF86Search>") 'projectile-grep)
(global-set-key (kbd "<f6>") 'projectile-compile-project)
(global-set-key (kbd "<XF86Close>") 'projectile-compile-project)
(global-set-key (kbd "<f7>") 'projectile-vc)
(global-set-key (kbd "<f8>") 'vc-dir)
(global-set-key (kbd "<XF86MailForward>") 'vc-dir)

(global-set-key (kbd "C-<return>") 'helm-M-x)
;; (setq helm-command-prefix-key "C-c h")
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "M-x") 'helm-M-x)

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z


(define-key prelude-mode-map (kbd "s-g") nil)

;; Smex all the things!
;; (require 'smex) ; Not needed if you use package.el
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;                   ; when Smex is auto-initialized on its first run.
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Unbind C-x C-c when using a display
(if window-system
    (global-unset-key (kbd "C-x C-c")))

;; From: http://redd.it/2lf4un
;; (setq-default fci-rule-column 80)    ;; Show column ruler at 80 columns
(show-paren-mode 1)                  ;; Always attempt to show matching parentheses
(global-hl-line-mode)                ;; Always highlight the current line
;; (semantic-mode 1)            ;; CEDET holdover
;; (global-ede-mode 1)          ;; CEDET holdover
;; (add-hook 'c-mode-common-hook 'fci-mode)
(add-hook 'c-mode-common-hook 'company-mode)
(add-hook 'prelude-prog-mode-hook 'linum-mode t)
;; (add-hook 'c-mode-common-hook 'hs-minor-mode)
;; (add-hook 'c-mode-common-hook 'hideshowvis-minor-mode)

;; (Conditional) C/C++ Keybinds
(add-hook 'c-mode-common-hook
          (lambda () (local-set-key (kbd "<C-tab>") 'company-complete)))
(add-hook 'c-mode-common-hook
          (lambda () (local-set-key (kbd "C-c j") 'find-tag)))

;; See https://github.com/bbatsov/projectile/issues/523
(setq projectile-mode-line " Projectile")

;; This hook is super-annoying:
(remove-hook 'find-file-hook 'prelude-reopen-as-root)

;; I use underscore to mean underscore in my org-mode files
(setq org-export-with-sub-superscripts nil)

;; Jesus christ, company + shell scripts is a mess
(setq company-global-modes '(not shell-script-mode))

;; From https://eklitzke.org/smarter-emacs-clang-format.  Enable
;; clang-format if the Projectile root has a .clang-format
(require 'f)
(defun clang-format-buffer-smart ()
  "Reformat buffer if .clang-format exists in the projectile root."
  (when (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
    (clang-format-buffer)))

(defun clang-format-buffer-smart-on-save ()
  "Add auto-save hook for clang-format-buffer-smart."
  (add-hook 'before-save-hook 'clang-format-buffer-smart nil t))

(add-hook 'c-mode-common-hook 'clang-format-buffer-smart-on-save t)

;; Start the server
(server-start)
