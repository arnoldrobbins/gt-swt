.hd chkstr "check a string for printable characters" 03/22/82
integer function chkstr (str, len)
character str (ARB)
integer len
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Chkstr' looks to see if the characters in a string are all printable.
If an EOS character is encountered before
any unprintable characters are encountered and before 'len' characters
are examined, 'chkstr' returns YES; otherwise, it returns NO.
.sp
If 'len' is less than or equal to zero, 'chkstr' returns NO.
.im
'Chkstr' starts examining the string at the first character; as long as
the character is not an EOS and is printable and 'len' characters have
not been examined, 'chkstr' continues to
examine the remainder of the string.  When an unprintable or EOS
character is found, or when 'len' characters has been examined,
'chkstr' quits; it returns YES if it has encountered an EOS character,
and NO otherwise.
.sa
ctomn (2), mntoc (2)
