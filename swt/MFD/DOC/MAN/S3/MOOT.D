.hd moot "teleconference manager" 01/15/83
moot [-a <user>]
.ds
'Moot' is a teleconference management program.
It allows users to send messages to one another or to a group
of users participating in a "conference".
Messages may then be received automatically and reviewed at will.
Authorized users may create and destroy conferences,
add users to conferences, etc.
'Moot' is conversationally oriented,
to reduce learning time.
.sp
To participate in any of the active teleconferences, type
.sp
.ti +10
moot
.sp
'Moot' will then ask you for your name.
Respond by typing whatever variant of your name you prefer,
but don't use any semicolons.
We recommend using your calling name and your last name, to prevent
conflicts.
'Moot' will then ask you for a password, which you must cite whenever
you reenter the teleconference.
(Note that the password is never printed on the terminal.)
.sp
If you want to see if a particular user is currently in 'moot'
without getting in
yourself, you can use the "-a <user>" option to check.
.sp
'Moot' allows you to abbreviate anything (user names, conference
names, commands);
simply use initial substrings of each word in the item to be abbreviated.
For example, the command "add member" can be abbreviated (unambiguously)
as "a m", "add m", "a memb", etc.
(However, [ul do not] abbreviate your name the first time you enter
the teleconference.)
.sp
If at any time you are unsure how to proceed, enter a line consisting
only of a question mark;
'moot' will attempt to elaborate on the input it expects.
Ambiguous command abbreviations will also provoke further information.
.sp
Once you have entered the conference successfully, 'moot'
will prompt you for a command by printing the character ".".
You may enter any of the following commands:
.sp
.in +10
.ne 6
.ti -10
add conference
.br
This command is used to create a new conference.
'Moot' will request a conference title and a status
(open or closed, presently ignored),
then prompt for the names of files to be used for storage of the
conference.
The file names supplied should be full pathnames, with passwords
as necessary.
.sp
.ne 2
.ti -10
delete conference
.br
This command will delete a named conference, including all
of its text storage files.
.sp
.ne 5
.ti -10
add member
.br
Membership in a closed conference (currently the only type supported)
is by invitation only.
The "add member" command allows a 'moot' user to join a particular
conference, either as a full participant or just an observer
(without the ability to submit messages to the conference).
.sp
.ne 3
.ti -10
delete member
.br
This command removes a member from a closed conference.
.sp
.ne 3
.ti -10
list conferences
.br
This command lists the names of all currently active conferences.
.sp
.ne 3
.ti -10
list users
.br
This command lists the names and times-of-last-entry for all
teleconference users.
.sp
.ne 5
.ti -10
list members
.br
This command lists, for each member of the current conference
(see "join"), the number of the last entry seen, the time of
last entry, and the status (observer or participant).
.sp
.ne 7
.ti -10
enter
.br
When a user wishes to send a note to another user or to the members
of a conference, he must first enter the text to be sent.
This command prompts for a subject heading, cross-reference
information, and finally for the text itself.
Text entry continues until the user types a control-c
(the standard Subsystem end-of-file signal).
The text so entered fills the user's text buffer, which may be
sent to another user with the "mail" command or submitted to a
conference with the "submit" command.
.sp
.ne 9
.ti -10
edit
.br
This command invokes the Subsystem line editor 'ed', allowing the
user to edit the text in his 'moot' text buffer or to read in
text previously prepared and placed on a file.
(See the [ul Introduction to the Software Tools Text Editor] for a
tutorial on the use of 'ed'.  'Ed's commands are a subset of the
screen editor's.)
Note that the first two lines of the text buffer are used to store
the subject and cross-reference information.
Also note that to save changes made to the text buffer, you must
issue a 'w' command before leaving edit mode with the 'q' command.
.sp
.ne 7
.ti -10
join
.br
When a user wishes to review information from or send information
to the other members of a conference, he must "join" that conference.
When the "join" command prompts for a conference name, simply
type the name of the conference to be joined.
If no conference name is specified, the user is returned to command
level (where he may send and review personal notes to other users).
.sp
.ne 10
.ti -10
review
.br
The "review" command allows the user to re-examine messages sent
by other participants in a conference.
The messages to be reviewed are specified by typing a message number
(e.g. "4") or a range of message numbers (e.g. "1-999")
"Review" uses the Subsystem library routine 'page' to display the
message text.
In practice, this means that the display will be formatted for a
CRT screen, with output stopping after each screenful of information.
The user is then prompted for a command.
The most commonly used commands are carriage return (to advance to
the next page), -<pages> (to back up a given number of pages),
+<pages> (to advance a given number of pages), and q (to quit displaying
information).
For a full description of acceptable commands, see the 'help' entry
for 'pg' or 'page'.
.sp
.ne 7
.ti -10
index
.br
The "index" command allows the user to get a list of messages and a
brief description of the topic of each message.  The user must be
currently in a conference for this command to work.  The messages are
listed with their sequence number within the conference, name of
the sender, subject of the message, and date of submittal to the
conference.  The message list is formatted for the CRT screen similar
to the output of "review"; the Subsystem routine 'page' is used to
display the list a screenful at a time.
.sp
.ne 7
.ti -10
submit
.br
"Submit" takes the contents of the user's text buffer (created by
"enter text") and submits it to the current conference.
The text buffer is not altered, so multiple "submits" may be used
to send messages repeatedly (say, to different conferences).
.sp
.ne 6
.ti -10
authorize
.br
This command allows a user to change the operations that another
user may perform.
The operations are listed, one at a time, along with the current
value (Y or N for yes or no);
the correct response is "y" to enable an operation, "n" to disable
it, "d" to set it to the default value, or simply carriage return
to leave it unchanged.
.sp
.ne 4
.ti -10
status
.br
The "status" command lists the names of all currently logged-in
'moot' users and the name of the current conference, if one has been
joined.
.sp
.ne 6
.ti -10
mail
.br
The "mail" command allows the user to send the contents of his text
buffer as a private communication to another user.
The addressee will receive the letter automatically;
he may review it later with the "letter" command.
.sp
.ne 7
.ti -10
letter
.br
This command is used to review personal notes sent by the "mail"
command.
The index numbers of the notes to be reviewed are specified in
the same manner as those for the "review" command.
The notes on output pagination under "review" also apply to "letter."
.sp
.ne 4
.ti -10
quit
.br
When the "quit" command is issued, the user is logged out from 'moot'
and returned to the Subsystem.
.sp
.in -10
In general, multiple inputs may be typed ahead by separating them
with semicolons.
However, the first parameter of a command must not be separated from
the command;
for example,
you should type "join <conference>" or "review <entry>"
or "mail <user>"
without separators.
.es
.cc #
moot
Please enter your name: George Burdell
Please enter your password:
Welcome to the Moot.
.enter
Subject: bogus messages
Xref: none
Text:
This is an entirely bogus message.
<control-c>
.mail
Addressee: a a
.list conferences
Empirical Metaphysics
.join empirical metaphysics
.review 1-1729
(volumes of stuff would appear here)
.q
#cc
.fl
Everything in =extra=/moot.u
.me
Too many to document at the moment.
.bu
Null inputs match anything, since the null string is an initial substring
of every string.
[cc]mc |
.sp
[cc]mc
There is no way to alter a user's name or password.
[cc]mc |
.sp
[cc]mc
'Moot' uses semaphore 1 for mutual exclusion; if this semaphore is messed up,
'moot' will fail in fairly unpredictable ways.
[cc]mc |
.sp
[cc]mc
When 'moot' fails, it tends to prevent the user from subsequently
logging in.
[cc]mc |
.sp
Inputting a TAB character tends to hang 'moot' in an infinite loop
with breaks disabled, thus preventing the user from stopping the
loop.
[cc]mc
.sa
sema (1)
