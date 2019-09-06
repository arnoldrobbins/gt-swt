.hd rdcat "concatenate two identical relations" 08/03/81
rdcat
.ds
'Rdcat' is part of the toy relational data base
system, 'rdb'.  It creates a new relation by concatenating
the two relations specified
as standard inputs 1 and 2 and writes the new relation
on standard output 1.
Both relations must have identical descriptions -- the
domains must be identical and in the same order.
.sp
The input relations must
be files containing relations that were
created by 'rdmake'; relations cannot be read from
the terminal.
The output relation is displayed in a readable format if
standard output is directed to a terminal (display in binary
would be quite a mess); otherwise, the output relation is written
in binary, internal format for processing by other 'rdb' programs.
.sp
Identical tuples are not removed from the resulting relations.
These can be removed using 'rdsort' and 'rduniq'.
.es
p1.rel> p2.rel> rdcat >p.rel
p.des> newp.data> rdmake | p.rel> rdcat >newp.rel
.me
"Sorry, a relation can't be read from the terminal"
.br
"Relation is corrupted!!"
.br
"Can't access input relation 1"
.br
"Can't access input relation 2"
.br
"Relations must have identical descriptions"
.bu
It would be nice if the relations only had to have the
same structure to be concatenated.
.sp
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
