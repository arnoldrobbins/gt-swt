[cc]mc |
.hd group "test or list a users group identities" 07/22/83
group [-a | -o] {<group_list>}
.ds
'Group' lists a user's currently active
groups or tests for combinations of groups. With no
arguments, 'group' lists all of a users currently active groups. The "-a"
option causes 'group' to return a "1" if all the groups
listed are active (i.e. returns the logical AND) and '0' otherwise.
The "-o" option causes 'group' to return "1" if any of the listed
groups are currently active (i.e. returns the logical OR) and
a '0' otherwise.
If a "<group_list>" is specified with no flag argument then 'group'
assumes "-a".
.es
group
group .guru
group -a .demo .system
group -o .test .strange
.me
"can't retrieve group names" if an error in the call to GETID$
occurs.
.sa
Primos List_Group command
[cc]mc
