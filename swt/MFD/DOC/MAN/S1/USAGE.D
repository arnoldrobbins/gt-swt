.hd usage "print summary of command syntax" 03/23/82
usage { <command> }
.ds
'Usage' prints a summary of the acceptable command line syntax
for each command and a summary of the
acceptable calling sequence for each library subprogram named in
its argument list.
Command line syntax
is expressed in a BNF-like meta-language that is described by
"help -g bnf".
.es
usage rf ed se
.fl
=doc=/fman/s1/<command>.d for command documentation
.br
=doc=/fman/s2/<subprogram>.d for subprogram documentation
.br
=doc=/fman/s3/<command>.d for local command documentation
.br
=doc=/fman/s4/<subprogram>.d for local subprogram doc.
.br
=doc=/fman/s5/<command>.d for low-level command documentation
.br
=doc=/fman/s6/<subprogram>.d for low-level subprogram doc.
.br
=doc=/fman/index for command and subroutine index
.me
.in +5
.ti -5
"Sorry, no help is available for <command>" in case of missing
or unreadable documentation file.
.in -5
.sa
help (1),
.ul
Software Tools Subsystem Reference Manual
