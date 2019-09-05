.hd enter "place symbol in symbol table" 03/25/82
integer function enter (symbol, info, table)
character symbol (ARB)
integer info (ARB)
pointer table
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Enter' places the character-string symbol given as its first argument,
along with the information given in its second argument, into the symbol
table given as its first argument.
The function return value (which is ignored by almost everyone) is
a pointer to the dynamic storage area containing the text of the
symbol.
.sp
The symbol table used must have been created by the routine 'mktabl'.
The size of the info array must be at least as large as the symbol
table node size, determined at table creation time.
.sp
Should the given symbol already be present in the symbol table,
its information field will simply be overwritten with the new information.
.sp
'Enter' uses the dynamic storage management routines, which
require initialization by the user; see 'dsinit' for further details.
.im
'Enter' calls 'st$lu' to find the proper location for the symbol.
If the symbol is not present in the table, a call to 'dsget' fetches
a block of memory of sufficient size, which is then linked onto the
proper chain from the hash table.
Once the location of the node for the given symbol is known, the
contents of the information array are copied into the node's information
field.
.ca
st$lu, dsget, scopy
.sa
lookup (2), delete (2), mktabl (2), rmtabl (2), st$lu (6),
dsget (2), dsfree (2), dsinit (2), sctabl (2)
