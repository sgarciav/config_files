;;; key-bindings.el --- All information related to key bindings.

;;; Commentary:

;;; Code:

;; search and replace
(global-set-key (kbd "M-s") 'query-replace)

;; point cursor to beginning of buffer
(global-set-key (kbd "M-q") 'beginning-of-buffer)
(global-set-key (kbd "M-z") 'end-of-buffer)

;; access shell
(global-set-key (kbd "C-z") 'shell)

;; smex
(global-set-key (kbd "M-x") 'smex)

;; undo-tree
(global-set-key (kbd "M-/") 'undo-tree-visualize)

;; switch-window
(global-set-key (kbd "M-C-z") 'switch-window)

;; iedit
(global-set-key (kbd "C-c ;") 'iedit-mode)
(global-set-key [double-mouse-1] 'iedit-mode)

;; split window below
(global-set-key [mouse-3] 'split-window-below)

;; comment and uncomment region
(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "C-x \S-c") 'uncomment-region)

;; show flycheck error
(global-set-key (kbd "C-x e") 'flycheck-list-errors)

;; yank / paste
(global-set-key (kbd "C-v") 'yank)

;; backtab
; TODO

;; end of file
(provide 'key-bindings)
;;; key-bindings.el ends here