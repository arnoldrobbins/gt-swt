.hd iota "generate vector of integers" 03/20/80
iota [<lower_limit>] <upper_limit> [-f <format>]
.ds
'Iota' is derived from the monadic APL operator of the same name;
it prints a series of consecutive integers on standard output.
The <upper_limit> and optional <lower_limit> arguments specify
the range of integers to be printed.
The default <lower_limit> is one.
.sp
The <format> argument is a standard format string, identical
to that accepted by 'encode' or 'print'.
Its presence allows the user to select fill characters, field
width, and other parameters associated with the printing of
integers.
.es
iota 10
stack([iota [stack_pointer]])
iota [most_recent] 1
iota -5 5 -f "*4,-16,0i"
.me
"Usage: iota ..." for invalid argument syntax.
.bu
If sharp signs ("#") are included in the format string,
'iota' will die of a pointer fault in 'encode'.
.sa
parscl (2), encode (2), print (2)
