[cc]mc |
.hd gtacl$ "get acl protection into ACL common block" 09/04/84
integer function gtacl$ (path, key, at)
character path(ARB)
integer key, at
.sp
Library: vswtlb (standard Subsystem library)
.fs
If 'key' is 1, 'gtacl$' retrieves the standard ACL protection for
the file 'path' into the ACL common block, or if 'key' is 2,
it returns the priority ACL protection into the ACL common block.
'At' is set to YES if the current attach was moved to get to the
specified file. The function return is OK if the information was
was retrieved and ERR otherwise.
.im
'Gtacl$' attempts to attach to the directory containing the file
and then procedes to retrieve the acl information.
It then scans through the returned information and formats it
for further use in the common blocks. If any error is encountered
it attaches home if the attach point has changed and returns an
error, otherwise it returns OK.
.ca
ctov (2), equal (2), follow (2), getto (2), mkpa$ (2), mktr$ (2),
mapstr (2), vtoc (2), Primos pa$lst, Primos ac$lst
.sa
gfdata (2), sfdata (2)
[cc]mc
