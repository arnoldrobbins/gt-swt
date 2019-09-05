.hd substr "take a substring of a string" 02/22/82
substr <start> <length> <string>
.ds
'Substr' is similar in function to the PL/I substr function;
it prints on standard output a specified substring of its
third argument.
The substring printed is taken from <string> starting at
position <start> and continuing for <length> characters, or
until the end of <string> is reached.
If <start> is negative, the starting position is -<start>
characters from the end of <string>. If <length> is negative,
characters are extracted from right to left.
.sp
'Substr' is perhaps excessively general; for common problems,
the 'take' and 'drop' commands will usually suffice.
.es
substr 1 2 [date]
substr [start] [len] [full_name]
set last_five = [substr -5 5 [variable]]
.sa
take (1), drop (1), rot (1), substr (2), stake (2), sdrop (2)
