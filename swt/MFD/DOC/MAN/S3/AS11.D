.hd as11 "PDP-11 cross assembler" 01/13/83
as11 [g][l[a]]
.ds
'As11' converts an assembly language program into a GT40
load stream.  If the load stream is sent to the GT40 while
it is running its ROM bootstrap (start address 166000 octal), the
program will be loaded and executed (assuming no errors) on
that machine.
.sp
The single argument to 'as11' is a list of option letters.
The GT40 load stream will be produced only if "g" is specified.
The "l" option will cause a listing to be produced.  The
listing is essentially a trace of the assembly process,
including what code is generated into what addresses and
what values are assigned to symbols.  The line number of
the source line responsible for each action is given.
The source code is not listed.
If "la" is specified, the listing will be produced for all
passes, otherwise only for the last pass.  The listing
for all passes feature exists mainly for debugging the
assembler.
.sp
If a listing is requested, it goes to standard output (1).
The GT40 load stream, if requested, is written to standard
output 2.  As usual, error messages go to standard output 3.
.sp
For those familiar with other PDP-11 assemblers, here are the
main distinguishing characteristics of 'as11':
.in +5
.sp
.ti -5
Statements are separated with semicolons or newlines.
.sp
.ti -5
There is no ".word" directive; expression  statements are used
instead.
.sp
.ti -5
Comments are Ratfor-style: initiated by a sharp ("#") and closed
by the next newline.
.sp
.ti -5
Symbols may have up to 100 characters in their names, all
of which are significant.  They may begin with digits so
long as they do not meet the syntax for numbers.
Among the characters that are legal in symbols are the letters
and digits, ".", "_", and "'" so long as it is not leading.
.sp
.ti -5
There are Knuth-style local labels, e. g. "1h", "1f", "1b".
.sp
.ti -5
Numbers can be octal, decimal, hexadecimal, or default base.
The default base, which defaults to 10, is settable by
assignment to the symbol named "base'".  Explicit indication
of base is leading zero for octal, trailing "." for decimal,
and trailing "'" for hex.
Hex digits are from the set 0-9A-F (capital letters).
.sp
.ti -5
Strings are typed in single quotes, with a pair of single quotes
within the string representing a single quote.  One- or
two-character strings can be used as literal constants.
.sp
.ti -5
Expressions are evaluated
left-to-right (this is subject to drastic
[cc]mc |
change) but with unary operators being evaluated before binary.
[cc]mc
Operators are "+",
"-", "*", "/", "&" (bit-by-bit AND), "|" (OR), "~" (read "without"
and meaning AND NOT)
"<" (shifted left by), and ">" (shifted right by).  The sense of
unary operators is binary operators with a default left argument.
This works so that unary "-" means minus, "~" works as NOT, and
"< n" is as "1 < n", i. e. a word with only bit n on.  There
is no way to control grouping in expressions.
Missing operators in expressions are interpreted as "+".
.sp
.ti -5
Arbitrary assignment to the location counter is allowed.  Code
is output in the order that it is specified.  This makes it
possible to start a display while the load is still going on.
.sp
.ti -5
Symbols are predefined (in lower case) for the PDP-11/20 instruction
set as well as for all the VT40 (GT40 display processor) instructions
and for important addresses on the GT40 (device registers, etc.).
Upper case symbols are predefined for all the ASCII control
codes (CR, LF, etc.).
.sp
.ti -5
Defining data structures is simplified with two new pseudo-ops
named ".struct" and ".reserve", for details on which see the 'as11'
reference manual.  As an example,
.nf
.in +5
.cc \
.struct tnode     left 2, right 2, info 80
\cc .
.ti -5
is equivalent to
tnode = 0
left = tnode; tnode = tnode + 2
right = tnode; tnode = tnode + 2
info = tnode; tnode = tnode + 80
.fi
.in -5
.ti -5
Multiple assignments to symbols, whether by assignment
statement (with "=") or by label (with ":"), are completely
legal.  The most recent definition is the one in effect.
.ti -5
The assembler makes sufficient passes to define all symbols,
if possible.  An arbitrary number of passes may be required.
The location counter can be undefined over portions of passes
other than the last.
.in -5
.es
source> as11 gl >listing >object >errors
term.s> as11 g 2>object
as11 la
try.s> as11
.me
.in +5
.ti -5
"Usage: as11 ..." for invalid argument syntax.
.ti -5
"-" at the start of each pass.
.ti -5
"can't happen" messages for conditions not expected by the author.
.ti -5
"In gtok: string too long" for an overlong string.
.ti -5
"Too many tokens in source program" indicates that a table needs
to be enlarged.
.ti -5
"Too many tokens put back" should not occur.
.ti -5
"Unrecognized statement"
.ti -5
"Syntax error in .byte directive"
.ti -5
"Bad syntax in .struct or .reserve directive"
.ti -5
"Bad syntax in string statement"
.ti -5
"Bad syntax in assignment"
.ti -5
"Instruction syntax"
.ti -5
"Bad syntax in branch instruction"
.in -5
.bu
Locally supported.
.sa
focld (3), as6800 (3), as8080 (3),
.ul
PDP-11 Cross Assembler Reference Manual
