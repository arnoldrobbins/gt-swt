.hd decode "perform formatted conversion from character" 03/30/80
integer function decode (str, sp, fmt, fp, ap, a1, ..., a10)
character str (ARB), fmt (ARB)
integer sp, fp, ap
untyped a1, ..., a10
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Decode' is used to convert a character string to a number of
items in various internal formats (e.g. integer, double precision
floating point, address, etc.).
Its function is similar to the Fortran statement of the same name.
.sp
The argument 'str' is the character string to be decoded, and
'sp' indicates the position in 'str' at which decoding is to begin.
'Fmt' is a string of format control directives (discussed below),
and 'fp' indicates the position in 'fmt' of the first format control
directive to be used for decoding.
'A1' through 'a10' (at most) are variables to receive decoded data;
'a2' through 'a10' are optional, and any or all may be omitted.
'Ap' indicates the next variable in the list of 'a1' through 'a10'
to receive decoded data.
.sp
'Decode' performs the decoding operation until it either runs
out of string to decode or of format to control the decoding.
The arguments 'sp', 'fp', and 'ap' are always updated to point
to the next unused character in 'str', the next unused character
in 'fmt', and the next variable in the variable list, respectively.
.sp
The function return is OK if not all of the format string was
used, EOF if all of the format string was used, or ERR if
an input string was in error.
.sp
The format string consists of a series of "format control
directives."
Each directive controls the conversion of a segment of the character
string into some internal form.
A directive consists of the format flag character (an asterisk "*")
followed by up to three comma-separated option fields, and a single
character format specifier.
The option fields are normally designated the "width", "base", and
"delimiter character" fields.
The width field controls the maximum number of characters in the
input string to be converted.
The base field controls the radix representation assumed for
integer fields (and a few other miscellaneous options, discussed
below).
The delimiter character field specifies a character that may be
used to terminate the conversion process for a single variable if
it is encountered in the string.
.sp
The following format specifiers are available:
.in +5
.de F1
.ne 5
.sp
.ti -5
.bf
[1]
.sp
.en F1
.F1 a
The input string must contain an address of the form
"<ring_number>.<segment_number>.<offset>".
The receiving variable must be a two-word address pointer.
.F1 "b or y"
The input string must contain a boolean constant, which may be
1 or 0, TRUE or FALSE, T or F, YES or NO, Y or N.
The receiving variable must be of type integer or type logical.
.F1 "d or f"
The input string must contain a standard Fortran representation
of a double-precision floating-point constant.
The receiving variable must be of type long_real or double_precision.
.F1 g
None of the input string is examined by this format code.
The argument pointer 'ap' is set to the value of the width field;
this allows input items to be re-filled or skipped entirely.
.F1 h
The input string must contain at least as many characters as are
specified by the width field.
The given number of characters are then packed into the receiving
variable, which must be an array of integers larger than
the number of characters divided by two (since there are two
characters per word on the Prime.)
The base field, if nonzero, specifies a limit on the number of
words of the receiving array that will be changed;
thus, if the width field is not specified, the entire input string
(possibly terminated by the delimiter character) will be packed
into the receiving array, but the array will be protected from
overrun by the specification of its size in the base field.
The code 'h' comes from the Fortran term "hollerith literal,"
which is the type of the receiving variable.
.F1 i
The input string must contain a representation of a short
(16-bit) integer constant.
If the base field is non-zero, it is assumed to be the radix used
for representation of the integer.
If zero, base 10 is assumed.
The base specified in the format directive may be overridden in the
input string by giving a radix followed by the letter "r" followed
by the desired value, e.g. "2r1001" or "16rA000".
The receiving variable must be of type integer.
.F1 l
The input string must contain a representation of a long
(32-bit) integer constant.
The syntax and semantics of this form are identical to
form 'i' above, with the exception that the receiving variable
must be of type long_int (integer*4).
.F1 n
The width field specifies the number of newlines in the input
string to be skipped.
If the end of the input string is encountered, the skipping stops.
This code is most often used by the 'input' routine.
.F1 p
The syntax and semantics of this form are identical to the 'h'
form above, with the exception that a period character (".")
will be placed at the end of the receiving array so that its
length may be determined at run time.
.F1 r
The input string must contain a standard Fortran representation
of a single-precision floating point number.
The receiving variable must be of type real.
.F1 s
As many characters as specified by the base field (unless the
delimiter character is encountered first) are copied from the
input string to the receiving variable, which must be an
array of characters.
.F1 t
The string pointer variable 'sp' is set to the value of the
width field, or to the length of the input string, whichever
is shorter.
.F1 u
The values of the width, base, and delimiter character fields
specified on this directive become the default values for the
remainder of the format directives in the format string.
.F1 v
The syntax and semantics of this directive are similar to the
'h' directive above, with the exception that the receiving variable
must be a PL/I-style character-varying array.
.F1 x
The number of characters specified by the width field
(unless the delimiter character is encountered first) are skipped;
that is, the specified portion of the input string is ignored.
.in -5
.im
Impossible to explain to the uninitiated reader.
Please see the code, and a system guru.
.am
sp, fp, ap, a1-a10
.ca
ctoi, ctop, ctoc, length, ctoa, move$, ctov, gctoi,
gctol, ctor, ctod, remark
.sa
input (2), conversion routines ('cto?*') (2)
