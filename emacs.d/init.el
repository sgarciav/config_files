;;; init.el --- Global settings

;;; Commentary: 

;;; Code:
;; add settings directory to load path
(add-to-list 'load-path "~/.emacs.d/settings")

;; setup extra config files (in settings directory)
(require 'appearance)
(require 'key-bindings)
(require 'packages)
(require 'bash-completion)

;; Enable ido-mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Enable undo-tree-mode
(require 'undo-tree)
(global-undo-tree-mode)

;; initialize auto complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; initialize yasnippet (to create templates for my c and c++ functions)
(require 'yasnippet)
(yas-global-mode 1)

;; initialize flycheck mode
(require 'flycheck)
(require 'seq)
(global-flycheck-mode)
(setq-default flycheck-emacs-lisp-load-path 'inherit)

;; autoload bash-completion for shell-mode
(autoload 'bash-completion-dynamic-complete "bash-completion" "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions 'bash-completion-dynamic-complete)

;; make backup to a designated dir, mirroring the full path
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
         (backupRootDir "~/.emacs.d/emacs-backup/")
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, ⁖ “C:”
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
         )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
    )
  )

(setq make-backup-file-name-function 'my-backup-file-name)

;; end of file
(provide 'init)
;;; init.el ends here
