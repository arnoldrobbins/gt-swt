[cc]mc |
.hd fmt "text formatter" 08/27/84
[cc]mc
fmt [ -s | -p<start_page>[-<end_page>]] { <filename> }
.ds
'Fmt' is an extended version of Kernighan and Plauger's 'format'
text formatter.
.sp
Input to 'fmt' consists of text intermixed with formatting
requests and function calls.
Formatting requests are identified by a special character
(called the "control character", normally a period) appearing
in the first column of a line of input.
Such requests are used to change margins, text justification,
underlining and boldfacing, etc.
Function calls appear within square brackets, and are used
to change number registers, query the status of certain internal
formatter variables, and effect partial word boldfacing and
underlining.
.sp
For a complete description of 'fmt', along with a tutorial and
numerous examples, the reader is referred to the
[ul Software Tools Text Formatter User's Guide].
.sp
If the "-s" option is specified, 'fmt' will pause at the top of
each page of output, to allow the user to insert paper manually.
To continue output, the user should type a control-c.
.sp
The "-p" option may be used to limit the pages output by 'fmt'.
Only the given range of pages will be printed.
If the ending page number is omitted, all remaining text will
be printed.
.sp
The files named on the command line are used as sources of input.
The effect is the same as if the contents of all the named files
had been concatenated before processing.
Note:  the filename "-" may be used to indicate the first standard
input.
.sp
The following tables summarize currently-implemented formatting
requests and function calls (and their variants).
.sp
.ce
.bf
Summary of Commands
.sp
.#
.# RQ --- begin a new entry in the request summary
.#
.de RQ <syntax> <init> <default> <break>
@[cc]sp
@[cc]ne 2
@[cc]ti 5
[1]@[tc][2]@[tc][3]@[tc][4]@[tc]
.en RQ
.#
.# HD --- produce heading for request summary
.#
.de HD
@[cc]ne 6
@[cc]ti 5
@[cc]bf 100
Command@[tc]Initial@[tc]If no@[tc]Cause
@[cc]ti 5
Syntax@[tc]Value@[tc]Parameter@[tc]Break@[tc]Explanation
@[cc]bf 0
@[cc]sp
@[cc]ns
.en HD
.#
.# BT --- Begin command table
.#
.de BT <size> <heading text>
@[cc]ne [1]
@[cc]in +40
@[cc]ta 14 24 34 41
@[cc]HD
@[cc]cc ?
.en BT
.#
.# ET --- End command table
.#
.de ET
@[cc]cc
@[cc]in -40
@[cc]sp 2
.en ET
.#
.BT
?RQ  ".#"  -  -  no
Introduce a comment.
?RQ  ".ad c"  both  both  no
Set margin adjustment mode.
[cc]mc |
?RQ  ".am xx" -  -  no
Add additional text to the body of a previously defined macro.
[cc]mc
?RQ  ".bf N"  N=0  N=1  no
Boldface N input text lines.
?RQ  ".bp  [cu +]N"  N=1  next  yes
Begin a new page.
?RQ  ".br"  -  -  yes
Force a break.
?RQ  ".c2 c"  `  `  no
Set no-break control character.
?RQ  ".cc c"  .  .  no
Set basic control character.
?RQ  ".ce N"  N=0  N=1  yes
Center N input text lines.
?RQ  ".de xx"  -  ignored  no
Begin definition or redefinition of a macro.
?RQ  ".dv <stream>" - "end '.dv'"  no
Temporarily divert the output stream to a "filename" or to a
temporary file designated by an integer "N" (to be
[cc]mc |
later read by a ".so N" command) until a 'dv' command
[cc]mc
with no arguments is seen.
?RQ  ".ef /l/c/r/"  blank  blank  no
Set even-numbered page footing.
?RQ  ".eh /l/c/r/"  blank  blank  no
Set even-numbered page heading.
?RQ  ".en xx"  -  ignored  no
End macro definition.
?RQ  ".eo [cu +]N"  N=0  N=0  yes
Set even page offset.
?RQ  ".er text"  -  ignored  no
Write a message to the terminal.
?RQ  ".ex"  -  -  yes
Exit immediately to the Subsystem.
?RQ  ".fi"  on  -  no
Turn on fill mode.
?RQ  ".fo /l/c/r/" blank blank no
Set running page footing.
?RQ  ".he /l/c/r/" blank blank no
Set running page heading.
?RQ  ".hy"  on  -  no
Turn on automatic hyphenation.
[cc]mc |
?RQ  ".if <args>"  -  ignored  maybe
Conditional execution of an input line.
[cc]mc
?RQ  ".in [cu +]N"  N=0  N=0  yes
Indent left margin.
?RQ  ".lm [cu +]N"  N=1  N=1  yes
Set left margin.
?RQ  ".ls N"  N=1  N=1  no
Set line spacing.
?RQ  ".lt [cu +]N"  N=60  N=60  no
Set length of header, footer and titles.
?RQ  ".m1 [cu +]N"  N=3  N=3  no
Set top margin before and including page heading.
?RQ  ".m2 [cu +]N"  N=2  N=2  no
Set top margin after page heading.
?RQ  ".m3 [cu +]N"  N=2  N=2  no
Set bottom margin before page footing.
?RQ  ".m4 [cu +]N"  N=3  N=3  no
Set bottom margin including and after page footing.
?RQ  ".mc <char>"  BLANK  BLANK  no
Set margin character.
?RQ  ".mo [cu +]N"  N=0  N=0  no
Set margin offset.
?RQ  ".na"  -  -  no
Turn off margin adjustment.
?RQ  ".ne N"  -  N=1  yes
Express a need for N contiguous lines.
?RQ  ".nf"  -  -  yes
Turn off fill mode. (Also inhibits adjustment.)
?RQ  ".nh"  -  -  no
Turn off automatic hyphenation.
?RQ  ".ns"  on  -  no
Turn on 'no-space' mode.
?RQ  ".nx file" - "next arg" no
Move on to the next input file.
?RQ  ".of /l/c/r/"  blank  blank  no
Set odd-numbered page footing.
?RQ  ".oh /l/c/r/"  blank  blank  no
Set odd-numbered page heading.
?RQ  ".oo [cu +]N"  N=0  N=0  yes
Set odd page offset.
?RQ  ".pl [cu +]N"  N=66  N=66  no
Set page length.
?RQ  ".pn [cu +]N"  N=1  ignored  no
Set page number.
?RQ  ".po [cu +]N"  N=0  N=0  yes
Set page offset.
[cc]mc |
?RQ  ".ps N M"  N=M=0   N=M=0  yes
Skip pages while (page number mod M) is less than N.
[cc]mc
?RQ  ".rc c"  BLANK  BLANK  no
Set tab replacement character.
?RQ  ".rm [cu +]N"  N=60  N=60  yes
Set right margin.
?RQ  ".rs"  -  -  no
Turn off 'no-space' mode.
?RQ  ".sb"  "off"  -  no
Single blank after end of sentence.
?RQ  ".so <stream>" - ignored no
[cc]mc |
Temporarily alter the input source.  "Stream can be a "-" to
indicate standard input, a "filename," or an integer "N" corresponding
to a temporary file
created by a previous '.dv N' command.
[cc]mc
?RQ  ".sp N"  -  N=1  yes
Put out N blank lines.
?RQ  ".ta N ..."  "9 17 ..."  all  no
Set tab stops.
?RQ  ".tc c"  TAB  TAB  no
Set tab character.
?RQ  ".ti [cu +]N"  N=0  N=0  yes
Temporarily indent left margin.
?RQ  ".tl 'l'c'r'" blank blank yes
Generate a three part title.
?RQ  ".ul N"  N=0  N=1  no
Underline N input text lines.
?RQ  ".xb"  on  -  no
Extra blank after end of sentence.
?ET
[cc]mc |
.ta 16
.tc \
.sp
.ne 8
.ce
.bf
Functions
.in +15
.sp
.ti -15
add\Add constant to number register
(add <reg_number> <constant>)
.ti -15
bf\Boldface arguments on output
.ti -15
cu\Output arguments with a continuous underline
.ti -15
date\Current date; e.g., [date]
.ti -15
day\Current day of the week; e.g., [day]
.ti -15
ldate\Current date: e.g., [ldate]
.ti -15
num\Evaluate number register
(num <pre-inc/dec><reg_number><post-inc/dec>)
.ti -15
rn\Convert argument to a lower-case Roman numeral
.ti -15
RN\Convert argument to an upper-case Roman numeral
.ti -15
set\Set number register to value
(set <reg_number> <constant>)
.ti -15
sub\Output the arguments as a subscript
.ti -15
sup\Output the arguments as a superscript
.ti -15
time\Current time of day; e.g., [time]
.ti -15
ul\Underline the arguments on output
.ti -15
letter\Convert a number to its lower case equivalent
.ti -15
LETTER\Convert a number to its upper case equivalent
.ti -15
vertspace\Change the vertical spacing on NEC Spinwriter
.ti -15
even\Test if number is even
.ti -15
odd\Test if number is odd
.ti -15
cap\Capitalize text
.ti -15
small\Map all characters of text to lower case
.ti -15
plus\Add two numbers
.ti -15
minus\Subtract two numbers
.ti -15
header\Return the page header
.ti -15
evenheader\Return the even page header
.ti -15
oddheader\Return the odd page header
.ti -15
footer\Return the page footer
.ti -15
evenfooter\Return the even page footer
.ti -15
oddfooter\Return the odd page footer
.ti -15
cmp\Perform string comparison
.ti -15
icmp\Perform integer comparison
.ti -15
bottom\Return the number of the last printed line
.ti -15
top\Return the number of the first printed line
.sp
.in -15
.ce
.bf
Variables
.in +10
.ta 11
[cc]mc
.sp
.ti -10
cc\Current basic control character
.ti -10
c2\Current no-break control character
.ti -10
in\Current indentation value
.ti -10
lm\Current left margin value
.ti -10
ln\Current line number on the page
.ti -10
ls\Current line-spacing value
.ti -10
[cc]mc |
lt\Length of titles
.ti -10
[cc]mc
ml\Current macro invocation level
.ti -10
m1\Current margin 1 value
.ti -10
m2\Current margin 2 value
.ti -10
m3\Current margin 3 value
.ti -10
m4\Current margin 4 value
.ti -10
[cc]mc |
ns\True or false if no-space is in effect.
.ti -10
[cc]mc
pl\Current page length value
.ti -10
pn\Current page number
.ti -10
po\Current page offset value
.ti -10
rm\Current right margin value
.ti -10
tc\Current tab character
.ti -10
ti\Current temporary indentation value
.ti -10
tcpn\Current page number, right justified in 4 character field
.sp
.in -10
.ce
.bf
Special Characters
.sp
[cc]mc |
.in +17
.ta 17
.# TE -- table entry
.de TE
.ti -17
.if @[cmp @[1] == *] / @[1]@[bl]@[2]@[tc]@[3] @[4] @[5] @[6] @[7] / @[bl 2]@[1]@[tc]@[2] @[3] @[4] @[5] @[6] @[7] @[8]
.en TE
.TE bl Phantom blank
.TE bs Backspace
.TE alpha lower-case Greek alpha
.TE * ALPHA upper-case Greek alpha
.TE beta lower-case Greek beta
.TE * BETA upper-case Greek beta
.TE * chi lower-case Greek chi
.TE * CHI upper-case Greek chi
.TE delta lower-case Greek delta
.TE * DELTA upper-case Greek delta
.TE epsilon lower-case Greek epsilon
.TE * EPSILON upper-case Greek epsilon
.TE eta lower-case Greek eta
.TE * ETA upper-case Greek eta
.TE gamma lower-case Greek gamma
.TE GAMMA upper-case Greek gamma
.TE infinity "infinity" symbol
.TE integral integration symbol
.TE * INTEGRAL large integration sign
.TE * iota lower-case Greek iota
.TE * IOTA upper-case Greek iota
.TE * kappa lower-case Greek kappa
.TE * KAPPA upper-case Greek kappa
.TE lambda lower-case Greek lambda
.TE LAMBDA upper-case Greek lambda
.TE mu lower-case Greek mu
.TE * MU upper-case Greek mu
.TE nabla inverted delta (APL del)
.TE not EBCDIC-style "not" symbol
.TE * nu lower-case Greek nu
.TE * NU upper-case Greek nu
.TE omega lower-case Greek omega
.TE OMEGA upper-case Greek omega
.TE * omicron lower-case Greek omicron
.TE * OMICRON upper-case Greek omicron
.TE partial partial differential symbol
.TE phi lower-case Greek phi
.TE PHI upper-case Greek phi
.TE psi lower-case Greek psi
.TE PSI upper-case Greek psi
.TE pi lower-case Greek pi
.TE PI upper-case Greek pi
.TE rho lower-case Greek rho
.TE * RHO upper-case Greek rho
.TE sigma lower-case Greek sigma
.TE SIGMA upper-case Greek sigma
.TE tau lower-case Greek tau
.TE * TAU upper-case Greek tau
.TE theta lower-case Greek theta
.TE THETA upper-case Greek theta
.TE * upsilon lower-case Greek upsilon
.TE * UPSILON upper-case Greek upsilon
.TE xi lower-case Greek xi
.TE * XI upper-case Greek xi
.TE zeta lower-case Greek zeta
.TE * ZETA upper-case Greek zeta
.TE * downarrow arrow pointing down
.TE * uparrow arrow pointing up
.TE * backslash "back slash" symbol
.TE * tilde "tilde" symbol
.TE * largerbrace large square right brace
.TE * largelbrace large square left brace
.TE * proportional "proportional" symbol
.TE * apeq approximately equal to
.TE * ge greater than or equal to
.TE * imp implies
.TE * exist there exists
.TE * AND logical and
.TE * ne not equal to
.TE * psset proper subset
.TE * sset subset
.TE * le less than or equal to
.TE * nexist there does not exist
.TE * univ for every
.TE * OR logical or
.TE * iso congruence
.TE * lfloor left floor
.TE * rfloor right floor
.TE * lceil left ceiling
.TE * rceil right ceiling
.TE * small0 a small 0
.TE * small1 a small 1
.TE * small2 a small 2
.TE * small3 a small 3
.TE * small4 a small 4
.TE * small5 a small 5
.TE * small6 a small 6
.TE * small7 a small 7
.TE * small8 a small 8
.TE * small9 a small 9
.TE * scolon semicolon
.TE * dquote double quote
.TE * dollar dollar sign
.in -17
.ta
.tc
.sp
The special characters marked with an asterisk (*) are only available
on the NEC [bf Spinwriter], and so the output of 'fmt' [ul must]
be post-processed with 'sprint'.
.sp
In particular, these characters require that the special
Times-Roman/Mathematics type wheel be in the [bf Spinwriter].
This wheel, in order to accomodate the special characters, lacks certain
of the regular ASCII graphics.  These are substituted for by special
functions. For example, @[scolon] is used to produce a semi-colon.
.#
.# Dprint will eventually (I hope) be worked on to do something reasonable
.# with the special characters it can't do anything about.
.#
.# A.D.R.
.#
[cc]mc
.es
fmt -p3-10 report | dprint
fmt report | os >/dev/lps/f
fmt -s contents tutorial index
.bu
There should be some way to specify multiple ranges of pages to
be printed.
.sa
os (1),
[cc]mc |
dprint (3),
sprint (3),
[cc]mc
.ul
Software Tools Text Formatter User's Guide
