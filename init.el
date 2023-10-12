(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
)

(require 'use-package)


(setq use-package-always-ensure 't)

(toggle-frame-fullscreen)


(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(drag-stuff swiper standard-themes magit-section magit typescript-mode evil-mc multiple-cursors multiple-cursor ivy evil-escape vterm-toggle vterm reverse-theme git-gutter git-gutter+ diff-hl evil-collection haxe-mode battle-haxe expand-region iedit which-key flycheck csharp-mode lsp-ivy lsp-ui avy counsel ace-jump-mode beacon projectile general lsp-mode company vertico evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-face-2 ((t (:background "gray20")))))



;; loading themes. first things first
(when (display-graphic-p)
	(load "~/.emacs.d/theming.el"))


(use-package cc-mode)


(use-package beacon)

(use-package expand-region)
(use-package projectile)
(use-package ivy)
(use-package expand-region)

(use-package csharp-mode)
(use-package typescript-mode)
(use-package lsp-ivy)
(use-package drag-stuff)

(use-package magit)


(use-package company
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.05))

(use-package vterm)
(use-package vterm-toggle
  :config
	(setq vterm-toggle-fullscreen-p nil)
	(add-to-list 'display-buffer-alist
				'((lambda (buffer-or-name _)
					(let ((buffer (get-buffer buffer-or-name)))
						(with-current-buffer buffer
						(or (equal major-mode 'vterm-mode)
							(string-prefix-p vterm-buffer-name (buffer-name buffer))))))
					(display-buffer-reuse-window display-buffer-at-bottom)
					;;(display-buffer-reuse-window display-buffer-in-direction)
					;;display-buffer-in-direction/direction/dedicated is added in emacs27
					;;(direction . bottom)
					;;(dedicated . t) ;dedicated is supported in emacs27
					(reusable-frames . visible)
					(window-height . 0.3)))
  )

(use-package lsp-mode
  :hook (c-mode . lsp)
  :hook (c++-mode . lsp)
  :hook (csharp-mode . lsp)
  :commands lsp)

(use-package lsp-ui)
(use-package flycheck)

(use-package avy)

(use-package iedit)
(use-package which-key
	:config
	(which-key-mode 1))

(if (string= (getenv "VANILLA") "1")
	(load "~/.emacs.d/vanilla-config.el")
    (use-package evil
		:init
		(setq evil-want-integration t)
		(setq evil-want-keybinding nil)
		:config
		(evil-mode 1)
		(define-key evil-motion-state-map " " nil)
		(load "~/.emacs.d/evil-config.el")
	)


	(use-package evil-escape
		:after evil
		:config
		(evil-escape-mode 1))
	(use-package evil-collection
		:after evil
		:config
		(evil-collection-init))
)



(setq inhibit-startup-message t)
(setq visible-bell nil)



(electric-pair-mode 1)



(beacon-mode 1)
(projectile-mode 1)
(ivy-mode 1)

(global-display-line-numbers-mode 1)
(global-company-mode)
(recentf-mode 1)





(setq compilation-always-kill t)
(setq compilation-ask-about-save nil)



;; IEDIT

(defun iedit-escape
    (interactive)
    (iedit-mode -1)
)


(define-key iedit-mode-keymap (kbd "<escape>") 'iedit-escape)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



(defun open-config-file ()
    "Open configuration file"
    (interactive)
    (let ((buffer (find-file-noselect "~/.emacs.d/init.el")))
      (switch-to-buffer buffer))
)



;(setq-default tab-width 4)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old








;; This isn't really a package, it just provides a `haxe-mode' to work with
(use-package haxe-mode
  :mode ("\\.hx\\'" . haxe-mode)
  :no-require t
  :init
  (require 'js)
  (define-derived-mode haxe-mode js-mode "Haxe"
    "Haxe syntax highlighting mode. This is simply using js-mode for now."))

(use-package battle-haxe
  :hook (haxe-mode . battle-haxe-mode)
  :bind (("S-<f4>" . #'pop-global-mark) ;To get back after visiting a definition
         :map battle-haxe-mode-map
         ("<f4>" . #'battle-haxe-goto-definition)
         ("<f12>" . #'battle-haxe-helm-find-references))
  :custom
  (battle-haxe-yasnippet-completion-expansion t "Keep this if you want yasnippet to expand completions when it's available.")
  (battle-haxe-immediate-completion nil "Toggle this if you want to immediately trigger completion when typing '.' and other relevant prefixes."))


