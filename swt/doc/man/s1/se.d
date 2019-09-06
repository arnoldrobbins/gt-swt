[cc]mc |
.hd se "screen-oriented text editor" 07/02/84
Usage: se [ -t <term> ] { <pathname> | -<option> }
   <term> ::= adm31  | adm3a  | adm42  | adm5   | anp    |
              b150   | b200   | bantam | bee2   | cg     |
              consul | forsys | fox    | gt40   | h19    |
              hp2621 | hp2626 | hp2648 | hp9845 | hz1420 |
              hz1421 | hz1510 | ibm    | info   | isc    |
              microb | nby    | netron | pst100 | pt45   |
              regent | sbee   | sol    | terak  | trs80  |
              ts1    | tvi    | tvt    | vc4404 | vi200  |
              viewpt | view90 | vt100  | z19
[cc]mc

[cc]mc |
   <opt>  ::= a | c | d[<dir>] | f | g | h[<speed>] |
              i[a | <indent>] | k | l[<lop>] | lm[<col>] |
              m[<opts>] | p[<s | u>] | s<lang> | t[<tabs>] |
              u[<chr>] | v[<col>]  | w[<col>] | -[<row>]
[cc]mc
.ds
In order to understand 'se', you should be familiar with the line
editor 'ed'.
.sp
'Se' works much like 'ed', accepting the same
commands with a few differences.
Rather than
displaying only a single line from the file being edited
(as 'ed' does), 'se' always
displays a "window" onto the  file.
In order to do this, 'se'
must be run from a CRT terminal and must be told what sort of terminal it
is.  If the user entered a valid terminal type when requested to do so
upon entry
into the Subsystem and that terminal type is recognized by 'se', the
"-t[bl]<term>" option may be omitted from the 'se' command.  Otherwise,
either the "-t[bl]<term>" terminal type option must be specified,
or 'se' will prompt the user for the terminal type.
Trying out
'se' will make the screen format evident, so details are not given here.
.sp
'Se' is capable of being used from a variety of different terminals.
New terminal types are easily added by making small additions to the
source code.  In general, all that is required of a terminal is that
it have the ability to home the cursor (position it to the upper left
hand corner of the screen) without erasing the screen's contents,
although backspacing, a screen clear function, and arbitrary cursor
positioning are tremendously helpful.
.sp
[cc]mc |
.#
.# TE -- Terminal Entry
.de TE
.sp
.ti -10
[1]@[tc][2] [3] [4] [5] [6] [7] [8] [9]
.en TE
.#
.# put additional stuff just after it, should work.
.#
[cc]mc
The terminals currently supported are the following:
.in +15
.ta 11
.tc \
[cc]mc |
.TE adm31 Lear-Siegler ADM-31.
.TE adm3a Lear-Siegler ADM-3A.
.TE adm42 Lear-Siegler ADM-42.
.TE adm5 Lear-Siegler ADM-5.
.TE anp Allen and Paul model 1A.
.TE b150 Beehive International B150.
.TE b200 Beehive International B200.
.TE bantam Perkin-Elmer 550.
.TE bee2 Beehive International Model 2.
.TE cg Chromatics Color Graphics Terminal.
.TE consul ADDS Consul 980.
.TE forsys Fortunes Systems Terminal.
.TE fox Perkin-Elmer 1100.
.TE gt40 DEC GT-40 Graphics Terminal with Waugh terminal software
.TE h19 Heath H19 using Heath-mode cursor control (supposedly compatible
[cc]mc
with DEC VT52's, although this has not been verified)
[cc]mc |
.TE hp2621 Hewlett-Packard model 2621.
.TE hp2626 Hewlett-Packard model 2626.
.TE hp2648 Hewlett-Packard model 2648.
.TE hp9845 Hewlett-Packard model 9845C color computer with
[cc]mc
Ray[bl]Robinson's terminal software.
[cc]mc |
.TE hz1420 Hazeltine 1420.
.TE hz1421 Hazeltine 1421.
.TE hz1510 Hazeltine 1510.
.TE ibm IBM 3101.
.TE info Infoton 100.
.TE isc Intelligent Systems Corporation 8001 Color Terminal.
.TE microb Beehive Microb/DM1A.
.TE nby Newbury 7009.
.TE netron Netronics series.
.TE pst100 Prime VT100 look-alike.
.TE pt45 Prime PT45.
.TE regent ADDS Regent 100 and Regent 40.
.TE sbee Beehive International Superbee.
.TE sol Processor Technology Sol computer with software to emulate
[cc]mc
a Beehive B200.
[cc]mc |
.TE terak Terak Microcomputer.
.TE trs80 Radio Shack TRS-80 with Brad Isley's terminal program.
.TE ts1 Falco TS-1.
.TE tvi Televideo 912/920.
.TE tvt Southwest Technical Products TV Typewriter II with computer
[cc]mc
cursor control board and the following cursor controls:
right: control-I, left: control-H, up:  control-K,
home:  control-L, erase screen: control-O, down-and-erase-line:
control-J.
[cc]mc |
.TE vc4404 Volker-Craig 4404.
.TE vi200 Visual 200.
.TE viewpt ADDS Viewpoint 3+.
.TE view90 ADDS Viewpoint 90.
.TE vt100 DEC VT100.
.TE z19 Zenith Z19 (same as Heathkit H19).
[cc]mc
.sp
.in -15
The values associated with screen editor options should immediately
follow their respective key letters, without intervening blanks
between the option letter and the option value.
The options that may be specified on the command line correspond
to options controlled by the "option" (o) command
and are as follows:
.# HI --- hanging indent with text in margin
.#
.de HI <margin width> <margin text>
.sp
.ne 4
.ti -[1]
[2]@[tc]
.en HI
.#
.sp
.ta 11
.ne 10
.ul
Option[tc]Action
.sp
.in +10
.HI 10 a
causes absolute line numbers to be displayed in the line number area
of the screen. The default behavior is to display upper-case letters
with the letter "A" corresponding to the first line in the window.
.HI 10 c
inverts the case of all letters you type (i.e., converts
upper-case to lower-case and vice versa). This option causes
commands to be recognized only in upper-case and alphabetic line
numbers to be displayed and recognized only in lower-case.
.HI 10 d[<dir>]
selects the placement of the current line pointer following
a "d" (delete) command. <dir> must be either ">" or "<".
If ">" is specified, the default behavior is
selected: the line following the deleted lines becomes the new
current line.  If "<" is specified, the line immediately preceding
the deleted lines becomes the new current line.  If neither is
specified, the current value of <dir> is displayed in the status
line.
.HI 10 f
selects Fortran oriented options. This is equivalent to specifying
both the "c" and "t7 +3" (see below) options.
[cc]mc |
.HI 10 g
controls the behavior of the "s" (substitute) command when it is under
the control of a "g" (global) command.  By default, if
a substitute inside a global command fails, 'se' will not continue
with the rest of the lines which might succeed.
If "og" is given, then the global substitute will continue, and lines
which failed will not be affected.  Successive "og" commands
will toggle this behavior.
An explanatory message is placed in the status line.
[cc]mc
.HI 10 h[<baud>]
lets the editor know at what baud rate you are receiving characters.
Baud rates can range from 50 to 19200; the default is 9600.
This option allows the editor to determine how many, if any,
delay characters (nulls) will be output when the hardware line
insert/delete functions of the terminal are being used (if available).
Use of the built-in terminal capabilities to insert/delete lines
speeds up editing over slow-speed lines (i.e., dialups).
Entering 'oh' without an argument will cause your current baud
rate to appear on the status line.
[cc]mc |
.HI 10 "i[a | <indent>]"
selects indent value for lines inserted with "a", "c" and "i"
commands (initially 1).  "a" selects auto-indent which sets the
indent to the value which equals the indent of the previous line.
If <indent> is an integer, then the indent value will be set
to that number.
If neither "a" nor <indent> are specified, the current value
of indent is displayed.
.HI 10 k
Indicates whether the current contents of your edit buffer
has been saved or not by printing either a "saved" or
"not saved" message on your status line.
.HI 10 l[<lop>]
sets the line number display option.
Under control of this option, 'se'  continuously displays
the value of one of three symbolic line numbers in the status line.
<lop> may be any of the following:
.in +5
.ta 6
.HI 5 .
display the current line number
.HI 5 #
display the number of the top line on the screen
.HI 5 $
display the number of the last line in the buffer
.in -5
.ta 11
.sp
If <lop> is omitted, the line number display is disabled.
[cc]mc
.HI 10 lm[<col>]
sets the left margin to <col> which must be a positive integer.
This option will shift your entire screen to the left,
enabling you to see characters at the end of the line that
were previously off the screen; the characters in columns
1 through <col> - 1 will not be visible.  You may continue
editing in the normal fashion.  To reset your screen enter
the command 'olm 1'.
If <col> is omitted, the current left margin column
is displayed in the status line.
.HI 10 "m[d] [<user>]"
displays messages sent to you by other users (via the 'to' command)
while you are editing.  When a message arrives while you
are editing, the word "message" appears on your status line.
To send other users messages while inside of the editor,
you can insert
the text of your message into the edit buffer, and
then issue the command "line1,line2om[bl]<user>",
where "line1" and "line2" are the first and last lines,
respectively, of where you appended your message in the edit
buffer and "<user>" is the login[bl]name or process[bl]id of the
person to whom you want to send a message.  The given lines
are sent and deleted from the edit buffer.  To prevent the lines
from being deleted after they are sent, use the command line
"line1,line2omd[bl]<user>"
[cc]mc |
.HI 10 "p[s | u]"
converts to or from UNIX (tm) compatibility mode.
The "op" command, by itself, will toggle between normal
(Software Tools mode) and UNIX mode.
The command "opu" will force 'se' to use UNIX mode,
while the command "ops" will force 'se' to use Software
Tools mode.
.sp
When in UNIX mode, 'se' uses the following for its patterns and
commands:
.in +5
.ta 6
.HI 5 "?pattern[?]"
searches backwards for a pattern.
.HI 5 ^
matches the beginning of a line.
.HI 5 .
matches any character.
.HI 5 ^
is used to negate character classes.
.HI 5 %
used by itself in the replacement part of a substitute command
represents the replacement part of the previous substitute command.
.tc
.HI 5 "\(<regular expression>\)"
tags pieces of a pattern.
.HI 5 \<digit>
represents the text matched by the tagged sub-pattern
specified by <digit>.
.HI 5 \
is the escape character, instead of @.
.HI 5 t
copies lines.
.HI 5 y
transliterates lines.
.HI 5 ~
does the global exclude on markname
(see the "!" command, in the help on 'ed').
.HI 5 "![<Software Tools Command>]"
will create a new instance of the Software Tools shell, or
execute <Software Tools Command> if it is present (see the "~"
command, in the help on 'ed').
.in -5
.ta 11
.sp
All other characters and commands are the same for both UNIX and
normal (Software Tools) mode.  The help command will always call
up documentation appropriate to the current mode.
UNIX mode is indicated by the message "UNIX" in the status line.
.sp
UNIX mode is available [ul only] in 'se'.  This extension
is not available in 'ed'.
[cc]mc
.HI 10 "s[pma | ftn | f77 | s | f]"
sets other options for case, tabs, etc.,
for one of the three programming languages listed.
The option "oss" is the same as "ospma" and the
option "osf" is the same thing as "osftn" (the corresponding
command line options are "-ss" and "-sf").
If no argument is specified the options effected by this
command revert to their default value.
.HI 10 t[<tabs>]
sets tab stops according to <tabs>.  <tabs> consists of
a series of numbers indicating columns in which tab stops
are to be set.  If a number is preceded by a plus sign ("+"),
it indicates that the number is an increment; stops are set
at regular intervals separated by that many columns, beginning with
the most recently specified absolute column number.  If no such
number precedes the first increment specification, the stops are
set relative to column 1.
By default, tab stops are set in every third column starting with
column 1, corresponding to a <tabs> specification of "+3".
If <tabs> is omitted, the current tab spacing is
displayed in the status line.
.HI 10 u[<chr>]
selects the character that 'se' displays in place of
unprintable characters.  <chr> may be any printable character;
it is initially set to blank.  If <chr> is omitted, 'se' displays
the current replacement character on the status line.
.HI 10 v[<col>]
sets the default "overlay column".  This is the column
at which the cursor is initially positioned by the "v" command.
<Col> must be a positive integer, or a dollar sign ($) to indicate
the end of the line.  If <col> is omitted, the current overlay
column is displayed in the status line.
.HI 10 w[<col>]
sets the "warning threshold" to <col> which must be
a positive integer. Whenever the cursor is  positioned at or
beyond this column, the column number is displayed in the status
line and the terminal's bell is sounded.
If <col> is omitted, the current warning threshold is displayed
in the status line.
The default warning threshold is 74, corresponding to the first column
beyond the right edge of the screen on an 80 column crt.
.HI 10 -[<lnr>]
splits the screen at the line specified by <lnr> which must
be a simple line number within the current window.  All lines above
<lnr> remain frozen on the screen, the line specified by <lnr> is
replaced by a row of dashes, and the space below this row becomes
the new window on the file. Further editing commands do not affect the
lines displayed in the top part of the screen.  If <lnr> is
omitted, the screen is restored to its full size.
.in -10
.sp
Since 'se' takes its commands directly from the terminal, it cannot be
run from a script by using Subsystem I/O redirection, and Subsystem
erase, kill, and escape conventions do not exactly apply.  In fact, 'se'
has its own set of control characters for editing and cursor motion;
their meaning is as follows:
.sp
.ti [in]
.ta 11
.ul
Character[tc]Action
.sp
.in +10
.HI 10 control-a
Toggle insert mode.  The status of the insertion indicator
is inverted.
Insert mode, when enabled, causes characters typed to be
inserted at the current cursor position in the line
instead of overwriting the characters that were there
previously.  When insert mode is in effect, "INSERT" appears
in the status line.
.HI 10 control-b
Scan right and erase.  The current line is scanned from the
current
cursor position to the right margin until an occurrence of the
next character typed is found.  When the character is found, all
characters from the current cursor position up to (but not including)
the scanned character are deleted and the remainder of the line
is moved to the left to close the gap.  The cursor is left in
the same column which is now occupied by the scanned character.
If the line to the right of the cursor does not contain the character
being sought, the terminal's bell is sounded.
'Se' remembers the last character that was scanned using this
or any of the other scanning keys;
if control-b is hit twice in a row, this remembered character is
used instead of a literal control-b.
.HI 10 control-c
Insert blank.  The characters at and to the right of
the current cursor position are moved to the right one column
and a blank is inserted to fill the gap.
.HI 10 control-d
Cursor up.  The effect of this key depends on 'se's current
mode.  When in command mode, the current line pointer is moved
to the previous line without affecting the contents of the command
line.  If the current line pointer is at line 1, the last line
in the file becomes the new current line.
In overlay mode (viz. the "v" command), the cursor is
moved up one line while remaining in the same column.
In append mode, this key is ignored.
.HI 10 control-e
Tab left.  The cursor is moved to the nearest tab stop
to the left of its current position.
.HI 10 control-f
"Funny" return.  The effect of this key depends on the
editor's current mode. In command mode, the current command line is entered
as-is, but is not erased upon completion of the
command; in append mode, the current line is duplicated; in
overlay mode (viz. the "v" command), the current line is restored
to its original state and command mode is reentered (except if
under control of a global prefix).
.HI 10 control-g
Cursor right.  The cursor is moved one column to the right.
.HI 10 control-h
Cursor left.  The cursor is moved one column to the left.
Note that this [ul does not]
erase any characters; it simply moves the cursor.
.HI 10 control-i
Tab right.
The cursor is moved to the next tab stop to the right of its current
position.
.HI 10 control-k
Cursor down.  As with the control-d key, this key's effect depends
on the current editing mode.  In command mode,  the current line pointer
is moved to the next line without changing the contents of the command
line. If the current line pointer is at the last line in the file,
line 1 becomes the new current line.  In overlay mode (viz. the
"v" command), the cursor is moved down one line while remaining in the
same column.  In append mode, control-K has no effect.
.HI 10 control-l
Scan left.  The cursor is positioned according to the character
typed immediately after the control-l.  In effect, the current line is
scanned, starting from the current cursor position and moving left,
for the first occurrence of this character.  If none is found before
the beginning of the line is reached, the scan resumes with the
last character in the line.  If the line does not contain the character
being looked for, the message "NOT FOUND" is printed in the status line.
'Se' remembers the last character
that was scanned for using this key; if the control-l is hit twice in
a row, this remembered character is searched for instead of a literal
control-l.
Apart from this, however, the character typed after control-l is taken
literally, so 'se's case conversion feature does not apply.
.HI 10 control-m
Newline.  This key is identical to the NEWLINE key
described below.
.HI 10 control-n
Scan left and erase.
The current line is scanned from the current cursor position to the
left margin until an occurrence of the next character typed is found.
Then that character and all characters to its right up to
(but not including) the character under the cursor are erased.
The remainder of the line, as well as the cursor are moved to the
left to close the gap.  If the line to the left of the cursor
does not contain the character being sought, the terminal's bell is
sounded.
As with the control-b key,
if control-n is hit twice in a row, the last character scanned for is
used instead of a literal control-n.
.HI 10 control-o
Skip right.  The cursor is moved to the first position beyond
the current end of line.
.HI 10 control-p
Interrupt.  If executing any command except "a", "c", "i" or
"v", 'se' aborts the command and reenters command mode.  The command
line is not erased.
.HI 10 control-q
Fix screen.  The screen is reconstructed from 'se's internal
representation of the screen.
.HI 10 control-r
Erase right.  The character at the current cursor position
is erased and
all characters to its right are moved left one position.
.HI 10 control-s
Scan right.  This key is identical to the control-l key
described above, except that the scan proceeds to the right from
the current cursor position.
.HI 10 control-t
Kill right.  The character at the current cursor position
and all those to its right are erased.
.HI 10 control-u
Erase left.  The character to the left of the current cursor
position is deleted and all characters to its right are moved
to the left to fill the gap.  The cursor is also moved left one
column, leaving it over the same character.
.HI 10 control-v
Skip right and terminate.  The cursor is moved to the current
end of line and the line is terminated.
.HI 10 control-w
Skip left.  The cursor is positioned at column 1.
.HI 10 control-x
Insert tab.  The character under the cursor is moved
right to the next tab stop; the gap is filled with blanks.
The cursor is not moved.
.HI 10 control-y
Kill left.  All characters to the left of the cursor are
erased; those at and to the right of the cursor are moved
to the left to fill the void.  The cursor is left in column 1.
.HI 10 control-z
Toggle case conversion mode.  The status of the case conversion
indicator is inverted; if case inversion was on, it is turned off,
and vice versa.
Case inversion, when in effect, causes all upper case letters to
be converted to lower case, and all lower case letters to be
converted to upper case.  Note, however, that 'se' continues
to recognize alphabetic line numbers in upper case only, in contrast
to the "case inversion" option (see the description of options above).
When case inversion is on, "CASE" appears in the
status line.
.HI 10 control-_
Insert newline.  A newline character is inserted before
the current cursor position, and the cursor is moved one position
to the right.  The newline is displayed according to the current
non-printing replacement character (see the "u" option).
.tc
.HI 10 control-\
Tab left and erase.
Characters are erased starting with the character at the nearest tab
stop to the left of the cursor up to but not including
the character under the cursor.  The rest of the line,
including the cursor, is moved to the left to close the gap.
.tc \
.HI 10 control-^
Tab right and erase.
Characters are erased starting with the character under the cursor
up to but not including the character at the nearest tab stop to
the right of the cursor.  The rest of the line is then
shifted to the left to close the gap.
.HI 10 NEWLINE
Kill right and terminate.  The characters at and to the
right of the current cursor position are deleted,
and the line is terminated.
.HI 10 DEL
Kill all.  The entire line is erased, along with any error
message that appears in the status line.
.HI 10 ESC
Escape.  The ESC key provides a means for entering 'se's
control characters literally as text into the file.  In fact,
any character that can be generated from the keyboard is
taken literally when it immediately follows the ESC key.
If the character is non-printing (as are all of 'se's control characters),
it appears on the screen as the current non-printing
replacement character (normally a blank).
.in -10
.sp
The set of control characters defined above can be used for correcting
mistakes while typing regular editing commands, for correcting commands
that have caused an error message to be displayed, for correcting lines
typed in append mode, or for inline editing using the "v" command
described below.
.sp
There are a few differences in command interpretation between the regular
editor and 'se'.
The only effect of the "p" command in 'se'
is to position the window so that as many as possible of the "printed"
lines are displayed while including the last line in the range.  In fact,
the window is
always positioned  so  that the current line is  displayed.
Typing a "p" command with no line numbers positions the window so
that the line previously at the top of the window is at the bottom.
This can be used to "page" backwards through the file.
The  ":"
command, (which in the regular editor prints about a screenfull
of text starting with a specified line),  positions the window so it
begins at the specified line, and leaves the current line pointer
at this line.
Thus, a ":" can be used to page forward through the file.
.sp
The "overlay" (v) command in the regular editor 'ed' only allows the user
to add onto the end of lines, and can be terminated before the stated
range of lines has been processed by entering a period by itself, as in
the "append" command.  But in 'se', this command allows arbitrary changes
to be made to the lines, and the period has no special meaning.  To abort
before all the lines in the range have been covered, use the "funny
return" character (ctrl-F).  Doing this restores the line containing the
cursor to the state it was in before the "v" command was started.
.sp
'Se' has a "draw box" command that can be used as an aid for preparing
block diagrams, flowcharts, or tables.
The general form is
.sp
.ti +5
top-line,bottom-line zb left-col,right-col character
.sp
For example, "1,10[bl]zb[bl]15,25[bl]*" would draw a box 10 lines high
and 11 columns across, using asterisks.
The upper left corner of the box would be on line 1, column 15,
and the lower right corner on line 10, column 25.
The bottom-line may be omitted to draw horizontal lines, and the
right-col may be omitted to draw vertical lines.
If the "character" at the end of the command is omitted, it is
assumed to be a space, thus allowing erasure of a box or line.
.sp
When the "write" command ("w") is used with a file name that is
different from the name 'se' is remembering,
the message "file[bl]already[bl]exists" will be displayed if the
output file is already present.
If the command is entered again (by typing a NEWLINE),
'se' will perform the write, destroying the existing file.
To circumvent the
warning, enter the write command suffixed by "!" (just like
"quit" or "enter") and 'se' will always write to the file.
.sp
[cc]mc |
When 'se' starts up, it tries to open the file "=home=/.serc".
If that file exists, 'se' reads it, one line at a time, and
executes each line as a command.  If a line has "#" as the [ul first]
character on the line, or if the line is empty, the entire line is
treated as a comment, otherwise it is executed.  Here is a
sample ".serc" file:
.sp
.in +5
.nf
# turn on unix mode, tabs every 8 columns, auto indent
opu
ot+8
oia
.fi
.in -5
.sp
The ".serc" file is useful for setting up personalized options,
without having to type them on the command line every time, and
without using a special shell file in your bin.
In particular, it is useful for automagically turning on UNIX mode
for Software Tools users who are familiar with the UNIX system.
.sp
Command line options are processed [ul after] commands in
the ".serc" file, so, in effect, command line options can be used
to over-ride the defaults in your ".serc" file.
.sp
[bf NOTE]: Commands in the ".serc" file do [ul not] go through
that part of 'se' which processes the special control characters
(see above), so [ul do not] use them in your ".serc" file.
.sp
[cc]mc
For a list of commands accepted by both 'se' and 'ed', see either
the Reference Manual entry for 'ed' ("help ed") or the
.ul
Introduction to the Software Tools Text Editor.
.sp
[cc]mc |
'Se' has an extended line number syntax.  In general, whatever appears
[cc]mc
in the left margin on the screen is an acceptable line number and refers
to the line displayed in that row on the screen.
In particular, upper case letters are often used.  Also, the line
number element "#" is interpreted as being the number of first line of
the current screen.
.es
se -t b200 -c -w70 -t+6
se -t consul textfile
.fl
[cc]mc |
=home=/.serc   'se' start up command file
.sp
[cc]mc
=temp=/se<line><sequence_number> for scratch file
[cc]mc |
.sp
=doc=/se_h/?*   help scripts for the "h" command
.sp
=home=/se.logout  for saving the buffer on a LOGOUT$ condition
[cc]mc
.me
Many. Most are self-explanatory.
.bu
Cannot be run from a script.
.sp
Cannot specify tab stops as the first option if no terminal type
is specified first on the command line.
[cc]mc |
.sp
The auto-indent feature does not recognize a line consisting
of just blanks and then a "." to terminate input, when the "." is
not in the same position as the first non-blank character of the
previous line.
.sp
Should be changed to use the 'vth' terminal operations library, instead
of having code hard-wired in for each terminal type.  Unfortunately,
'vth' isn't quite up to this.
[cc]mc
.sa
ed (1),
.ul
Introduction to the Software Tools Text Editor
