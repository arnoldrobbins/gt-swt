.hd lookup "retrieve information from a symbol table" 03/25/82
integer function lookup (symbol, info, table)
character symbol (ARB)
untyped info (ARB)
pointer table
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Lookup' examines the symbol table given as its third argument for the
presence of the character-string symbol given as its first argument.
If the symbol is not present, 'lookup' returns 'NO'.
If the symbol is present, the information associated with it is copied
into the information array passed as the second argument to 'lookup',
and 'lookup' returns 'YES'.
.sp
The symbol table used must have been created by the routine 'mktabl'.
The size of the information array must be at least as great as the
symbol table node size, specified at its creation.
.sp
Note that all symbol table routines use dynamic storage space, which
must have been previously initialized by a call to 'dsinit'.
.im
'Lookup' calls 'st$lu' to determine the location of the symbol in the
table.
If 'st$lu' returns NO, then the symbol is not present, and 'lookup'
returns NO.
Otherwise, 'lookup' copies the information field from the appropriate
node of the symbol table into the information array and returns
YES.
.am
info
.ca
st$lu
.sa
enter (2), delete (2), mktabl (2), rmtabl (2), st$lu (6),
sctabl (2), dsinit (2), dsget (2), dsfree (2)
