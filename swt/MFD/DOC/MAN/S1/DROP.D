.hd drop "drop characters from a string (APL-style)" 03/20/80
drop ( <length> | -<length> )  <string>
.ds
'Drop' performs the function of the APL dyadic drop operator.
The absolute value of the first argument is the number of characters
to be dropped.  If the number is positive, they are dropped from
the front of the string; if negative, they are dropped from the
end of the string. The result is printed on standard output one.
.sp
If more characters are dropped than exist in the string, a null
string is printed.
.es
drop 2 [filename]
cat [drop -2 source]
.sa
take (1), substr (1), stake (2), sdrop (2), substr (2)
