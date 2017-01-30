;; put line numbers on all buffers
(global-linum-mode t)

;; set color theme
(add-to-list `custom-theme-load-path  "~/.emacs.d/themes/")
(load-theme 'ld-dark t)
(enable-theme 'ld-dark)

;; Additional changes
(setq frame-title-format "emacs")
(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(column-number-mode)
(show-paren-mode)
(toggle-frame-fullscreen)

;; end of file
(provide 'appearance)
