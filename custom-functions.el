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

(defun swap-windows ()
  "If you have 2 windows, it swaps them." (interactive) 
  (cond ((not (= (count-windows) 2)) (message "You need exactly 2 windows to do this."))
	(t
	 (let* ((w1 (first (window-list)))
		(w2 (second (window-list)))
		(b1 (window-buffer w1))
		(b2 (window-buffer w2))
		(s1 (window-start w1))
		(s2 (window-start w2)))
	   (set-window-buffer w1 b2)
	   (set-window-buffer w2 b1)
	   (set-window-start w1 s2)
	   (set-window-start w2 s1)))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
  (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	  (if (string-match dir "\\(?:/\\|\\\\)$")
	      (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (progn 	(copy-file filename newname 1) 	(delete-file filename) 	(set-visited-file-name newname) 	(set-buffer-modified-p nil) 	t)))) 


(defun backward-up-sexp (arg)
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(defun insert-bracket-pair (leftBracket rightBracket)
  "Insert a matching bracket.
If region is not active, place the cursor between them.
If region is active, insert around the region, place the cursor after the right bracket.

The argument leftBracket rightBracket are strings."
  (if (region-active-p)
      (let (
            (p1 (region-beginning))
            (p2 (region-end))
            )
        (goto-char p2)
        (insert rightBracket)
        (goto-char p1)
        (insert leftBracket)
        (goto-char (+ p2 2))
        )
    (progn
      (insert leftBracket rightBracket)
      (backward-char 1) ) )
  )

(defun insert-pair-paren () (interactive) (insert-bracket-pair "(" ")") )
(defun insert-pair-bracket () (interactive) (insert-bracket-pair "[" "]") )
(defun insert-pair-brace () (interactive) (insert-bracket-pair "{" "}") )
(defun insert-pair-double-straight-quote () (interactive) (insert-bracket-pair "\"" "\"") )
(defun insert-pair-single-straight-quote () (interactive) (insert-bracket-pair "'" "'") )
(defun insert-pair-angle-brace () (interactive) (insert-bracket-pair "<" ">") )

(defun insert-pair-square-brace () (interactive) (insert-bracket-pair "[" "]") )
(defun insert-pair-single-angle-quote‹› () (interactive) (insert-bracket-pair "‹" "›") )
(defun insert-pair-double-angle-quote«» () (interactive) (insert-bracket-pair "«" "»") )
(defun insert-pair-double-curly-quote“” () (interactive) (insert-bracket-pair "“" "”") )
(defun insert-pair-single-curly-quote‘’ () (interactive) (insert-bracket-pair "‘" "’") )

(defun insert-pair-corner-bracket「」 () (interactive) (insert-bracket-pair "「" "」") )
(defun insert-pair-white-corner-bracket『』 () (interactive) (insert-bracket-pair "『" "』") )
(defun insert-pair-angle-bracket〈〉 () (interactive) (insert-bracket-pair "〈" "〉") )
(defun insert-pair-double-angle-bracket《》 () (interactive) (insert-bracket-pair "《" "》") )
(defun insert-pair-white-lenticular-bracket〖〗 () (interactive) (insert-bracket-pair "〖" "〗") )
(defun insert-pair-black-lenticular-bracket【】 () (interactive) (insert-bracket-pair "【" "】") )
(defun insert-pair-tortoise-shell-bracket〔〕 () (interactive) (insert-bracket
-pair "〔" "〕") )

(provide 'custom-functions)
