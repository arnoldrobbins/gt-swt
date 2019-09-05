.hd term "select individual terminal parameters" 03/23/82
.nf
term { ? | <type> | <option> }
   <option> ::=  -erase <echar>     |  -kill <kchar>
              |  -retype <rchar>    |  -escape <escchar>
              |  -newline <nlchar>  |  -eof <eofchar>
              |  -[no]break         |  -[no]echo
              |  -[no]lcase         |  -[no]lf
              |  -[no]xon           |  -[no]xoff
              |  -[no]vth           |  -[no]se
              |  -[no]inh
.fi
.ds
'Term' sets or displays the parameters that control terminal input and
output. At present, these parameters are:
.sp
     - erase character
     - kill character
     - retype character
     - escape character
     - end-of-file character
     - newline character
     - recognition of terminal interrupts
     - full/half duplex selection
     - inhibition of terminal output
     - automatic mapping of lower case input
     - line feed suppression
     - interpretation of DC1 and DC3 control characters
     - support by the screen editor 'se'
     - support by the virtual terminal handler
.sp
Arguments to 'term' consist of either a terminal type, in which case
parameters applicable to that particular terminal are set, or of
keywords that set specific parameters to specific values.
A list of available terminal types will be displayed if the
"?" option is requested.
.sp
Keywords that may be specified, and their respective meanings,
are as follows:
.sp
.in +10
.tc %
.ta 11
.ti -10
-erase%set erase character. The next argument must be a single
character or an ASCII mnemonic for the character
which is to become the new erase (character delete)
character.
.sp
.ti -10
-kill%set kill character. The next argument must be a single
character or an ASCII mnemonic for the character
which is to become the new kill (line delete) character.
.sp
.ti -10
-retype%set retype character.
The next argument must be a single character or an ASCII mnemonic
for the character which is to become the new retype (repeat line)
character.
.sp
.ti -10
-escape%set escape character.
The next argument must be a single character or an ASCII mnemonic
for the character which is to become the new escape character.
(The escape character is used to enter special character codes that
could not otherwise be entered from a standard keyboard.)
.sp
.ti -10
-newline%set newline character.
The next argument must be a single character or an ASCII mnemonic
for the character which is to become the new newline character.
The new character must then be used to terminate all subsequent
input lines.
.sp
.ti -10
-eof%set end-of-file character.
The next argument must be a single character or an ASCII mnemonic
for the character which is to become the new end-of-file character.
.sp
.ti -10
-break%enable terminal interrupts. When terminal interrupts are
enabled, hitting the BREAK key or control-p has the effect of
halting the currently executing program.
.sp
.ti -10
-nobreak%disable terminal interrupts. When terminal interrupts
are disabled, the currently executing program may not be interrupted
by the BREAK key or control-p. If, however, either of these keys
is hit, a flag is set indicating a pending interrupt
that will take effect as soon as terminal interrupts are re-enabled.
.sp
.ti -10
-echo%full duplex, each character typed is echoed by the computer.
When this mode is selected, the terminal should be set to
.bf
full duplex
mode to disable self echo.
.sp
.ti -10
-noecho%half duplex, characters are not echoed by the computer; they
must rather be echoed by the terminal if they are to be printed.
When this mode is in effect, the terminal should be set to
.bf
half duplex
mode to enable self echo.
.sp
.ti -10
-inh%inhibit output. The effect is the same as if a DC3 character
had been received while "-xon" mode was enabled.
.sp
.ti -10
-noinh%enable output. The effect is the same as if a DC1 character
had been received while "-xon" mode was enabled. Any buffered
output is sent to the terminal.
.sp
.ti -10
-lcase%lower case.
This option specifies that the user's terminal can send and receive
lower case characters.
.sp
.ti -10
-nolcase%upper case only.  This option is intended for use with
upper-case-only terminals such as Teletypes.  All input is forced to
lower case and
all output is forced to upper case.  Upper case letters may be entered
by preceding the letter with the escape character (nominally "@@").
On output,
upper case letters are printed as an escape character followed by
the letter.
.sp
.ti -10
-lf%echo line feed when carriage return is received. The computer
echoes a line feed whenever it receives a carriage return. This is
independent of whether or not echo is on. However, if echo is on,
the line feed is echoed after the carriage return.
.sp
.ti -10
-nolf%do not echo line feed when carriage return is received. The
terminal should have an automatic line feed feature for this mode
to produce desirable results.
.sp
.ti -10
-xon%the computer recognizes the control characters DC1 and DC3
(Control-Q and Control-S)
as X-ON and X-OFF signals, respectively. When X-OFF is received,
output is inhibited until X-ON is received. Characters output by a
program when output is inhibited are not lost, but are buffered
until an X-ON signal is next received.
The options "-xon" and "-xoff" are synonymous, as are
"-noxon" and "-noxoff".
.sp
.ti -10
-noxon%the computer does not recognize X-ON and X-OFF signals.
.sp
.ti -10
-se%the terminal is supported by the screen editor.
User modification of this option is allowed for completeness.
Setting it does not necessarily mean that 'se' will operate
correctly with the terminal.
.sp
.ti -10
-nose%the terminal is not supported by the screen editor.
User modification of this option is allowed for completeness.
.sp
.ti -10
-vth%the terminal is supported by the virtual terminal handler.
User modification of this option is allowed for completeness.
Setting it does not necessarily mean that the 'vth' routines
will operate correctly with the terminal.
.sp
.ti -10
-novth%the terminal is not supported by the virtual terminal handler.
User modification of this option is allowed for completeness.
.in -10
.sp
If no arguments are specified, term prints the values of the
various terminal parameters on standard output one.
.es
term tty
term -lcase -noecho -nolf
term
.me
.in +5
.ti -5
"Usage: term ..." for incorrect arguments.
.in -5
.sa
ek (1), Primos duplx$, gttype (2), gtattr (2)
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
