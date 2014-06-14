;;; dired-filetype-face-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (dired-filetype-face-mode-func) "dired-filetype-face"
;;;;;;  "dired-filetype-face.el" (21253 28322 0 0))
;;; Generated autoloads from dired-filetype-face.el

(autoload 'dired-filetype-face-mode-func "dired-filetype-face" "\
this function will be added to `dired-mode-hook'

\(fn)" nil nil)
(add-hook 'dired-mode-hook 'dired-filetype-face-mode-func)
(add-hook 'wdired-mode-hook 'dired-filetype-face-mode-func)

;;;***

(provide 'dired-filetype-face-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; dired-filetype-face-autoloads.el ends here
