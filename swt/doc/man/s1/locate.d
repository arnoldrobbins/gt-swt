.hd locate  "locate subsystem source code "  03/20/80
locate [-cmd | -sub] { <module_name> }
.ds
'Locate' returns the pathname(s) of the source code for a command or
subprogram on standard output.
.es
locate -sub getlin
locate lf
.fl
=src=/misc/srcloc
.bu
Does not complain if source is not found.
