.hd rduniq "remove duplicate tuples from a relation" 08/03/81
rduniq
.ds
'Rduniq' is part of the toy relational data base
system, 'rdb'.  It removes duplicates from a sorted relation.
Standard input 1 must be directed to a file containing
an 'rdb' relation; the new relation is written on
standard output.
The input relation must
be a file containing a relation that was
created by 'rdmake' or other 'rdb' program;
a relation cannot be read from
the terminal.
The output relation is displayed in a readable format if
standard output is directed to a terminal (display in binary
would be quite a mess); otherwise, the output relation is written
in binary, internal format for processing by other 'rdb' programs.
.es
sp.rel> rdproj sno | rdsort | rduniq | rdprint
.me
"Can't access input relation"
.br
"Sorry, a relation can't be read from the terminal"
.br
"relation is corrupted!!"
.bu
If standard output is directed to "/dev/lps", the relation
is written in binary.
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
