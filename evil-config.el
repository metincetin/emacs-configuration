
(setq-default evil-escape-key-sequence "aü")
(setq-default evil-escape-delay 0.2)

(global-set-key "\M-f" 'find-file)


(define-key evil-motion-state-map (kbd "SPC SPC") 'execute-extended-command)

; Navigation
(define-key evil-motion-state-map (kbd "SPC j j") 'avy-goto-char)

(add-hook 'c-mode-common-hook
  (lambda() 
	(define-key evil-motion-state-map (kbd "SPC f o") 'ff-find-other-file)))

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


(defun projectile-compile-and-run()
  (interactive)
  (projectile-compile-project  )
  (projectile-run-project))

(define-key evil-motion-state-map (kbd "SPC c r") 'projectile-run-project)
(define-key evil-motion-state-map (kbd "SPC c c") 'projectile-compile-project)
(define-key evil-motion-state-map (kbd "SPC c m") 'projectile-compile-and-run)


; Tools

(define-key evil-motion-state-map (kbd "SPC t t") 'vterm-toggle)


(with-eval-after-load 'company-mode
    (define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
    (define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
)

(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))

(define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)


;; PROJECTILE
(define-key evil-motion-state-map (kbd "SPC p p") 'projectile-recentf)
(define-key evil-motion-state-map (kbd "SPC p r") 'projectile-recentf)
(define-key evil-motion-state-map (kbd "SPC p f") 'projectile-find-file)
(define-key evil-motion-state-map (kbd "SPC p d") 'projectile-dired)
(define-key evil-motion-state-map (kbd "SPC j j") 'avy-goto-char)


(define-key evil-motion-state-map (kbd "SPC f r") 'recentf-open-files)

(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
(setq evil-emacs-state-modes nil)


(with-eval-after-load 'lsp-mode
    (define-key evil-motion-state-map (kbd "SPC l") lsp-command-map)
    (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))


;; relative numbers for visual, absolute number for edit
(defun my/display-set-relative ()
  (setq display-line-numbers 'relative))     ; or 'visual

(defun my/display-set-absolute ()
  (setq display-line-numbers t))


(add-hook 'evil-insert-state-entry-hook #'my/display-set-absolute)
(add-hook 'evil-insert-state-exit-hook #'my/display-set-relative)
