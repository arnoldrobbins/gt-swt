.hd mktree "convert pathname to treename" 03/25/82
mktree  { <pathname> }
.ds
'Mktree' converts Subsystem pathnames into standard Primos
treenames.
If arguments are supplied, each is interpreted as a pathname
and the results of conversion are printed (one per line) on
standard output.
If no arguments are supplied, pathnames are read (one per line)
from standard input until EOF, with the conversion results
again being printed one per line on standard output.
.es
mktree //bozo/file
x spool [mktree [arg 1]]
.sa
mktr$ (6), mkpa$ (2)
