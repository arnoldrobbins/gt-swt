.hd rmtabl "remove a symbol table" 03/23/80
subroutine rmtabl (table)
pointer table
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Rmtabl' is used to remove a symbol table created by 'mktabl'.
The sole argument is the address of a symbol table in dynamic storage
space, as returned by 'mktabl'.
.sp
'Rmtabl' deletes each symbol still in the symbol table, so it is not
necessary to empty a symbol table before deleting it (unless symbol
table nodes contain a pointer to dynamic or linked-string storage,
which cannot be reclaimed).
.sp
Please see the manual entry for 'dsinit' for instructions on
initializing the dynamic storage space used by the symbol table
routines.
.im
'Rmtabl' traverses each chain headed by the hash table created by 'mktabl'.
Each symbol table node encountered along the way is returned to free
storage by a call to 'dsfree'.
Once all symbols are removed, the hash table itself is returned by
a similar call.
.ca
dsfree
.sa
mktabl (2), enter (2), lookup (2), delete (2), dsget (2),
dsfree (2), dsinit (2), sctabl (2)
