.hd whois "find the user associated with a login name" 02/22/82
whois (- | { <login-name> })
.ds
'Whois' is used to determine the name of the user associated with
a particular login name.
The most frequent usage is "whois <login_name>", which looks up the login
name specified and prints the name of its owner.  If the "-" option is
specified, 'whois' prints the entire name list.  If no argument is given,
'whois' accepts a list of login names from standard input and prints the
name of the owner of each.
.es
whois -
[cc]mc |
whois - | pg
[cc]mc
whois allen perry dan
.fl
=userlist= for name list
[cc]mc |
.bu
Has a grubby output format due to the incredibly long user login names.
[cc]mc
.sa
us (1), vfyusr (2), who (3)
