(require 'package)

(push '("melpha" . "http://melpa.org/packages/") package-archives)
(push '("org" . "http://orgmode.org/elpa/") package-archives)
(push '("melpa-stable" . "https://stable.melpa.org/packages/") package-archives)

(package-initialize)

(defun jarvis-reinstall-packages-core()
  (unless package-archive-contents (package-refresh-contents))

  (setq bootstrap-list
	'(use-package))

  (dolist (package bootstrap-list)
    (unless (package-installed-p package)
      (package-install package))))

(defun jarvis-reinstall-packages ()
  (interactive) (jarvis-reinstall-packages-core))

(jarvis-reinstall-packages-core)

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))
(use-package evil-leader
  :ensure t
  :config

  (defun fancy ()
    (interactive)
    (message "fancy"))

  (defun dragon-ruby()
    (interactive)
    ;(switch-to-buffer "C:\Users\Sahil\Coding\Ruby\dragonruby-windows\dragonruby-windows"))
    (message "dragon ruby"))
  
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "g" 'say-goodbye
    "d" 'dragon-ruby
    "f" 'fancy
    "s" 'say-something))
(use-package evil-escape :ensure t)

(global-linum-mode t)
(setq x-select-enable-clipboard t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
    "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'spolsky t)

(add-to-list 'default-frame-alist
	     '(font . "Office Code Pro"))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(ido-mode 1)
(setq ido-separator "\n")

;(require 'js2-mode)
; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

; (add-hook 'js2-mode-hook #js2-imenu-extras-mode)

;(require 'js2-refractor)
; (add-hook 'js2-mode-hook #'js2-refractor-mode)

;; (custom-set-variables
;;  '(jdee-server-dir "/Users/Sahil/AppData/Roaming/.emacs.d/elpa/jdee-server-master")) 

(setq org-log-done 'time)

(require 'org)
 (define-key global-map "\C-cl" 'org-store-link)
 (define-key global-map "\C-ca" 'org-agenda)
 (setq org-log-done t)

(setq default-directory "C:/Users/Sahil/Coding/")





(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;(load-library "font-lock+")
;(load-library "font-lock")


;(require 'font-lock)
;(require 'font-lock+)
;(use-package 'all-the-icons)
;(use-package 'all-the-icons-dired)
;  :hook (dired-mode . all-the-icons-dired-mode))

;(setq inhibit-compacting-font-caches t)

(defun my/dashboard-banner ()
  (setq dashboard-banner-logo-title
	(format "Emacs ready in %.2f seconds with %d garbage collections."
		(float-time (time-subtract after-init-time before-init-time)) gcs-done)))

(use-package dashboard
    :init
    (add-hook 'after-init-hook 'dashboard-refresh-buffer)
    (add-hook 'dashboard-mode-hook 'my/dashboard-banner)
    :ensure t
    :config
    (setq dashboard-startup-banner 'logo)
    (dashboard-setup-startup-hook))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;(setq dashboard-center-content t)

(setq dashboard-items '((recents . 5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)))

;(setq dashboard-set-heading-icons t)
;(setq dashboard-set-file-icons t)

(add-to-list 'dashboard-items '(agenda) t)

;(setq show-week-agenda-p t)

(setq dashboard-show-shortcuts nil)

;(setq dashboard-startup-banner "/Users/Sahil/Downloads/ironmanbanner.png")

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-emacs-theme)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))
