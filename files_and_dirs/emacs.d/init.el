;;; init.el --- Global settings

;;; Commentary:

;;; Code:
;; add settings directory to load path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/settings")
(require 'packages)

;; Helm Configuration for searching files (replaces ido-mode)
;;(require 'helm)
;;(require 'helm-config)

;;(global-set-key (kbd "M-x") 'helm-M-x)
;;(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
;;(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;;(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;;(define-key helm-map (kbd "C-a")  'helm-select-action) ; list actions using

;; setup extra config files (in settings directory)
(require 'appearance)
(require 'key-bindings)
(require 'bash-completion)
(require 'latex-emacs-okular)

;; Enable ido-mode
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; cmake mode
(require 'cmake-mode)
(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
;; (add-to-list 'auto-mode-alist '("\\CMakeLists\\.txt\\'" . cmake-mode))

;; Enable undo-tree-mode
(require 'undo-tree)
(global-undo-tree-mode)

;; Enable org-mode when you create/open a *.org file
;; See: https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(setq org-directory "~/git-repos/private/org")
(setq org-agenda-files (list "~/git-repos/private/org/main.org"
                             "~/git-repos/private/org/schedule.org"
                             ))
(setq org-todo-keywords
      '((sequence "TODO" "MEETING" "|" "DONE" "DEFERRED")))
(setq org-log-done 'time) ; Create a timestamp when DONE
(add-hook 'org-mode-hook
          (lambda ()
            (add-hook (local-set-key (kbd "C-c a") 'org-agenda) nil 'make-it-local)
            (add-hook (local-set-key (kbd "C-c c") 'org-capture) nil 'make-it-local)
            )
          )

;; initialize auto complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; initialize yasnippet (to create templates for my c and c++ functions)
(require 'yasnippet)
(yas-global-mode 1)

;; initialize flycheck mode
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-emacs-lisp-load-path 'inherit)

;; autoload bash-completion for shell-mode
(autoload 'bash-completion-dynamic-complete "bash-completion" "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions 'bash-completion-dynamic-complete)

;; ;; set tab width
;; (setq c-default-style "linux"
;;       c-basic-offset 4)

;; Set the C coding style to k&r.
(setq c-default-style "k&r")

;; Use four spaces instead of a tab
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode nil)

;; Change the current buffer to Latin 1 with Unix line-ends.
(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))

;; roslaunch highlighting
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))

;; enable markdown mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; enable octave mode
(setq auto-mode-alist
      (cons
       '("\\.m$" . octave-mode)
       auto-mode-alist))

;; enable gfm mode (not sure what this one is for)
(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; ;; highlight characters over 80 characters
;; (require 'whitespace)
;; (setq whitespace-line-column 80)
;; (setq whitespace-style '(face lines-tail))
;; (add-hook 'prog-mode-hook 'whitespace-mode)
;; (global-whitespace-mode +1)

;; display ruler at the 80 character mark
(require 'fill-column-indicator)
(setq fci-rule-width 2)
(setq fci-rule-column 80)
(setq fci-rule-color "lightgreen")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

;; auto wrap lines at column 80
(add-hook 'text-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 80)))

;; add syntax highlighting for Dockerfiles and the ability to build the image
;; directly (C-c C-b) from the buffer
(add-to-list 'load-path "/your/path/to/dockerfile-mode/")
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; delete trailing whitespace when you save a buffer
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Return key automatically indents cursor on new line in yaml mode
(add-hook 'yaml-mode-hook
	  (lambda ()
	    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

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

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; end of file
(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex -synctex=1")
 '(TeX-command-list
   (quote
    (("XeLaTeX_SyncteX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run XeLaTeX")
     ("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")
     ("Jump to PDF" "%V" TeX-run-discard-or-function nil t :help "Run Viewer"))))
 '(TeX-modes
   (quote
    (tex-mode plain-tex-mode texinfo-mode latex-mode doctex-mode)))
 '(column-number-mode t)
 '(ido-enable-last-directory-history nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0)
 '(ido-record-commands nil)
 '(package-selected-packages
   (quote
    (cmake-mode helm magit yasnippet org-journal markdown-mode flymake-cppcheck flycheck cpputils-cmake company-c-headers cmake-project auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
