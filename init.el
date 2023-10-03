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
   '(evil-mc multiple-cursors multiple-cursor ivy evil-escape vterm-toggle vterm reverse-theme git-gutter git-gutter+ diff-hl evil-collection haxe-mode battle-haxe expand-region iedit which-key flycheck csharp-mode lsp-ivy lsp-ui avy counsel ace-jump-mode beacon projectile general lsp-mode company vertico evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-face-2 ((t (:background "gray20")))))



;; loading themes. first things first
(load "~/.emacs.d/theming.el")


(use-package cc-mode)
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-motion-state-map " " nil)
)

(use-package beacon)
(use-package evil-escape)
(use-package expand-region)
(use-package projectile)
(use-package ivy)
(use-package vertico)
(use-package expand-region)


(use-package company)
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

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
(use-package which-key
  :config
  (which-key-mode 1))
(use-package evil-collection)
(use-package lsp-ivy)
(use-package avy)

(use-package iedit)



(setq inhibit-startup-message t)
(setq visible-bell nil)








(electric-pair-mode 1)

(evil-escape-mode 1)


(beacon-mode 1)
(projectile-mode 1)
(ivy-mode 1)

(global-display-line-numbers-mode 1)
(global-company-mode)
(vertico-mode 1)
(recentf-mode 1)




(setq-default evil-escape-key-sequence "aü")
(setq-default evil-escape-delay 0.2)

(global-set-key "\M-f" 'find-file)


(define-key evil-motion-state-map (kbd "SPC SPC") 'execute-extended-command)

; Navigation
(define-key evil-motion-state-map (kbd "SPC j j") 'avy-goto-char)

; Files
(define-key evil-motion-state-map (kbd "SPC f f") 'find-file)
(define-key evil-motion-state-map (kbd "SPC f d") 'dired)
(define-key evil-motion-state-map (kbd "SPC f e d") 'open-config-file)

; Windowing
(define-key evil-motion-state-map (kbd "SPC w s v") 'split-window-vertically)
(define-key evil-motion-state-map (kbd "SPC w s h") 'split-window-horizontally)
(define-key evil-motion-state-map (kbd "SPC w a") 'delete-other-windows)
(define-key evil-motion-state-map (kbd "SPC w o") 'other-window)
(define-key evil-motion-state-map (kbd "SPC w l") 'evil-window-right)
(define-key evil-motion-state-map (kbd "SPC w h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "SPC w j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "SPC w k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "SPC w x") 'delete-window)

; Search
(evil-define-key 'motion lsp-mode-map (kbd "SPC s s") 'lsp-ivy-workspace-symbol)

; Edit
(evil-define-key 'motion 'global (kbd "SPC s i") 'iedit-mode)

; Selection
(define-key evil-motion-state-map (kbd "SPC k k") 'er/expand-region)
(define-key evil-motion-state-map (kbd "SPC k \"") 'er/mark-inside-quotes)
(define-key evil-motion-state-map (kbd "SPC k p") 'er/mark-inside-pairs)


; buffers
(define-key evil-motion-state-map (kbd "SPC b x") 'kill-this-buffer)
(define-key evil-motion-state-map (kbd "SPC b p") 'previous-buffer)
(define-key evil-motion-state-map (kbd "SPC b n") 'next-buffer)

(define-key evil-motion-state-map (kbd "SPC b b") 'ivy-switch-buffer)


; Compilation

(define-key evil-motion-state-map (kbd "SPC c r") 'compile)

; Tools

(define-key evil-motion-state-map (kbd "SPC t t") 'vterm-toggle)


;; PROJECTILE
(define-key evil-motion-state-map (kbd "SPC p p") 'projectile-recentf)
(define-key evil-motion-state-map (kbd "SPC p r") 'projectile-recentf)
(define-key evil-motion-state-map (kbd "SPC p f") 'projectile-find-file)
(define-key evil-motion-state-map (kbd "SPC p d") 'projectile-dired)
(define-key evil-motion-state-map (kbd "SPC j j") 'avy-goto-char)


;; IEDIT

(defun iedit-escape
    (interactive)
    (iedit-mode -1)
)


(define-key iedit-mode-keymap (kbd "<escape>") 'iedit-escape)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(with-eval-after-load 'company-mode
    (define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
    (define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
)

(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))

(define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)

(define-key evil-motion-state-map (kbd "SPC f r") 'recentf-open-files)

(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)

(defun open-config-file ()
    "Open configuration file"
    (interactive)
    (let ((buffer (find-file-noselect "~/.emacs.d/init.el")))
      (switch-to-buffer buffer))
)


(require 'lsp-mode)
(add-hook 'csharp-mode-hook #'lsp)
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'lsp-mode
    (define-key evil-motion-state-map (kbd "SPC l") lsp-command-map)
    (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(setq-default tab-width 4)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old




;; relative numbers for visual, absolute number for edit
(defun my/display-set-relative ()
  (setq display-line-numbers 'relative))     ; or 'visual

(defun my/display-set-absolute ()
  (setq display-line-numbers t))


(add-hook 'evil-insert-state-entry-hook #'my/display-set-absolute)
(add-hook 'evil-insert-state-exit-hook #'my/display-set-relative)


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


(evil-collection-init 'term)
