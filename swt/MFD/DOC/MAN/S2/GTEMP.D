.hd gtemp "parse a template into name and definition" 03/25/82
integer function gtemp (str, nm, repl)
character str (ARB), nm (MAXARG), repl (MAXARG)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Gtemp' takes a NEWLINE or EOS terminated character string
in 'str' and assigns the first blank-delimited token to 'nm'
and the remaining characters of the string to 'repl'.  Leading
and trailing blanks are removed from both 'nm' and 'repl'.
Ratfor-style (beginning with a sharp sign) comments are also
ignored.
If the input string consists only of blanks and comments,
'gtemp' returns EOF and 'nm' and 'repl' are unmodified; otherwise
'gtemp' returns OK.
.im
'Gtemp' first removes any trailing comments
(begun with a sharp sign, as in Ratfor) and leading and
trailing blanks from the string.  It then selects the
first blank-delimited token from the string,
and assigns it to 'nm'.  Then, after removing
intervening blanks, 'gtemp' assigns the remaining characters
of the string to 'repl'.
.am
nm, repl
.sa
ldtmp$ (6)
