.hd tsort "topological sort" 04/12/82
tsort [-v]
.ds
'Tsort' reads pairs of names from its standard input, sorts them
topologically, and writes the result to its standard output.
Such a function is useful, for example, in ordering the subroutines
in a library so that it may be loaded in a single pass.
.sp
Each input line consists of a pair of names, separated by blanks.
The first name is taken as the predecessor, and the second as the
successor.
The names are printed, one per line, such that each name that
appeared as a successor on input follows all the names
that appeared as its predecessor.
Normally, only names that appeared somewhere as a predecessor
are printed.
However, if the "-v" flag is specified, all names are printed.
.es
brefs library.b | tsort >lib_order
precedences> tsort -v
.me
.in +5
.ti -5
"Usage: tsort ..." for specifying unknown flag arguments.
.ti -5
"input data error" if an input line contains only one name.
.ti -5
"cycle (in reverse order): name ..." when a set of mutually
recursive references is detected.
.in -5
.sa
bmerge (5), bnames (5), brefs (5)
