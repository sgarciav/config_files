;;; key-bindings.el --- All information related to key bindings.

;;; Commentary:

;;; Code:

;; search and replace
(global-set-key (kbd "M-s") 'query-replace)

;; point cursor to beginning of buffer
(global-set-key (kbd "M-1") 'beginning-of-buffer)
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
(global-set-key (kbd "C-c i") 'iedit-mode)
(global-set-key (kbd "C-c ;") 'iedit-mode)
(global-set-key [double-mouse-1] 'iedit-mode)

;; split window below
(global-set-key [mouse-3] 'split-window-below)

;; show flycheck error
(global-set-key (kbd "C-x e") 'flycheck-list-errors)

;; yank / paste
(global-set-key (kbd "C-v") 'yank)

;; Helm Configuration

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-x \S-h". Note: We must set "C-x \S-h" globally,
;; because we cannot change `helm-command-prefix-key' once
;; `helm-config' is loaded.
;;(global-set-key (kbd "C-x \S-h") 'helm-command-prefix)
;;(global-unset-key (kbd "C-x c"))
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; comment and uncomment region
(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "C-x \S-c") 'uncomment-region)

;; end of file
(provide 'key-bindings)
;;; key-bindings.el ends here
