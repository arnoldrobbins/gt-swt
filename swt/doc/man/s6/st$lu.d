.hd st$lu "internal symbol table lookup" 03/23/80
integer function st$lu (symbol, node, pred, table)
character symbol (ARB)
pointer node, pred, table
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'St$lu' attempts to find the character-string symbol given as its first
argument in the symbol table given as its fourth argument.
If the symbol is present, a pointer to its node is returned in 'node'
and 'st$lu'  returns YES;
otherwise, 'st$lu' returns NO.
In both cases, 'pred' is set to the address of the link field of the
previous
node, i.e. the one that points to the desired node (if it is present)
or is at the end of the appropriate hash chain (if it is not present).
.sp
'St$lu' is not intended for general use;
the symbol table interface routines 'enter', 'lookup', and
'delete' are provided for that purpose.
.im
'St$lu' hashes the character string by summing the internal representations
of its characters and then reducing this number modulo the hash table size
(a prime number).
This hash is used as an index into a hash table containing heads of
linked lists of symbol table nodes.
The appropriate list is then searched linearly for a node
containing the desired symbol text.
The utility routine 'equal' is used for performing string comparisons.
.sp
If the symbol is found, then its index and its predecessor's link
field index are returned, along with the function value YES.
Otherwise, the address of the last link field in the appropriate
chain is returned, along with the function value NO.
The combination of node address/predecessor address is designed
to make insertion, deletion, and updating of symbol table nodes
relatively easy.
.am
pred, node
.ca
equal
.sa
enter (2), lookup (2), delete (2), mktabl (2), rmtabl (2),
dsget (2), dsfree (2), dsinit (2), sctabl (2)
