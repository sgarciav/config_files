;;; appearance.el --- All information related to emacs's appearance

;;; Commentary:

;;; Code:

;; put line numbers on all buffers
(global-linum-mode t)

;; set color theme
(add-to-list `custom-theme-load-path  "~/.emacs.d/themes/")
(load-theme 'clarity t)
(enable-theme 'clarity)

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
;;; appearance.el ends here
