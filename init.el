(require 'cl)
(require 'imenu)
(add-to-list 'load-path "~/.emacs.d")

;; general
(set-default-font "Inconsolata")
(set-face-attribute 'default nil :height 120)
(when (>= emacs-major-version 24) 
  (setq custom-file "~/.emacs-custom.el")
  (load custom-file 'noerror))

;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows") ; put windows based config here
    ))
 ((string-equal system-type "darwin")   ; Mac OS X
  (progn
    (message "Mac OS X") ; put mac based config here
    (setq mac-option-modifier 'meta)
    (setq mac-command-modifier 'control)))
 ((string-equal system-type "gnu/linux") ; Linux
  (progn
    (message "Linux") ; put linux based config here
    )))

(desktop-save-mode 1) ; buffers reopen next time emacs starts
(global-linum-mode t) ; show line numbers
(column-number-mode t)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ; remove scroll bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ; remove tool bar
(fset 'yes-or-no-p 'y-or-n-p) ; change yes or no to y or n
(setq confirm-nonexistent-file-or-buffer nil) ; don't ask to create new file
(defalias 'list-buffers 'ibuffer) ; use ibuffer instead of regular buffer
(ido-mode 1) ; make buffer switch command show suggestions
(setq ido-create-new-buffer 'always)
(delete-selection-mode t) ; delete highlighted text

;; dont ask to kill active processes
(setq kill-buffer-query-functions 
      (remq 'process-kill-buffer-query-function
	    kill-buffer-query-functions))

;; put backups in their own folder
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; show date and time
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    ;; (if (> (x-display-pixel-width) 1280)
    ;;        (add-to-list 'default-frame-alist (cons 'width 120))
    ;;        (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist (cons 'width 80))
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 80)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

;;themes

(when (>= emacs-major-version 24)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/zenburn") 
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
  (load-theme 'zenburn))

;; packages
(when (>= emacs-major-version 24)
  (package-initialize)
  (add-to-list
   'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/.emacs.d/packages/diminish/")
(add-to-list 'load-path "~/.emacs.d/packages/bind-key/")
(add-to-list 'load-path "~/.emacs.d/packages/use-package/")
(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/packages/popup")
(add-to-list 'load-path "~/.emacs.d/packages/dash")

;; matlab-mode
(use-package matlab
  :load-path "~/.emacs.d/packages/matlab-mode"
  :mode ("\\.m\\'" . matlab-mode))

;; clojure-mode
(use-package clojure-mode
  :load-path "~/.emacs.d/packages/clojure-mode"
  :mode ("\\.clj\\'" . clojure-mode))

;; org-mode
(use-package org
  :load-path "~/.emacs.d/packages/org"
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c C-a" . org-agenda))
  :config (progn 
	    (setq org-log-done t)
	    (setq org-agenda-files (list "~/agenda/work.org"
					 "~/agenda/school.org" 
					 "~/agenda/home.org"))))

;; cider - clojure repl
(use-package cider
  :load-path "~/.emacs.d/packages/cider"
  :commands (cider-jack-in)
  :bind (("<C-return>" . cider-eval-region)))

;; custom-functions
(use-package custom-functions
  :bind (("<C-M-up>" . backward-up-sexp))
  :commands (swap-windows move-buffer-file insert-bracket-pair))

;; auto-save
(add-to-list 'load-path "~/.emacs.d/packages/auto-save-buffers-enhanced")
(require 'auto-save-buffers-enhanced-autoloads)
(auto-save-buffers-enhanced t)

;; show-paren
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'parenthesis) 

;; tramp
(setq tramp-default-method "ssh")
(setq password-cache-expiry nil) ; cache passwords, set to nil = no expiry

;; auto-fill
(auto-fill-mode t) ;; turn on auto fill
(set-fill-column 80) ;set comments to start on new line after 80 columns

;; dried-filetype-face - colour in dried
(add-to-list 'load-path "~/.emacs.d/packages/dired-filetype-face")
(eval-after-load 'dired '(progn (require 'dired-filetype-face-autoloads)))

;; rainbow-delimiters
(use-package rainbow-delimiters
  :load-path "~/.emacs.d/packages/rainbow-delimiters"
  :config (progn
	   (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
	   (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
	   (setq nrepl-hide-special-buffers t)))

;; exec-path-from-shell
(add-to-list 'load-path "~/.emacs.d/packages/exec-path-from-shell")
(require 'exec-path-from-shell-autoloads)

(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
 
;; call function now
(set-exec-path-from-shell-PATH)

;; bash completion
(add-to-list 'load-path "~/.emacs.d/packages/bash-completion")
(eval-after-load 'shell-command
  '(progn (require 'bash-completion-autoloads)))

;; undo-tree
(add-to-list 'load-path "~/.emacs.d/packages/undo-tree")
(use-package undo-tree
  :bind (("C-/" . undo-tree-undo)
	 ("C-?" . undo-tree-redo)))

;; smex - ido for M-x (does not work on emacs 23)
(use-package smex
  :load-path "~/.emacs.d/packages/smex"
  :bind (("\C-x\C-m" . smex))
  :config (progn   
	    ;; hyphen on space, like normal M-x
	    (defadvice smex (around space-inserts-hyphen activate compile)
	      (let ((ido-cannot-complete-command 
		     `(lambda ()
			(interactive)
			(if (string= " " (this-command-keys))
			    (insert ?-)
			  (funcall ,ido-cannot-complete-command)))))
		ad-do-it))))

;;tiny tools
(add-to-list 'load-path "~/.emacs.d/packages/tiny-tools/lisp/tiny")
(add-to-list 'load-path "~/.emacs.d/packages/tiny-tools/lisp/other")
(use-package tinyeat
  :bind (("<C-S-backspace>" . tinyeat-zap-line)
	 ("<M-backspace>" . tinyeat-backward-preserve)
	 ("<S-backspace>" . tinyeat-delete-whole-word)
	 ("<C-backspace>" . tinyeat-forward-preserve)))
(use-package tinybuffer
  :bind (("<M-left>" . tinybuffer-previous-buffer)
	 ("<M-right>" . tinybuffer-next-buffer)
	 ("<C-M-right>" . tinybuffer-next-buffer)
	 ("<C-M-left>" . tinybuffer-previous-buffer)))

;; (use-package thing-cmds
;;   :load-path "~/.emacs.d/packages/thing-cmds"
;;   :bind (("<C-S-up>" . mark-enclosing-list)
;; 	 ("<C-S-down>" . mark-enclosing-list-backward)))

(eval-after-load 'dired '(progn (require 'tinydired-autoloads)))

;; flyspell

(setq flyspell-issue-message-flag nil)

;; for text based files
(add-hook 'LaTeX-mode-hook '(flyspell-mode t))
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; for comments and strings in code
(setq flyspell-issue-message-flag nil)
(add-hook 'prog-mode-hook
	  (lambda () 
	    (flyspell-prog-mode)))

(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)


;; smartparens
(use-package smartparens
  :load-path "~/.emacs.d/packages/smartparens"
  :commands (smartparens-mode)
  :bind (("C-M-f" . sp-forward-sexp)
	 ("C-M-b" . sp-backward-sexp)
	 ("C-M-p" . sp-previous-sexp)
	 ("C-M-n" . sp-next-sexp)
	 ;; ("C-M-u" . sp-up-sexp)
	 ;; ("C-M-d" . sp-down-sexp)
	 ;; ("<C-M-backspace>" . sp-kill-sexp)
	 ;; ("<C-M-S-backspace>" . sp-backward-kill-sexp)
	 ;; ("C-M-w" . sp-copy-sexp)
	 ("C-M-S-w" . sp-backward-copy-sexp)
	 ("<C-M-up>" . sp-select-next-thing)
	 ("<C-M-down>" . sp-select-previous-thing))
  :config (progn 
	    (require 'smartparens-config)
	    (smartparens-global-mode t)))

;; auto-complete
(require 'auto-complete-setup)	    
(use-package auto-complete
  :load-path "~/.emacs.d/packages/auto-complete"
  :diminish auto-complete-mode
  :config (progn 
	    (require 'auto-complete-config)
	    (setq ac-auto-show-menu 0.1) ; show x seconds later
	    (add-to-list 'ac-dictionary-directories
			 "~/.emacs.d/packages/auto-complete/dict")
	    (add-to-list 'ac-modes 'org-mode)
	    (ac-my-config)
	    (setq ac-use-menu-map t)
	    (define-key ac-menu-map "\C-n" 'ac-next)
	    (define-key ac-menu-map "\C-p" 'ac-previous)
	    (define-key ac-completing-map "\r" nil)
	    (define-key ac-completing-map [tab] 'ac-complete)
	    (define-key ac-completing-map [return] nil) ; get rid of return
	    (ac-set-trigger-key "TAB")
	    (ac-set-trigger-key "<tab>")
	    (add-hook 'prog-mode-hook 'auto-complete-mode)

	    ;; have flyspell work with auto complete
	    (ac-flyspell-workaround)))

;; ;; yasnippet
(add-to-list 'load-path "~/.emacs.d/packages/yasnippet")
(require 'yasnippet-autoloads)
(yas-global-mode 1)

;; ;; slime
;; (add-to-list 'load-path "~/.emacs.d/packages/slime")
;; (require 'slime-autoload) 
 

;; cedet
(load-file "~/.emacs.d/packages/cedet-bzr/trunk/cedet-devel-load.el")
(add-to-list 'semantic-default-submodes
	     'global-semantic-idle-summary-mode t)
(add-to-list 'semantic-default-submodes
	     'global-semantic-highlight-edits-mode t)
(add-to-list 'semantic-default-submodes
	     'global-semantic-idle-local-symbol-highlight-mode t)
(add-to-list 'semantic-default-submodes 
	     'global-semantic-idle-scheduler-mode t)
(add-to-list 'semantic-default-submodes
	     'global-semanticdb-minor-mode t)
(add-to-list 'semantic-default-submodes 
	     'global-semantic-mru-bookmark-mode t)
(semantic-mode 1)
;; (global-set-key (kbd "C-x C-t")     'semantic-analyze-proto-impl-toggle) 
;; (global-set-key (kbd "C-x C-o") 'semantic-mrub-switch-tags)

(use-package semantic/ia
  :load-path "~/.emacs.d/packages/cedet-bzr/trunk/lisp/cedet/semantic"
  :bind (("C-x C-j" . semantic-ia-fast-jump)
	("C-x C-p" . semantic-ia-describe-class)
	("C-x C-i" . semantic-ia-show-doc)))

;; (require 'semantic/db-javap)





