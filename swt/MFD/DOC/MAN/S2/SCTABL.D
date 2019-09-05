.hd sctabl "scan all symbols in a symbol table" 01/07/83
integer function sctabl (table, symbol, info, posn)
pointer table, posn
untyped info (ARB)
character symbol (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Sctabl' provides a means of accessing all symbols present in a
symbol table (c.f. 'mktabl') without knowledge of the table's
internal structure.
After a simple initialization (see below), successive calls
to 'sctabl' return symbols and their associated information.
When the return value of 'sctabl' is EOF, the entire table
has been scanned.
.sp
The first argument is the index in dynamic storage of the symbol
table to be accessed.
(This should be the value returned by 'mktabl'.)
.sp
The second and third arguments receive the character text of and
integer information associated with the symbol currently under
scan.
.sp
The fourth argument is used to keep track of the current position
in the symbol table.
It must be initialized to zero before 'sctabl' is called for the
first time for a given scan.
Furthermore, if the scan must be terminated early (before 'sctabl'
returns EOF) the dynamic storage area pointed to by this argument
must be freed, e.g. with "call dsfree (posn)".
.sp
The function return is EOF when the entire table has been scanned,
and not EOF otherwise.
.im
If 'posn' is zero, 'sctabl' allocates two words of dynamic memory
and assigns their location to it.
These words are used to keep track of (1) the hash table bucket
currently in use and (2) the position in the bucket's list of the
next symbol.
If a symbol is available in the current list, 'sctabl'
returns its data and records the position of the next symbol in
the list;
otherwise, it moves to the next bucket and examines that list.
If there are no more buckets in the symbol table, the position
information pointed to by 'posn' is returned via a call to 'dsfree'
and EOF is returned as the function value.
Incidentally, 'posn' is set to zero when the end of the table is
encountered.
.am
symbol, info, posn
.ca
dsget, dsfree, scopy
.bu
A call to 'enter' must be made to update the information associated
with a symbol.
If new symbols are entered or old symbols deleted during a scan,
the results are unpredictable.
The argument order is bogus; all the other symbol table routines
have the table pointer as the last argument.
.sa
lookup (2), delete (2), mktabl (2), rmtabl (2), st$lu (6),
dsget (2), dsfree (2), dsinit (2)
