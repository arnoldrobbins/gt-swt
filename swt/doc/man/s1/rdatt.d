[cc]mc |
.hd rdatt "list the attributes of a relation" 07/01/82
rdatt {<option>}
<option> ::= -t | -l | -n
.ds
'Rdatt' is part of the toy relational data base system, 'rdb'.  It
lists the attributes of a relation, specified as standard input, on
standard output.  The input relation must be a file containing a
relation that was created by 'rdmake' or another 'rdb' program; a
relation cannot be read from the terminal.
.sp
If no options are specified then the type, length, and name of each
attribute are listed on one line for each attribute.  If any of the
options 't', 'l', or 'n' (type, length, name) are specified, then
only the characteristics corresponding to the requested option will
be listed.
.es
p1.rel> rdatt
p2.rel> rdatt -tn >attrlist
.me
"Sorry, a relation can't be read from the terminal"
.br
"Can't access input relation"
.br
"relation is corrupted!!"
.sa
rdcat (1),
rdextr (1),
rdjoin (1),
rdmake (1),
rdprint (1),
rdproj (1),
rdsel (1),
rdsort (1),
rduniq (1)
[cc]mc
