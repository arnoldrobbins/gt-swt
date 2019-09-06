.hd take "take characters from a string (APL style)" 03/20/80
take <length> <string>
.ds
'Take' can be used to extract substrings from the beginning or
end of a string.  It is essentially identical in function to
APL's dyadic take operator as applied to character vectors.
.sp
The absolute value of the first argument specifies the number
of characters to be taken (with blank padding, if the source string
is not long enough.)  If it is positive, characters are taken from
the beginning of <string>; otherwise, characters are taken from the
end of <string>.
.sp
Other useful string-handling commands are 'drop', 'index', and
'substr'.
.es
take 6 [filename]
take -2 [source_file]
take 2 @[date]
take 3 @[day]
.sa
drop (1), index (1), substr (1), stake (2), sdrop (2)
