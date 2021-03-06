.hd rdjoin "join two relations" 03/23/82
rdjoin <sel expr> { <new domain> }
   <sel expr> ::= <term> { '|' <term> }
       <term> ::= <factor> { & <factor> }
     <factor> ::= ~ <factor> | <primary>
    <primary> ::= <object> <rel op> <object>
     <object> ::= <domain> | <domain>.1 | <domain>.2
                | <integer> | <real> | <string>
     <rel op> ::= < | > | = | <= | >= | ~= | == | <>
 <new domain> ::= <old domain> [ = <domain> ]
 <old domain> ::= <domain> | <domain>.1 | <domain>.2
.ds
'Rdjoin' is part of the toy relational data base management
system 'rdb'.  It joins two relations, selects relevant tuples,
and projects the new relation over specified domains.
Standard input 1 and standard input 2 must be directed to
files containing 'rdb' relations.  The result relation is
written to standard output.
Identical tuples are not removed from the resulting relation.
These can be removed using 'rdsort' and 'rduniq'.
.sp
The input relations must
be files containing relations that were
created by 'rdmake' or other 'rdb' programs;
relations cannot be read from
the terminal.
The output relation is displayed in a readable format if
standard output is directed to a terminal (display in binary
would be quite a mess); otherwise, the output relation is written
in binary, internal format for processing by other 'rdb' programs.
.sp
The new relation is formed (effectively) by concatenating every
tuple of relation 1 to every tuple of relation 2.  The
selection expression is then evaluated for every new tuple;
tuples for which the selection expression is false are
discarded.  Then a new relation is formed from  the selected
tuples by projecting over the domains specified on the
command line.
.sp
The selection expression is formed from the logical operators
"&" (and), "|" (or), and "~" (not) connecting relational
conditions involving two domains or a domain and a literal.
The usual operator hierarchy applies: relational conditions
first, followed by "~", "&" and then "|".  Literals must
be the same type as the domain to which they are compared:
string literals must be quoted (either single or double
quotes) and integer and real literals must follow the syntax
allowed by 'gctol' and 'ctod'.
.sp
Since domains may have the
same names in the input relations, domain names may be
qualified by ".1" or ".2 suffixes corresponding to domain
in the first or second relation, respectively.
If a domain name
appears in only one input relation, it need not be qualified;
if it appears in both relations, it must be qualified.
.sp
If no list of domains is specified for projecting the
output relation, the output relation is projected over
all of the domains of both input relations.  Duplicate
domain names are not allowed in the output relation.  If
there are duplicate domain names in output relation, the
domains must be renamed using the "<old domain>=<domain>"
form.  Unique domain names may also be changed using this
notation.
.es
p.rel> sp.rel> rdjoin _
    "pno.1=pno.2" pno.1=no pname=name qty
p.rel> p.rel> rdjoin _
    "city.1=city.2" pno.1=pno1 pno.2=pno2
p.rel> p.rel> rdjoin _
    "pname.1=pname.2&color.1~=color.2" pno.1=pno1 pno.2=pno2
.me
"Usage: rdjoin <selection expr> { <domain> }"
.br
"Cannot load input relation 1"
.br
"Cannot load input relation 2"
.br
"Sorry, a relation can't be read from the terminal"
.br
"Relation is corrupted!!"
.br
"Resulting relation has too many domains"
.br
"Too many fields in new relation"
.br
"<domain>: invalid name"
.br
"<domain>: domain not found"
.br
"<domain>: duplicate output domain"
.br
"<domain>: cannot add new domain"
.br
"<domain>: duplicate output domain"
.br
"<domain>: domain not found or ambiguous"
.br
"Invalid expression"
.br
"Unbalanced parentheses"
.br
"Missing relational operator"
.br
"Comparing two literals is bogus!"
.br
"Types to be compared are not compatible"
.br
"Expected domain name or literal"
.br
"Too many literals"
.br
"Invalid integer constant"
.br
"Invalid real constant"
.br
"Missing quote"
.br
"Illegal character"
.br
"Selection expression too complicated"
.bu
Uses a slow and stupid algorithm.

If domain names are duplicated in the input relations, domains
must be renamed on output; hence all desired output domains
must be listed.

If standard output is directed to "/dev/lps", the relation
is written in binary.
.sa
ctod (2),
gctol (2),
rdcat (1),
rdextr (1),
rdjoin (1),
rdmake (1),
rdprint (1),
rdproj (1),
rdsel (1),
rdsort (1),
rduniq (1)
