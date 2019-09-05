.hd amatch "look for pattern match at specific location" 05/29/82
integer function amatch (lin, from, pat, tagbeg, tagend)
character lin (ARB), pat (MAXPAT)
integer from, tagbeg (9), tagend (9)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Amatch' checks the substring of the line 'lin' starting at position
'from' to see if it matches the pattern in 'pat'.
'Pat' must have been created by the utility routine 'makpat' beforehand.
If a match occurs, then the arrays 'tagbeg' and 'tagend' are used
to record the beginning and end of any tagged subpatterns that appeared
in 'pat' (i.e., 'tagbeg(N+1)' contains the index in 'lin' of the start
of the Nth tagged subpattern, 'tagend(N+1)' contains the index in 'lin'
of the end of the Nth subpattern, while 'tagbeg(1)' and 'tagend(1)'
bracket the entire matched string).
The function return is the index of the next unexamined character
in 'lin' if a match was found, zero otherwise.
.im
'Amatch' steps through successive entries in the pattern, attempting
to match them against the line of text.
Most of the complexity arises in handling closures;
'amatch' calls 'omatch' repeatedly to match the longest possible
substring, then backs up as necessary to make the remainder of
the pattern match.
This may involve multiple backups, since there may be more than
one closure in a pattern.
.sp
'Omatch' is called to match all single non-closure pattern elements.
If 'omatch' fails, then the stack of pending closures is examined.
If empty, 'amatch' returns zero;
if non-empty, 'amatch' reduces the last closure and attempts to
match again.
.sp
Whenever a pattern tag (open brace or close brace) is encountered
in the pattern, 'amatch' records the current offset in the line
in 'tagbeg' or 'tagend', whichever is appropriate.
.am
tagbeg, tagend
.ca
omatch, patsiz
.bu
Rather slow.
.sa
match (2), makpat (2), omatch (2), find (1), ed (1), se (1)
