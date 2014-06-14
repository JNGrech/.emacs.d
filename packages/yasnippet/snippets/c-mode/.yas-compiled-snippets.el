;;; Compiled snippets and support files for `c-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
		     '(("ass" "#include <assert.h>\n$0" "assert" nil nil nil nil nil nil)
		       ("compile" "// -*- compile-command: \"${1:gcc -Wall -o ${2:dest} ${3:file}}\" -*-" "compile" nil nil nil nil nil nil)
		       ("d" "#define $0" "define" nil nil nil nil nil nil)
		       ("fopen" "FILE *${fp} = fopen(${\"file\"}, \"${r}\");" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)
		       ("malloc" "malloc(sizeof($1)${2: * ${3:3}});\n$0" "malloc" nil nil nil nil nil nil)
		       ("memcpy" "memcpy(${1:destination}, ${2:source}, ${3:size});\n$0" "memcpy" nil nil nil nil nil nil)
		       ("memset" "memset(${1:pointer}, ${2:value}, ${3:size});\n$0" "memset" nil nil nil nil nil nil)
		       ("packed" "__attribute__((__packed__))$0" "packed" nil nil nil nil nil nil)
		       ("printf" "printf(\"${1:format string}\"${2:,a0,a1});\n$0" "printf" nil nil nil nil nil nil)
		       ("scanf" "scanf(\"${1:format string}\"${2:,a0,a1});\n$0" "scanf" nil nil nil nil nil nil)
		       ("sprintf" "sprintf(${1:string}, \"${2:format string}\"${3:,a0,a1});\n$0" "sprintf" nil nil nil nil nil nil)
		       ("io" "#include <stdio.h>" "stdio" nil nil nil nil nil nil)
		       ("std" "#include <stdlib.h>\n" "stdlib" nil nil nil nil nil nil)
		       ("strcmp" "strcmp(${1:str1}, ${2:str2});\n$0\n" "strcmp" nil nil nil nil nil nil)
		       ("str" "#include <string.h>" "string" nil nil nil nil nil nil)
		       ("strncpy" "strncpy(${1:destination}, ${2:source}, ${3:num});\n$0" "strncpy" nil nil nil nil nil nil)
		       ("case" "switch (${1:ch}) {\n       case ${2:const}:\n       ${3:a = b};\n       break;\n       ${4:default:\n       ${5:action}}\n}\n" "switch" nil nil nil nil nil nil)
		       ("union" "typedef union {\n        $0\n} ${1:name};" "union" nil nil nil nil nil nil)
		       ("uni" "#include <unistd.h>" "unistd" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Mar  2 09:09:18 2014
