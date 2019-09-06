.hd omatch "try to match a single pattern element" 01/07/83
integer function omatch (lin, i, pat, j)
character lin (ARB), pat (MAXPAT)
integer i, j
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Omatch' attempts to match a single pattern element at "pat(j)"
against a character at "lin(i)".
If the match succeeds, 'i' is incremented to point to the next
unexamined character in 'lin'.
The function return is YES if the pattern element matched the text,
NO otherwise.
.im
'Omatch' is essentially a case statement, treating each pattern
element specially.
Non-special characters are directly compared.
The wild-card character matches any non-NEWLINE character in 'lin'.
Beginning-of-line is matched only when 'i' is one.
[cc]mc |
End-of-line is matched only when "lin(i)" is a NEWLINE or an EOS.
[cc]mc
'Locate' is used to match character classes.
If a character is matched, 'i' is incremented by one.
.am
i
.ca
locate, error
[cc]mc *
[cc]mc
.sa
match (2), amatch (2), locate (2)
