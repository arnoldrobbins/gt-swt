.hd rdprint "print a relation or relation descriptor" 08/03/81
rdprint { -d | -r }
.ds
'Rdprint' is part of the toy relational data base management
system 'rdb'.  It displays a relation in readable form.
Standard input 1 must be directed to a file containing an
'rdb' relation.
The input relation must
be a file containing relation that was
created by 'rdmake' or other 'rdb' programs;
a relation cannot be read from the terminal.
.sp
Printable output is produced on standard
output.  The "-d" option indicates that only the relation
description is to be displayed; the "-r" option indicates that
only the relation data is to be displayed.  If both or neither
of these options are present, both the description and data
are displayed.
.es
p.rel> rdprint -d
p.rel> rdproj pname pno | rdsort | rduniq | rdprint -r
.me
"Usage:  rdprint (-d | -r)"
.br
"Sorry, a relation can't be read from the terminal"
.br
"Can't access input relation"
.br
"relation is corrupted!!"
.bu
Relations more than 80 columns wide display badly on the terminal.
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
