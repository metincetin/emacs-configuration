(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "M-g f") 'avy-goto-line)



(if (string= (getenv "GOD_MODE") "1")
    (use-package "god-mode"
      :config
      (god-mode-all)
      (global-set-key (kbd "<escape>") #'god-local-mode)
      (define-key god-local-mode-map (kbd "C-i") #'god-local-mode)
      (setq god-exempt-major-modes nil)
      (setq god-exempt-predicates nil)
      

      (custom-set-faces
       '(god-mode-lighter ((t (:inherit error)))))
      (defun my-god-mode-update-cursor-type ()
	(setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))
      (add-hook 'post-command-hook #'my-god-mode-update-cursor-type)
))
