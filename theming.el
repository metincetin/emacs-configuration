(global-hl-line-mode 1)

(set-face-attribute 'hl-line nil :inherit nil :background "gray20")

(define-key special-event-map [config-changed-event] #'ignore)

(use-package standard-themes
  :config
  )
(use-package gruvbox-theme)

;; (use-package reverse-theme
;;   :config
;; 	(set-face-attribute 'hl-line nil :inherit nil :background "gray10")
;; 	(custom-set-faces
;; 		'(ivy-minibuffer-match-face-2 ((t (:background "gray20"))))))
;(load-theme 'standard-themes t)
;;(standard-themes-load-dark)
(load-theme 'gruvbox-dark-soft)

(if (x-list-fonts "Consolas")
    (set-frame-font "Consolas 14" nil t)
    (message "Consolas font is not found. Using default font"))
