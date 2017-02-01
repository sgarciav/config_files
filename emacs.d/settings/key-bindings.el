;; search and replace
(global-set-key (kbd "M-s") 'query-replace)

;; point cursor to beginning of buffer
(global-set-key (kbd "M-q") 'beginning-of-buffer)

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

;; comment and uncomment region
(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "C-x \S-c") 'uncomment-region)

;; backtab
; TODO

;; end of file
(provide 'key-bindings)
