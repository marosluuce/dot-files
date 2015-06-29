(set-keyboard-coding-system nil)

(setenv "PATH"  (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin"  (getenv "PATH")))

(load "package")

(setq package-list '(alchemist
		     autopair
		     company
		     evil
		     evil-leader
		     evil-nerd-commenter
		     evil-surround
		     elixir-mode
		     helm
		     helm-projectile
		     js2-mode
		     neotree
		     paradox
		     projectile
		     rbenv
		     rspec-mode
		     ruby-mode
		     solarized-theme
		     web-mode))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)

(require 'projectile)
(require 'helm-projectile)
(helm-projectile-on)

(global-company-mode 1)
(setq tab-always-indent 'company-complete)

(global-evil-leader-mode 1)
(require 'evil)
(evil-mode 1)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "mx" 'execute-extended-command
  "t"  'helm-projectile
  "f"  'helm-projectile-find-file-dwim
  "g"  'helm-projectile-grep
  "cc" 'evilnc-comment-or-uncomment-lines
  "cy" 'evilnc-copy-and-comment-lines)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'neotree)
(global-set-key [f1] 'neotree-toggle)
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq tab-width 2
      indent-tabs-mode nil)


(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq-default show-trailing-whitespace t)

(require 'autopair)
(autopair-global-mode 1)

(add-hook 'js-mode-hook (setq js-indent-level 2))

(add-hook 'elixir-mode-hook 'alchemist-mode)

(require 'rspec-mode)

(set-default-font "Monaco 12")
(load-theme 'solarized-light t)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
