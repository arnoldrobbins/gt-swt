.hd dsdbiu "dump contents of dynamic storage block" 02/25/80
subroutine dsdbiu (block, form)
pointer block
character form
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Dsdbiu' is called by 'dsdump' to dump the contents of a block
of storage that has been allocated by 'dsget'.
The first argument is a pointer to the control words of the block;
the second is LETTER for a character dump, DIGIT for a numeric dump.
.sp
This routine is technically not available for direct call by the user,
since the format and location of block control words is subject to
change.
.im
The SIZE control word of the block is read to obtain the size of the
block, and that many words are written to ERROUT via 'print' in
the particular format specified.
The first argument is incremented to point to the end of the block.
.am
block
.ca
print
.bu
None that can be helped.
.sa
dsget (2), dsfree (2), dsinit (2), dsdump (2)
