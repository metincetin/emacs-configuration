
(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :inherit nil :background "gray18")

(define-key special-event-map [config-changed-event] #'ignore)

(load-theme 'deeper-blue t)

(set-frame-font "Consolas 14" nil t)
