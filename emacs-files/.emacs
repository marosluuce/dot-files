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
		     ruby-mode
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

(global-company-mode 1)

(global-evil-leader-mode 1)
(require 'evil)
(evil-mode 1)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "mx" 'execute-extended-command
  "t"  'helm-projectile
  "f"  'helm-projectile-find-file-dwim
  "cc" 'evilnc-comment-or-uncomment-lines
  "cy" 'evilnc-copy-and-comment-lines)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'neotree)
(global-set-key [f1] 'neotree-toggle)

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq tab-width 2
      indent-tabs-mode nil)

(setq make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq-default show-trailing-whitespace t)

(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex$" . web-mode))

(require 'autopair)
(autopair-global-mode 1)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))

(defun js-custom ()
  "js-mode-hook"
    (setq js-indent-level 2))

(add-hook 'js-mode-hook 'js-custom)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
