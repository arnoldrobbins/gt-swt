.hd cmp "string comparison" 01/16/83
cmp <string1> <relation> <string2>
.ds
'Cmp' is a string comparison utility that is designed for use
in function calls within arithmetic expressions.  It compares the
two strings given as arguments, and returns 1 if the specified
relation holds, 0 otherwise.   The following relations are supported
(operators are the same as those in Ratfor, with some synonyms):
.sp
.tc \
.ta 6
.in +10
.ti -5
==\equal to
.ti -5
=\equal to
.ti -5
<\less than
.ti -5
>\greater than
.ti -5
<=\less than or equal to
.ti -5
=<\less than or equal to
.ti -5
>=\greater than or equal to
.ti -5
=>\greater than or equal to
.ti -5
~=\not equal to
.ti -5
<>\not equal to
.ti -5
><\not equal to
.in -10
.sp
Notice that if the "greater than" symbol (">") is used
in the <relation> argument, the argument must be quoted to prevent the
shell from interpreting it as an I/O redirector.
.es
if @[cmp @[day] = friday]; echo T.G.I.F.; fi
cmp @[response] ~= "yes"
cmp @[term] ">=" @[term_list@[i]]
.me
"Usage: cmp ..." for invalid arguments.
.bu
Redirection problem mentioned above.
.sa
case (1), eval (1), if (1), equal (2), strcmp (2)
