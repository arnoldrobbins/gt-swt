[cc]mc |
.hd mkpacl "encode ACL information into a Primos structure" 09/04/84
subroutine mkpacl
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Mkpacl' converts ACL information like that returned by 'gtacl$'
into Primos ACL information in the ACL common block.
.im
The ACL common block is scanned for information and encoded into
an EOS-terminated string a character at a time. When finished,
a call to 'ctov' converts the information into a form that Primos
can use.
.ca
ctoc (2), ctov (2), encode (2)
.sa
lacl (1), sacl (1), gfdata (2), sfdata (2)
[cc]mc
