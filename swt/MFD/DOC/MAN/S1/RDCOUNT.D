[cc]mc |
.hd rdcount "count the number of rows in a relation" 07/01/82
rdcount [<selection expr>]
.ds
'Rdcount' is part of the toy relational data base management system,
'rdb'.  It lists the number of rows in a relation satisfying the
optional select expression.  If no select expression is given then it
lists the total number of rows in the relation.  Standard input 1 must
be directed to a file containing an 'rdb' relation.  The result is
written to standard output.
.sp
The input relation must be a file containing a relation that was created
by 'rdmake' or other 'rdb' programs; the relation cannot be read from
the terminal.  The select expression is formed from the logical operators
"&" (and), "|" (or), and "~" (not) connecting relational conditions
involving two domains or a domain and a literal.
.es
p.rel> rdcount
p.rel> rdcount "color='red'"
.me
"Sorry, a relation can't be read from the terminal"
.br
"relation is corrupted!!"
.br
"Cannot load input relation"
.br
"Invalid expression"
.br
"expected domain name or literal"
.sa
rdcat (1),
rdextr (1),
rdjoin (1),
rdmake (1),
rdprint (1),
rdproj (1),
rdsel (1),
rdsort (1),
rduniq (1),
rdatt (1),
rdavg (1),
rddiff (1),
rddiv (1),
rdint (1),
rdmax (1),
rdmin (1),
rdnat (1),
rdsum (1)
[cc]mc
