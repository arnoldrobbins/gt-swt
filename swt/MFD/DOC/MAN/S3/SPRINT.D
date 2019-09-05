[cc]mc |
.hd sprint "optimize printing on a Spinwriter" 07/23/84
[cc]mc
sprint { <options> } { <file_spec> }
   <options> ::=  -c <copies>       |
                  -h <horiz_space>  |
                  -j                |
                  -l <length>       |
                  -s                |
                  -v <vert_space>   |
                  -x
   <horiz_space>  ::=  0 | 1 | 2 | ... | 14 | 15
   <vert_space>   ::=  1 | 2 | 3 | ... | 15 | 16
.ds
'Sprint' prints files on the user's terminal, making the assumption
[cc]mc |
that the terminal is a NEC Spin Writer model 5520.
[cc]mc
Printing is done bi-directionally, optimizing motion of the print
head and platen as much as possible.
.sp
The following options are available to control 'sprint's behavior:
.in +5
.ta 6
.tc `
.sp
.ti -5
-c`If present, the next argument must be an integer; 'sprint'
will produce the specified number of copies of each file that it
prints.
.sp
.ti -5
-h`If present, the next argument must be an integer in the range
0 to 15. This option controls the horizontal spacing
between characters measured in 1/120ths of an inch.
.sp
.ti -5
-j`'Sprint' will cause a page eject following each file
(or copy of a file, when multiple copies are specified).
Normally, no extra space is inserted between successive
files or copies of the same file.
.sp
.ti -5
-l`If present, the next argument must be an integer; 'sprint'
will use that number as the number of lines per physical page.
It is important that this number match the form length selected
on the terminal itself, else anomalous behavior may result.
'Sprint' assumes there are 66 lines per page, corresponding to
the standard 11 inch form length.
.sp
.ti -5
-s`This option causes 'sprint' to pause at the top of each page
and sound the terminal's audible alarm, allowing the user to insert
a new piece of paper.
Printing continues when the user types an ACK character (ctrl-f).
.sp
.ti -5
-v`If present, the next argument must be an integer in the range
1 to 16. This option controls the vertical spacing
between lines measured in 1/48ths of
an inch.  For example, "-v 2" indicates a spacing of
2/48ths of an inch between lines.  To obtain line and a half
spacing, text should be triple spaced and "-v 4" specified
on the "sprint" command (it is also necessary to set the
page length to 132 with the 'fmt' command ".pl" and specify
a page length of 132 for 'sprint').
.sp
.ti -5
-x`This option prevents the initial page eject.
This option is useful when printing on special forms (mailing labels,
etc.).
.in -5
.sp
The remaining arguments specify files to be printed.
Most often, one or more pathnames will be given, indicating that
the named files are to be printed, or there will be no other
arguments, indicating that input is to be read from standard input.
The full syntax of the <file_spec> construct is described in
the entry for 'cat' in section 1 of the Reference Manual.
.sp
It is assumed that the paper has been mounted so that a form
feed will advance to the first line on the next page.
This may be done by pressing the 'set tof' switch (in the upper right
corner of the keyboard) after the paper has been positioned properly.
.sp
In addition to optimizing print head motion, 'sprint' provides
an extended character set of Greek letters and mathematical symbols
to support the special character functions of the
Software Tools Subsystem text formatter, 'fmt'.
These special graphics are accessed by normal ASCII character codes
with their most significant bit turned [ul off].
(Note that the normal Prime convention is that this bit is always
turned on for text characters.)
The following table shows the correspondence between ASCII character
codes, formatter functions, and special graphics:
.in +5
.sp
.nf
.ne 35
.ul
Character   'Fmt' Function    Graphic
.sp
    a           alpha         lower-case Greek alpha
[cc]mc |
    A           ALPHA         upper-case alpha
[cc]mc
    b           beta          lower-case Greek beta
[cc]mc |
    B           BETA          upper-case beta
    c           chi           lower-case chi
    C           CHI           upper-case chi
[cc]mc
    d           delta         lower-case Greek delta
    D           DELTA         upper-case Greek delta
    e           epsilon       lower-case Greek epsilon
[cc]mc |
    E           EPSILON       upper-case epsilon
[cc]mc
    n           eta           lower-case Greek eta
[cc]mc |
    N           ETA           upper-case eta
[cc]mc
    g           gamma         lower-case Greek gamma
    G           GAMMA         upper-case Greek gamma
    8           infinity      "infinity" symbol
    +           integral      integration symbol
