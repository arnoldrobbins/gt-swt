[cc]mc |
.hd speling "detect spelling errors" 07/24/84
[cc]mc
speling { <filename> }
.ds
'Speling' places on its first standard output
a list of all the words in the named files (or standard input,
if no files are named) that are not in the
dictionary "=dictionary=".
A "word" is a contiguous string of letters.
'Speling' is a shell program; the user is referred to its text
to see how it works.
To see how the word file is constructed,  see  the
files in the directory "=aux=/spelling".
.es
speling report >sp.errs
speling part1 part2 part3 >bogus_words
.fl
.in +5
.ti -5
=dictionary= for dictionary of correct spellings
.in -5
[cc]mc |
.bu
This command is superseded by the faster and more functional
'spell' command.
[cc]mc
.sa
[cc]mc |
common (1), sort (1), spell (1), tlit (1), uniq (1)
[cc]mc
