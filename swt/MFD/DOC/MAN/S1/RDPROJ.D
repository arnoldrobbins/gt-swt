.hd rdproj "project a relation" 02/22/82
rdproj { <new domain> }
   <new domain> ::= <domain> [ = <domain> ]
.ds
'Rdproj' is part of the toy relational data base management
system 'rdb'.  It projects a relation over specified domains.
Standard input 1 must be directed to a file containing an
'rdb' relation.  A new relation is created and written
to standard output.
The input relation must
be a file containing a relation that was
created by 'rdmake' or other 'rdb' programs;
a relation cannot be read from
the terminal.
The output relation is displayed in a readable format if
standard output is directed to a terminal (display in binary
would be quite a mess); otherwise, the output relation is written
in binary, internal format for processing by other 'rdb' programs.
.sp
Domains are projected in the order specified on the command
line.  A domain can be renamed by using the syntax "<old>=<new>".
Identical tuples are not removed from the resulting relations.
These can be removed using 'rdsort' and 'rduniq'.
.es
p.rel> rdproj pname=name color city | rdsort | rduniq
sp.rel> rdproj pno=no | rdsort | rduniq
.me
"Can't access input relation"
.br
"Sorry, a relation can't be read from the terminal"
.br
"Relation is corrupted!!"
.br
"Too many fields in new relation"
.br
"<domain>: invalid name"
.br
"<domain>: field not found"
.br
"<domain>: duplicate field"
.br
"<domain>: cannot add new field"
.bu
If standard output is directed to "/dev/lps", the relation
is written in binary.

If a single domain is to be renamed, all other domains
must be named in the argument list.
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
