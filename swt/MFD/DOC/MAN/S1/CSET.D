[cc]mc |
.hd cset "list information about the ASCII character set" 11/06/82
cset [-i <int> | -k <key> | -m <mnemonic>] [-o (i | k | m)]
.ds
'Cset' is a command that lists various information about the ASCII
character set.  The following arguments may be used to select a
certain ASCII character for display:
.tc \
.ta 6
.in +10
.sp
.ti -5
-i\Information is listed for the character whose integer value is
<int>.  If <int> is in the range 0 through 127 inclusive
the character that will actually be listed is integer value
<int> + 128 since Prime convention is mark parity for all
ASCII characters, otherwise <int> must be in the range 128
to 255 inclusive.  <Integer> may be entered in any radix using
the <radix>r<int> format.
.sp
.ti -5
-k\Information is listed for the character whose keycode matches
<key>.  Keycodes are the actual characters typed to enter the
character:  the character itself if it is simply an upper or lower
case character, or an up arrow (^) to represent the control key
followed by the character typed while holding the control key down.
The only exception is for the rubout key, which is represented as
^#.
.sp
.ti -5
-m\Information is listed for the character whose mnemonic matches
<mnemonic>.  Mnemonics are standard ASCII mnemonics in upper or
lower case.
.in -10
.sp
If none of the above options are present, information for all ASCII
characters is listed.
.sp 2
The following argument may be used to select the output format:
.in +10
.sp
.ti -5
-o\If the string following this argument begins with an "i" (in upper
or lower case), then the output will be the base 10 integer value of
each character selected for display by the above arguments.  If the
string following this argument begins with a "k", then the output will
be the keycodes corresponding to the selected characters.  And if the
string following this argument begins with an "m", then the output
will be the mnemonics for the selected characters.
.in -10
.sp
If this argument is omitted, output will consist of the integer value
of the selected characters in bases 10, 8, and 16, together with the
keycode and mnemonic associated with those characters.
.es
cset
cset -k ^p
cset -m del -o i
cset -i 8r200 -o m
.sa
ctomn (2)
[cc]mc
