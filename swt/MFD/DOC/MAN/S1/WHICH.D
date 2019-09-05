[cc]mc |
.hd which "search _search_rule for a command" 08/27/84
which <command>
.ds
'Which' steps along the path indicated in the shell variable
'_search_rule' to locate the <command> named as its argument.
It knows which commands are internal to the shell.
.es
which cd
which (fmt se)
.me
"Usage: which ..." for improper arguments.
.bu
Ignores all arguments but the first.
.sa
sh (1),
svget (2)
[cc]mc
