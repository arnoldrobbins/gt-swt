.hd rdsort "sort a relation" 02/22/82
rdsort { <domain> }
.ds
'Rdsort' is part of the toy relational data base
system, 'rdb'.  It sorts the tuples in a relation on the
domains specified in the argument list.
Standard input 1 must be directed to a file containing
an 'rdb' relation; the sorted relation is written on
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
.sp
The relation is sorted on the domains specified in the
argument list.  Integer and real domains are sorted in
[cc]mc |
numeric order; string domains are sorted in the ASCII
[cc]mc
collating sequence.  If no arguments are specified,
the relation is sorted on all domains in the order they
appear in the relation.
.es
p.rel> rdsort color >np.rel
sp.rel> rdproj sno | rdsort | rduniq | rdprint
.me
"Can't access input relation"
.br
"Sorry, a relation can't be read from the terminal"
.br
"Relation is corrupted!!"
.br
"Too many sort keys"
.br
"<domain>: field not defined"
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
