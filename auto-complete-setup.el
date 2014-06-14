
(defun ac-common-setup ()
;(add-to-list 'ac-sources 'ac-source-filename)
  )

(defun ac-emacs-lisp-mode-setup ()
  (setq ac-sources 
	(append '(ac-source-features ac-source-functions ac-source-yasnippet 
				     ac-source-variables
				     ac-source-symbols) ac-sources))
  (eldoc-mode t))

(defun ac-lisp-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet ac-source-semantic))))

(defun ac-clojure-mode-setup ()
  (setq ac-sources 
	(append '(ac-source-yasnippet) ac-sources)))

(defun ac-cc-mode-setup ()
  (add-to-list 'ac-omni-completion-sources
	       (cons "\\." '(ac-source-semantic)))
  (add-to-list 'ac-omni-completion-sources
	       (cons "->" '(ac-source-semantic)))
  (setq ac-sources (append '(ac-source-yasnippet ac-source-semantic 
						 ac-source-gtags) 
			   ac-sources))
  )

(defun ac-makefile-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))

(defun ac-ruby-mode-setup ())

(defun ac-css-mode-setup ()
  (setq ac-sources (append '(ac-source-css-property) ac-sources)))

(defun ac-org-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet))))

(defun ac-my-config ()
  (setq-default ac-sources 
		'(ac-source-abbrev ac-source-dictionary 
				   ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'lisp-mode-hook 'ac-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'c++-mode-hook 'ac-cc-mode-setup)
  (add-hook 'java-mode-hook 'ac-cc-mode-setup)
  (add-hook 'makefile-mode-hook 'ac-makefile-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'org-mode-hook 'ac-org-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  ;; (add-hook 'clojure-mode-hook 'ac-clojure-mode-setup) ; use company mode
  )

(provide 'auto-complete-setup)
