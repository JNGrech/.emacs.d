;;; Compiled snippets and support files for `latex-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'latex-mode
		     '(("ac" "\\newacronym{${1:label}}{${1:$(upcase text)}}{${2:Name}}" "acronym" nil nil nil nil nil nil)
		       ("al" "\\begin{alertblock}{$2}\n        $0\n\\end{alertblock}" "alertblock" nil nil nil nil nil nil)
		       ("alg" "\\begin{algorithmic}\n$0\n\\end{algorithmic}\n" "alg" nil nil nil nil nil nil)
		       ("bl" "\\begin{block}{$1}\n        $0\n\\end{block}" "block" nil nil nil nil nil nil)
		       ("G" "\\Gls{${1:label}}" "Gls" nil nil nil nil nil nil)
		       ("ca" "\\caption{$0}" "caption" nil nil nil nil nil nil)
		       ("c" "\\cite{$1} $0" "cite" nil nil nil nil nil nil)
		       ("code" "\\begin{lstlisting}\n$0\n\\end{lstlisting}" "code" nil nil nil nil nil nil)
		       ("cols" "\\begin{columns}\n  \\begin{column}{.${1:5}\\textwidth}\n  $0\n  \\end{column}\n\n  \\begin{column}{.${2:5}\\textwidth}\n\n  \\end{column}\n\\end{columns}" "columns" nil nil nil nil nil nil)
		       ("e" "\\emph{$1}$0" "emph" nil nil nil nil nil nil)
		       ("fig" "\\begin{figure}[ht]\n  \\centering\n  \\includegraphics[${1:options}]{figures/${2:path.pdf}}\n  \\caption{\\label{fig:${3:label}} $0}\n\\end{figure}\n" "figure" nil nil nil nil nil nil)
		       ("fr" "\\begin{frame}${1:[$2]}\n        ${3:\\frametitle{$4}}\n        $0\n\\end{frame}" "frame" nil nil nil nil nil nil)
		       ("g" "\\gls{${1:label}}" "gls" nil nil nil nil nil nil)
		       ("gp" "\\glspl{${1:label}}" "glspl" nil nil nil nil nil nil)
		       ("if" "\\IF {$${1:cond}$}\n    $0\n\\ELSE\n\\ENDIF \n" "if" nil nil nil nil nil nil)
		       ("ig" "\\includegraphics${1:[$2]}{$0}" "includegraphics" nil nil nil nil nil nil)
		       ("-" "\\item $0" "item" nil nil nil nil nil nil)
		       ("it" "\\begin{itemize}\n$0\n\\end{itemize}" "itemize" nil nil nil nil nil nil)
		       ("lab" "\\label{$0}" "label" nil nil nil nil nil nil)
		       ("lst" "\\begin{lstlisting}[float,label=lst:${1:label},caption=nextHopInfo: ${2:caption}]\n$0\n\\end{lstlisting}" "listing" nil nil nil nil nil nil)
		       ("movie" "\\begin{center}\n\\includemovie[\n  label=test,\n  controls=false,\n  text={\\includegraphics[width=4in]{${1:image.pdf}}}\n]{4in}{4in}{${2:video file}}\n\n\\movieref[rate=3]{test}{Play Fast}\n\\movieref[rate=1]{test}{Play Normal Speed} \n\\movieref[rate=0.2]{test}{Play Slow}\n\\movieref[resume]{test}{Pause/Resume}\n" "movie" nil nil nil nil nil nil)
		       ("cmd" "\\newcommand{\\\\${1:name}}${2:[${3:0}]}{$0}" "newcommand" nil nil nil nil nil nil)
		       ("gl" "\\newglossaryentry{${1:AC}}{name=${2:Andrea Crotti}${3:, description=${4:description}}}" "newglossaryentry" nil nil nil nil nil nil)
		       ("no" "\\note{$0}" "note" nil nil nil nil nil nil)
		       ("py" "\\lstset{language=python}\n\\begin[language=python]{lstlisting}\n$0\n\\end{lstlisting}" "python" nil nil nil nil nil nil)
		       ("q" "\\question{$0}" "question" nil nil nil nil nil nil)
		       ("sec" "\\section{${1:name}}\n\\label{sec:${2:label}}\n\n$0" "section" nil nil nil nil nil nil)
		       ("sf" "\\subfigure[${1:caption}]{\n  \\label{fig:${2:label}} \n  \\includegraphics[width=.${3:3}\\textwidth]{${4:path}}}\n$0" "subf" nil nil nil nil nil nil)
		       ("subfig" "\\begin{figure}[ht]\n  \\centering\n  \\subfigure[$1]\n  {\\label{fig:${2:label}} \n    \\includegraphics[width=.${3:5}\\textwidth]{${4:path}}}\n\n  \\caption{${5:caption}}\n\\label{fig:${6:label}}\n\\end{figure}\n" "subfigure" nil nil nil nil nil nil)
		       ("sub" "\\subsection{${1:name}}\n\\label{subsec:${2:label}}\n\n$0" "subsec" nil nil nil nil nil nil)
		       ("b" "\\textbf{$1}$0" "textbf" nil nil nil nil nil nil)
		       ("pkg" "\\usepackage{$0}" "usepackage" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Mar  2 09:09:19 2014
