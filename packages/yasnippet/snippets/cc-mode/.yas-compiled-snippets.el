;;; Compiled snippets and support files for `cc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
		     '(("do" "do\n{\n    $0\n} while (${1:condition});" "do { ... } while (...)" nil nil nil nil nil nil)
		       ("elif" "else if (${1:condition}) {\n    $0\n}\n" "else if (...) {}" nil nil nil nil nil nil)
		       ("else" "else {\n    $0\n}\n" "else {...}" nil nil nil nil nil nil)
		       ("for" "for (${1:i = 0}; ${2:i < N}; ${3:i++}) {\n    $0\n}\n" "for" nil nil nil nil nil nil)
		       ("guard" "#ifndef ${1:NAME}_H\n#define $1_H\n\n$0\n\n#endif // $1" "guard" nil nil nil nil nil nil)
		       ("header" "#ifndef ${1:_`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H_}\n#define $1\n\n$0\n\n#endif /* $1 */" "#ifndef XXX; #define XXX; #endif" nil nil nil nil nil nil)
		       ("if" "if (${1:condition}) {\n    $0\n}" "if (...) { ... }" nil nil nil nil nil nil)
		       ("ifdef" "#ifdef ${1:MACRO}\n\n$0\n\n#endif // $1" "ifdef" nil nil nil nil nil nil)
		       ("ifelifelifelse" "if (${1:condition}) {\n    $0\n}\nelse if (${2:condition}) {\n\n}\nelse if (${3:condition}) {\n\n}\nelse {\n\n}\n" "if (...) {} else if (...) {} else if (...) {} else {}" nil nil nil nil nil nil)
		       ("ifelifelse" "if (${1:condition}) {\n    $0\n}\nelse if (${2:condition}) {\n\n}\nelse {\n\n}" "if (...) {} else if (...) {} else {}" nil nil nil nil nil nil)
		       ("ifelse" "if (${1:condition}) {\n    $0\n}\nelse {\n\n}" "if (...) {} else {}" nil nil nil nil nil nil)
		       ("inc" "#include \"$1\"" "#include \"...\"" nil nil nil nil nil nil)
		       ("inc.1" "#include <$1>" "#include <...>" nil nil nil nil nil nil)
		       ("main" "int main(int argc, char *argv[])\n{\n    $0\n    return 0;\n}" "int main(argc, argv) { ... }" nil nil nil nil nil nil)
		       ("math" "#include <math.h>\n$0" "math" nil nil nil nil nil nil)
		       ("once" "#ifndef ${1:_`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H_}\n#define $1\n\n$0\n\n#endif /* $1 */" "#ifndef XXX; #define XXX; #endif" nil nil nil nil nil nil)
		       ("struct" "struct ${1:name}\n{\n    $0\n};" "struct ... { ... }" nil nil nil nil nil nil)
		       ("?" "(${1:cond}) ? ${2:then} : ${3:else};" "ternary" nil nil nil nil nil nil)
		       ("typedef" "typedef ${1:type} ${2:alias};" "typedef" nil nil nil nil nil nil)
		       ("while" "while (${1:condition}) {\n      $0\n}" "while" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Mar  2 09:09:18 2014
