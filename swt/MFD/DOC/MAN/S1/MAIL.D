.hd mail "send or receive mail" 03/23/82
mail [ -p ] { <login name> }
.ds
'Mail' is the user's interface to the Subsystem postal service.
.sp
If invoked with arguments, 'mail' first verifies that each is the login
name of a Subsystem user,
reads standard input one until end-of-file, and then appends the
message thus read to the mailbox files of all users named.
All letters are postmarked with the sender's login name and the
time and date of the mailing.
.sp
If no argument is present on the command line, the user's own mailbox
file is displayed.
If the "-p" option is not present and standard output is directed to
the user's terminal, letters are printed one CRT screenful at
a time.  (The user may skip or re-examine the mail at this point;
see manual entries for 'pg' (1) and 'page' (2) for further information.)
If anything was in the mailbox,
'mail' then asks the question, "Save mail?". If the response begins with
the letter "n", the mail is discarded; otherwise, the contents of
the mailbox are appended to the file named
by the template "=mailfile=" (Subsystem default is =varsdir=/.mail).
.es
mail
mail spaf
   (message follows, terminated by end-of-file (Control-C))
mail perry dan myers
   (message follows, terminated by end-of-file (Control-C))
.fl
=mail=/<login_name> for mailboxes
.br
=mailfile= for mail save file
.me
.in +5
.ti -5
"Usage: mail ..." for invalid arguments.
.ti -5
"Save mail?" to ask if mail should be saved.
.ti -5
"can't create temporary file" if a temporary file can't be created
to hold the letter for distribution.
.ti -5
"can't open <user>'s mailbox" if the mail delivery file for <user>
can't be opened.
.in -5
.bu
Mail messages are neither secure nor private.
.sa
to (1)
