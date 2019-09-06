.hd stclos "insert closure entry in pattern" 05/29/82
integer function stclos (pat, j, lastj, lastcl)
character pat (MAXPAT)
integer j, lastj, lastcl
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Stclos' inserts a closure entry into a pattern being built by
'makpat'.
This involves shuffling the last pattern entry far enough to
allow a closure entry to be inserted,
then linking the closure entry to the last closure entry in the
pattern.
'Pat' is the pattern being built;
'j' is the current end of 'pat';
'lastj' is the index in 'pat' of the last element inserted
(the one that is controlled by the closure);
'lastcl' is the index of the last closure entry in 'pat'.
The function return is equal to 'lastj', which is the index
of the new closure after insertion is completed.
.im
A simple loop shuffles the last element down;
several calls to 'addset' then create the closure entry and
link it to the previous closure.
.am
pat, j
.ca
addset
.sa
addset (2), makpat (2)
