(set-keyboard-coding-system nil)
(setenv "LANG" "en_US.UTF-8")

(setenv "PATH"  (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin"  (getenv "PATH")))

(load "package")

(setq package-list
      '(alchemist
        autopair
        company
        elm-mode
        evil
        evil-leader
        evil-nerd-commenter
        evil-surround
        elixir-mode
        haskell-mode
        helm
        helm-projectile
        js2-mode
        key-chord
        magit
        misc-cmds
        neotree
        paradox
        powerline
        projectile
        rbenv
        rspec-mode
        ruby-mode
        ruby-end
        solarized-theme
        web-mode
        yaml-mode))

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
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
(setq projectile-use-git-grep t)

(global-company-mode 1)
(setq tab-always-indent 'company-complete)

(global-evil-leader-mode 1)
(require 'evil)
(evil-mode 1)

(evil-set-initial-state 'term-mode 'emacs)

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer-and-its-windows (delq (current-buffer) (buffer-list))))

(evil-leader/set-leader ",")
(evil-leader/set-key
  "mx" 'helm-M-x
  "t"  'helm-projectile
  "f"  'helm-projectile-find-file-dwim
  "g"  'helm-projectile-grep
  "cc" 'evilnc-comment-or-uncomment-lines
  "cy" 'evilnc-copy-and-comment-lines
  "reset" 'kill-other-buffers)

(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

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

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1 use-dialog-box nil)
(show-paren-mode t)

(setq auto-save-default nil)
(setq make-backup-files nil)

(setq-default show-trailing-whitespace t)

(require 'autopair)
(autopair-global-mode 1)

(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-to-list 'elixir-mode-hook
   (defun auto-activate-ruby-end-mode-for-elixir-mode ()
     (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
          "\\(?:^\\|\\s-+\\)\\(?:do\\)")
     (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
     (ruby-end-mode +1)))

(setq ruby-insert-encoding-magic-comment nil)

(add-hook 'ruby-mode 'rspec-mode)
(add-to-list 'ruby-mode (setq rspec-use-opts-file-when-available t))
(add-to-list 'ruby-mode (setq rspec-command-options ""))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(set-default-font "Hack 12")
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
