.hd rot "rotate or reverse strings from STDIN to STDOUT" 03/20/80
rot [ [+ | -] <rotation> ]
.ds
'Rot' circularly rotates character strings found on standard input
the number of positions specified by <rotation>, in a manner similar
to the APL function "reversal/rotate".
Specification of a positive <rotation> will rotate
the string from left to right the number of characters specified.
If <rotation> is negative, the string
will be rotated from right-to-left.
When a string is encountered that
is not as long as the absolute value of
<rotation>, the string is rotated
circularly until the rotation count is exhausted.
.sp
If <rotation> is not
specified, the strings on standard input are reversed,
as with the APL monadic function.
.es
palindromes> rot
ar -t archive | rot -40 | sort | rot 40
rot 5
.sa
take (1), drop (1), iota (1), stake (2), sdrop (2)
