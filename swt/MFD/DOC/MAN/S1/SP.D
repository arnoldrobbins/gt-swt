.hd sp "line printer spooler" 03/25/82
sp {<file_spec>} [/ {<option>}]
.sp
<file_spec> ::= <filename> | -[<stdin_number>] |
                -n(<stdin_number> | <filename>)
<option> ::=   -a <location>
            |  -b <banner>
            |  -c <copies>
            |  -d <defer_time>
            |  -f
            |  -h
            |  -j
            |  -n
            |  -p <paper_type>
            |  -r
            |  -s
.ds
'Sp' allows users of the Subsystem to send output to the
on-site line printer.
.sp
Data to be printed is selected by a number of <file_spec>s.
See 'cat' for detailed information on the semantics of this construct.
.sp
A number of spooler control operations may be specified on the
command line after the files to be printed, provided the files
and options are separated by a single argument consisting only
of a slash.
The options presently available are:
.sp
.in +5
.ta 6
.tc \
[cc]mc |
-a\Print the file on system <location>
.br
-b\Change the output heading to <banner>
.br
-c\Produce <copies> duplicates
.br
-d\Do not print until <defer_time>
.br
-f\Use FORTRAN forms control
.br
-h\Suppress header page
.br
-j\Suppress final page eject
.br
-n\Generate line numbers in left hand margin
.br
-p\Do not print until operator mounts <paper>
.br
-r\Use raw forms control
.br
-s\User standard PRIMOS forms control
[cc]mc
.br
.in -5
.es
sp file.l
fmt report | os | sp / -f
sp stuff / -d 23:59 -f -c 30
.fl
//spoolq/prt??? for spooler queue file
.br
//spoolq/q.ctrl for spool queue
.sa
pr (1), open (2), lopen$ (6)
