;;; gscholar-bibtex-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "gscholar-bibtex" "gscholar-bibtex.el" (23182
;;;;;;  1312 475891 731000))
;;; Generated autoloads from gscholar-bibtex.el

(autoload 'gscholar-bibtex-source-on-off "gscholar-bibtex" "\


\(fn ACTION SOURCE-NAME)" nil nil)

(autoload 'gscholar-bibtex-turn-on-sources "gscholar-bibtex" "\


\(fn)" t nil)

(autoload 'gscholar-bibtex-turn-off-sources "gscholar-bibtex" "\


\(fn)" t nil)

(autoload 'gscholar-bibtex "gscholar-bibtex" "\
Look up on a bibliographic SOURCE such as Google Scholar for the given QUERY.
When called interactively, prompts for SOURCE and QUERY string.
Can be called programmatically with SOURCE (to prompt for QUERY
only or SOURCE and QUERY for non-interactive lookup.

\(fn &optional SOURCE QUERY)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; gscholar-bibtex-autoloads.el ends here
