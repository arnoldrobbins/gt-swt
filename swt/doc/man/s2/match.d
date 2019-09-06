.hd match "match pattern anywhere on a line" 05/29/82
integer function match (lin, pat)
character lin (ARB), pat (MAXPAT)
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Match' attempts to find a match for a regular expression
anywhere in a given line of text.
The first argument contains the text line;
the second contains the pattern to be matched.
The function return is YES if the pattern was found anywhere in
the line, NO otherwise.
.sp
The pattern in 'pat' is a standard Subsystem encoded regular
expression.
'Pat' can be generated most conveniently by a call to the routine
'makpat'.
.im
'Match' calls 'amatch' at each position in 'lin', returning
YES whenever 'amatch' indicates it found a match.
If the test fails at all positions, 'match' returns NO.
.ca
amatch
.bu
Not exactly blindingly fast.
.sa
amatch (2), makpat (2), maksub (2), catsub (2), find (1), change (1),
ed (1), se (1),
.ul 2
Introduction to the Software Tools Text Editor,
Software Tools
