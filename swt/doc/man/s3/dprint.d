[cc]mc |
.hd dprint "optimize printing on a Diablo" 08/28/84
dprint {-c <copies> | -j | -l <length> | -s | -x} { <file_spec> }
[cc]mc
.ds
'Dprint' prints files on the user's terminal, making the assumption
that the terminal is a Diablo model 1610 or 1620.
Printing is done bi-directionally, optimizing motion of the print
head and platen as much as possible.
.sp
The following options are available to control 'dprint's behavior:
.in +5
.ta 6
.tc `
.sp
.ti -5
-c`If present, the next argument must be an integer; 'dprint'
will produce the specified number of copies of each file that it
prints.
.sp
.ti -5
-j`'Dprint' will cause a page eject following each file
(or copy of a file, when multiple copies are specified).
Normally, no extra space is inserted between successive
files or copies of the same file.
.sp
.ti -5
-l`If present, the next argument must be an integer; 'dprint'
will use that number as the number of lines per physical page.
It is important that this number match the form length selected
on the terminal itself, else anomalous behavior may result.
'Dprint' assumes there are 66 lines per page, corresponding to
the standard 11 inch form length.
.sp
.ti -5
-s`This option causes 'dprint' to pause at the top of each page
and sound the terminal's audible alarm, allowing the user to insert
a new piece of paper.
Printing continues when the user types an ACK character (ctrl-f).
[cc]mc |
.sp
.ti -5
-x`This option prevents the initial page eject.
This option is useful when printing on special forms (mailing labels,
etc.).
Since the diablo does not support relative vertical motion this
option should only be used when the paper/form is initially
at top of form.
[cc]mc
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
In addition to optimizing print head motion, 'dprint' provides
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
    b           beta          lower-case Greek beta
    d           delta         lower-case Greek delta
    D           DELTA         upper-case Greek delta
    e           epsilon       lower-case Greek epsilon
    n           eta           lower-case Greek eta
    g           gamma         lower-case Greek gamma
    G           GAMMA         upper-case Greek gamma
    8           infinity      "infinity" symbol
    +           integral      integration symbol
    l           lambda        lower-case Greek lambda
    L           LAMBDA        upper-case Greek lambda
    u           mu            lower-case Greek mu
    ^           nabla         inverted delta (APL del)
    ~           not           EBCDIC-style "not" symbol
    v           nu            lower-case Greek nu
    w           omega         lower-case Greek omega
    W           OMEGA         upper-case Greek omega
    -           partial       partial differential symbol
    p           phi           lower-case Greek phi
    P           PHI           upper-case Greek phi
    y           psi           lower-case Greek psi
    Y           PSI           upper-case Greek psi
    3           pi            lower-case Greek pi
    4           PI            upper-case Greek pi
    r           rho           lower-case Greek rho
    s           sigma         lower-case Greek sigma
    S           SIGMA         upper-case Greek sigma
    t           tau           lower-case Greek tau
    h           theta         lower-case Greek theta
    H           THETA         upper-case Greek theta
    x           xi            lower-case Greek xi
    z           zeta          lower-case Greek zeta
.sp
.fi
.in -5
These extended graphics are produced by fractional motions of the
platen and print head and overstriking of standard ASCII graphics.
Best results are obtained when the paper is being fed by the
platen and pinch roller and not by the pin-feed mechanism.
.es
help -p dprint | dprint
dprint junk
dprint -s -l 80 journal_article
dprint -c 5 -j hand_out
.me
.in +5
.ti -5
"Usage: dprint ..." for incorrect argument syntax.
.ti -5
"<filename>: can't open" if given file could not be opened for
reading.
.in -5
.bu
If interrupted by the BREAK key while printing,
'dprint' may hang, waiting for the Diablo to acknowledge the
last group of characters sent.
To clear this condition, it is simply necessary to type a ctrl-f
at the keyboard.
If the ctrl-p key is used instead of BREAK,
this condition normally does not occur.
.sp
When multiple copies of a file are requested using the "-c" option,
'dprint' obliges by rewinding the input file and re-reading it.
If the input is being taken from a standard input port, and that
port is not connected to a rewindable device (i.e., a disk file),
then only one copy is produced.
.sp
Error messages are produced on the standard error output port,
which is normally directed to the terminal.
If it is undesirable to have these messages interspersed with the
contents of the printed files, error output should be redirected
to a file.
[cc]mc |
.sp
Does not currently handle the full set of 'fmt' special characters.
.# This will eventually be fixed, I hope.
[cc]mc
.sa
cat (1), copy (1), fmt (1), print (1), sprint (3)
