[cc]mc |
.hd rdnat "perform the natural join of two relations" 07/01/82
rdnat
.ds
'Rdnat' is part of the toy relational data base system, 'rdb'.  It
creates a new relation by performing the natural join of the two
relations specified as standard inputs 1 and 2 and writes the
resulting new relation on standard output 1.
.sp
The new relation is formed (effectively) by "pasting[bl]together" tuples
of relation 1 and relation 2 having the same values on the same
attributes.  Identical tuples are not
removed from the resulting relation.  These can be removed by using
'rdsort' and 'rduniq'.
.nf

     For example:

       p1.rel  --------------  p2.rel --------------
               |code | name |         |code | loc  |
               --------------         --------------
               | 100 | pens |         | 100 | rear |
               |-----|------|         |-----|------|
               | 101 | ink  |         | 105 | front|
               --------------         --------------

       p1.rel> p2.rel> rdnat >p.rel

                  p.rel ---------------------
                        |code | name | loc  |
                        ---------------------
                        | 100 | pens | rear |
                        ---------------------

.fi
.sp
The input relations must be files containing relations that were
created by 'rdmake' or other 'rdb' programs; relations cannot be
read from the terminal.  The output relation is displayed in a
readable format if standard output is directed to a terminal; otherwise,
the output relation is
written in binary internal format for processing by other 'rdb'
programs.
.es
p1.rel> p2.rel> rdnat >p.rel
p1.rel> p2.rel> rdnat | rdsort | rduniq | rdprint
.me
"Sorry, a relation can't be read from the terminal"
.br
"relation is corrupted!!"
.br
"Cannot load input relation 1"
.br
"Cannot load input relation 2"
.br
"Resulting relation has too many domains"
.br
"in add_field_to_rd; bogus type passed"
.br
"field not found"
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
rdcount (1),
rddiff (1),
rdint (1),
rddiv (1),
rdmax (1),
rdmin (1),
rdsum (1)
[cc]mc
