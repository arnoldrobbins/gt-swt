.hd pr "print files on the line printer" 03/20/80
pr {<file_spec> | -h <heading>} [/ <sp_opts>]
.sp
<file_spec> ::= <filename> | -[<stdin_number>] |
.ti +16
-n(<stdin_number> | <filename>)
.ds
'Pr' is used to print paginated listings of text files on the
line printer.
.sp
Files to be printed are specified by <file_spec>s; see
'cat' for further information on the semantics of this construct.
.sp
Spooler control options may appear on the command line, but must
be separated from file names by an argument consisting only of a
slash.
See 'sp' and the library routine 'open' for further information on
<sp_opts>.
.es
lf -c | find .r | sort | pr -n
pr file1 file2 file3
cat part1 part2 | pr -
pr form / p/narrow/
.fl
//spoolq/prt??? for spool file
.br
//spoolq/q.ctrl for queue control file
.me
See 'print'
.sa
print (1), sp (1), cat (1)
