.hd term_type "print user's terminal type" 02/22/82
term_type [ -[no]se | -[no]vth | -[no]lcase ]
.ds
'Term_type' prints a mnemonic for the type of the current user's
terminal
on standard output when it is called with no arguments.
The mnemonic is suitable for use
with 'se', among other things.
.sp
If one of the other options is given, 'term_type' prints a
"1" or "0" to indicate whether or not the option is selected for
the terminal.  For instance, "term_type -se" prints "1" if
the terminal is supported by 'se'.
.sp
If no terminal type has been specified for the user's terminal, the
call to 'gtattr' or 'gttype' in 'term_type' will request the
terminal type from the user.  Otherwise, 'term_type' will
use the remembered terminal type.
.es
echo "Your terminal type: "[term_type]
if [term_type -se]
   se [args]
else
   ed [args]
fi
.fl
=termlist=  for the terminal list.
.br
=ttypes= for the legal terminal type list.
.me
"Usage: term_type ..." for illegal arguments.
.sp
.in +5
.ti -5
"No terminal type information is available".  For some reason
no terminal type is configured for the line and the user has
refused to supply a terminal type.
.in -5
.sa
line (1), term (1), se (1), gtattr (2), gttype (2)
