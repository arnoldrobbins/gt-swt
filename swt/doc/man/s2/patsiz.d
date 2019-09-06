.hd patsiz "return size of pattern entry" 05/29/82
integer function patsiz (pat, n)
character pat (MAXPAT)
integer n
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Patsiz' returns the size of the pattern element at "pat(n)".
.im
Characters, start tags, and stop tags have size 2;
beginning-of-line, end-of-line, and wild-card character have size 1;
character classes have arbitrary size encoded at the next word
in the pattern;
closures have size CLOSIZE.
.ca
error
.sa
match (2), amatch (2)
