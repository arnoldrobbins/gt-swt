.hd radix "change radix of numbers" 08/07/81
radix [ -i <input radix> ] [ -o <output radix> ] { <number> }
.ds
'Radix' is a simple tool that converts numbers from
one radix representation to another.  The "-i" option
specifies the default input radix. (This radix can be
overridden with the "<radix>r<number>" notation accepted
by 'gctol').  The "-o" option specifies the output radix.
If either is omitted, 10 is assumed.
.sp
The numbers specified as arguments are converted to the
output radix and printed on standard output, one number
per line.  If no <number> arguments are specified, 'radix'
reads numbers from standard input (one per line),
converts them, and writes them on standard output (one per line).
.sp
If an illegal character is encountered in a number, it and
all following characters in the number are ignored.
.es
radix 8r177
radix -i10 -o2 39 12 5
radix -i 16
.me
"Usage: radix ..." for invalid argument syntax.
.sa
gctol (2)
