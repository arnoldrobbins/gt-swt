.hd catsub "add replacement text to end of string" 05/29/82
subroutine catsub (lin, from, to, sub, new, k, maxnew)
character lin (MAXLINE), new (maxnew), sub (MAXPAT)
integer from(10), to(10), k, maxnew
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Catsub' adds replacement text onto a string after a pattern
match and substitution operation.
'Lin' is the original text string matched by 'amatch'.
'From' and 'to' are ten-entry arrays specifying the beginning
and end of all tagged subpatterns; the N'th element refers to
the N-1th tagged pattern, and element 1 refers to the entire
string matched.
'Sub' is the substitution pattern created by 'maksub'.
'New' is the string to receive the replacement text;
its maximum length is 'maxnew' and the index at which the
replacement text is to be inserted is 'k'.
.im
The substitution string is copied into 'new' starting at 'k'.
Whenever a DITTO ("&" or "@<digit>") is encountered, a portion
of the original text string is also copied.
.am
new, k
.ca
addset
.sa
maksub (2), makpat (2), change (1), ed (1), se (1)
