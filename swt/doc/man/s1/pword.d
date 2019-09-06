[cc]mc |
.hd pword "change login password" 08/24/84
pword
.ds
'Pword' changes a user's login password.
A Primos login password consists of up to 16 letters, numbers, and
the following special characters:
'#', '$', '&', '*', '-', '.', and '/'.
Null passwords (consisting of no characters) may or may not be
allowed depending on the specific system.
.sp
'Pword' turns off terminal echo (to prevent someone from peeking)
and requests the old password.
It then requests the new password.
The new password is requested a second time
to verify that the user is changing his
password to the correct string. If the two new passwords differ in
any way then an error message is printed and the users password is
left unchanged.
'Pword' then calls the Primos routine CHG$PW to change the user's
password. Any errors are interpreted and printed on the terminal.
.es
pword
Old password: old.password
New password: new.password$
Reenter new password for verification: new.password$
.me
"One of the passwords was illegal" if a password containing an
illegal character is entered.
.sp
"The old password did not match the actual password" if the old
password entered did not match the actual old password of the account.
.sp
"Disk is write protected. See system administrator" if the disk on
which the passwords reside is write protected.
.sa
Primos CHANGE_PASSWORD command, Primos chg$pw
[cc]mc
