[cc]mc |
.hd strbsr "perform a binary search of a string table" 08/28/84
[cc]mc
integer function strbsr (pos, tab, offs, object)
integer pos (ARB), offs
character tab (ARB), object (ARB)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Strbsr' is used to perform a binary search on a table created by
the Ratfor 'string_table' declaration.
The first argument is the position array, the second is the array
of string text and additional information, the third is the offset
of the string text in the 'tab' array (i.e., the number of words
of additional data associated with each entry), and the last argument
is a string containing the text to be sought.
.sp
The function return is the index of the element in the 'pos' array
that indexes the appropriate entry in 'tab' if 'object' was found;
EOF otherwise.
.sp
See the
.ul
[cc]mc |
User's Guide for the Ratfor Preprocessor
[cc]mc
for a description of the 'string_table' declaration.
.sp
WARNING:  the string table passed to 'strbsr' must be
.ul
sorted,
otherwise the binary search will fail.
.im
'Strbsr' is a straightforward binary search routine, using
'strcmp' to determine lexical ordering of strings.
.ca
strcmp
.bu
Opaquely documented.
.sa
strlsr (2),
.ul
[cc]mc |
User's Guide for the Ratfor Preprocessor
[cc]mc
