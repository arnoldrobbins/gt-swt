.hd ek "select erase and kill characters" 12/16/81
ek [ <erase character> <kill character> ]
.ds
'Ek' allows the user to select his erase (character delete) and kill
(line delete) characters.  If 'ek' is called with two arguments, the
erase and kill characters are set.
Each of the arguments may be a single character, or an ASCII mnemonic
for an unprintable character.
If 'ek' is called without arguments, the current erase and kill
characters are printed.
.sp
Erase and kill characters are part of the user's permanent profile, and
so will be remembered from session to session.
.es
ek 1 2
ek BS DEL
ek
.me
.in +5
.ti -5
"Usage: ek ..." for improper number of arguments
.br
.in -5
.bu
"ek e k" will produce extremely undesirable effects.
.sa
term (1),
.ul
User's Guide for the Software Tools Subsystem Command Interpreter