[cc]mc |
    9           INTEGRAL      large integration sign
    i           iota          lower-case iota
    I           IOTA          upper-case iota
    k           kappa         lower-case kappa
    K           KAPPA         upper-case kappa
[cc]mc
    l           lambda        lower-case Greek lambda
    L           LAMBDA        upper-case Greek lambda
    u           mu            lower-case Greek mu
[cc]mc |
    U           MU            upper-case mu
[cc]mc
    ^           nabla         inverted delta (APL del)
    ~           not           EBCDIC-style "not" symbol
    v           nu            lower-case Greek nu
[cc]mc |
    V           NU            upper-case nu
[cc]mc
    w           omega         lower-case Greek omega
    W           OMEGA         upper-case Greek omega
[cc]mc |
    o           omicron       lower-case omicron
    O           OMICRON       upper-case omicron
[cc]mc
    -           partial       partial differential symbol
    p           phi           lower-case Greek phi
    P           PHI           upper-case Greek phi
    y           psi           lower-case Greek psi
    Y           PSI           upper-case Greek psi
    3           pi            lower-case Greek pi
    4           PI            upper-case Greek pi
    r           rho           lower-case Greek rho
[cc]mc |
    R           RHO           upper-case rho
[cc]mc
    s           sigma         lower-case Greek sigma
    S           SIGMA         upper-case Greek sigma
    t           tau           lower-case Greek tau
[cc]mc |
    T           TAU           upper-case tau
[cc]mc
    h           theta         lower-case Greek theta
    H           THETA         upper-case Greek theta
[cc]mc |
    q           upsilon       lower-case upsilon
    Q           UPSILON       upper-case upsilon
[cc]mc
    x           xi            lower-case Greek xi
[cc]mc |
    X           XI            upper-case xi
[cc]mc
    z           zeta          lower-case Greek zeta
[cc]mc |
    Z           ZETA          upper-case zeta
    7           downarrow     arrow pointing down
    6           uparrow       arrow pointing up
    5           backslash     "back slash" symbol
    2           tilde         "tilde" symbol
    0           largerbrace   large square right brace
    1           largelbrace   large square left brace
    =           proportional  "proportional" symbol
    M           apeq          approximately equal to
    ]           ge            greater than or equal to
    @           imp           implies
    [           exist         there exists
    _           AND           logical and
    \           ne            not equal to
    <           psset         proper subset
    >           sset          subset
    ?           le            less than or equal to
    }           nexist        there does not exist
    `           univ          for every
    {           OR            logical or
    |           iso           congruence
    f           lfloor        left floor
    j           rfloor        right floor
    m           lceil         left ceiling
    F           rceil         right ceiling
                small0        a small 0
                small1        a small 1
                small2        a small 2
                small3        a small 3
                small4        a small 4
                small5        a small 5
                small6        a small 6
                small7        a small 7
                small8        a small 8
                small9        a small 9
                scolon        semicolon
                dquote        double quote
                dollar        dollar sign
[cc]mc
.sp
.fi
.in -5
These extended graphics are produced by fractional motions of the
platen and print head and overstriking of standard ASCII graphics.
Best results are obtained when the paper is being fed by the
platen and pinch roller and not by the pin-feed mechanism.
[cc]mc |
.sp
Most of these characters [ul require] the special Times-Roman/Mathematics
type wheel.
[cc]mc
.es
help -p sprint | sprint
sprint junk
sprint -s -l 80 journal_article
sprint -c 5 -j hand_out
.me
.in +5
.ti -5
"Usage: sprint ..." for incorrect argument syntax.
.ti -5
"<filename>: can't open" if given file could not be opened for
reading.
.in -5
.bu
If interrupted by the BREAK key while printing,
'sprint' may hang, waiting for the Spinwriter to acknowledge the
last group of characters sent.
To clear this condition, it is simply necessary to type a ctrl-f
at the keyboard.
If the ctrl-p key is used instead of BREAK,
this condition normally does not occur.
.sp
When multiple copies of a file are requested using the "-c" option,
'sprint' obliges by rewinding the input file and re-reading it.
If the input is being taken from a standard input port, and that
port is not connected to a rewindable device (i.e., a disk file),
then only one copy is produced.
.sp
Error messages are produced on the standard error output port,
which is normally directed to the terminal.
If it is undesirable to have these messages interspersed with the
contents of the printed files, error output should be redirected
to a file.
.sa
cat (1), copy (1), dprint (3), print (1), fmt (1)
