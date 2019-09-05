[cc]mc |
.hd lacl "List ACL information about a file system object" 09/05/84
lacl {<option>} {<file_spec>}
      <option> ::=  -(a | b | c | l | p | t | v)
.ds
The 'lacl' command will list information about the Access Control Lists
protecting any file system object. If no pathname is specified, 'lacl'
will print ACL information on the current directory.
For a more comprehensive  description of ACL's, see the
help for the 'sacl' command.
For a full description of <file_spec>, see the help on 'cat'.
.sp
Options recognized by 'lacl':
.in +7
.tc \
.ta 5
.de lo
.sp
.ti -4
[1]\
.en lo
.lo -a
List the access pairs describing the ACL for the object.  This is the
default action if no options are specified, and the "-a" must
be specified if you wish to display the pairs when also
specifying the "-t" and "-b" options.
.lo -b
Give the pathname of the object protecting the named item.  The
pathname is the same as the object for specific ACLs, or the name of
the acat involved for access category protection.  The pathname
may also be of an ancestor directory in the case of default specific
ACLs.  If the "-p" option is also given the "-b" is ignored.
.lo -c
Print the access pairs one per column instead of all on the same line.
.lo -l
Long format listing. Acts as if the options "-a[bl]-b[bl]-c[bl]-v[bl]-t" were
all given.
.lo -p
List the priority ACL in effect for the logical disk partition
on which the object resides.
.lo -t
Give the type of the ACL protecting the object. The type is
either "specific", "default specific", "acat", "default acat",
"object is an acat", or "priority".
.lo -v
Verbose form -- echo the pathname of the object being checked
and include separator characters if the "-b", "-l", or "-t"
options have also been selected.
.in -7
.es
lacl -p -v /0/mfd /1/mfd
.sp
lf -fc =vars= | lacl -abv -n
.sp
lacl
.me
"Usage: lacl [-l] [-b [-a]] [-p] [-t] [-c] [-v] {<pathname>}"
for improper command usage.
.br
"Cannot list acl for <pathname>" for various file system errors or
insufficient access rights.
.sa
lf (1), sacl (1), gfdata (3)
[cc]mc
