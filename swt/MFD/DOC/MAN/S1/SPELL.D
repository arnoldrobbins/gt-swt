[cc]mc |
.hd spell "check for possible spelling errors" 06/21/84
spell  [ -(f | v) ]  { <pathname> }
[cc]mc
.ds
'Spell' can be used to check all the words in a document for
presence in a dictionary.
Thus, it provides an indication of words that may be misspelled.
.sp
'Spell' has two modes of operation, controlled by the absence or
presence of the "v" option.
If the "v" option is not specified, 'spell' simply produces a list
of words that it thinks are misspelled.
If "v" is specified, 'spell' will also print the original input
text, following each line with a line containing possibly misspelled
words.
(This is intended to make the erroneous words easier to locate.)
Each text line is preceded by a blank, while each word list line
is preceded by a plus sign ('+');
if the output is redirected to /dev/lps/f, this causes all
misspelled words to be boldfaced.
.sp
Normally, 'spell' ignores input lines that begin with a period,
since those are normally text formatter control directives.
However, the "-f" option can be used to force 'spell' to process
those lines.
.sp
[cc]mc |
If the template =new_words= is defined, 'spell' will treat it as
the pathname of a file into which it will append all words that it
could not find.
This file should be periodically sorted, uniq'ed, and then checked
by hand against a dictionary.  Any real words found in this manner
should be added to =dictionary=.
.sp
[cc]mc
'Spell' supersedes the slower and less functional 'speling' command.
.es
spell report
spell -v report >/dev/lps/f
spell -f arbitrary_text | pg
spell part1 part2 part3 >new_words
files .fmt$ | spell -n
.me
"Usage: spell ..." for improper arguments.
.br
"in dsget:  out of storage space" if there are too many misspelled
words to handle.
[cc]mc |
.bu
Could stand to be made smarter about suffixes and prefixes.
At least it does now handle words with a trailing "'s".
[cc]mc
.sa
speling (1)
