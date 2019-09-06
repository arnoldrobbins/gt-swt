[cc]mc |
.hd lz "post process 'fmt' output for laser printer" 10/24/84
.# it would be 'lazer', but that would screw up the index. oh well.
lz [-i] [-l <page_size>]
.ds
'Lz' post processes output from 'fmt' for the Xerox 9700 laser
printer owned by the Georgia Tech Office of Computing Services.
In particular, it outputs the necessary control statements to get
actual boldfacing and italics.
.ul
These control statements are Georgia Tech specific.
.sp
The 'fmt' input files should expect a page that is 100 columns
wide by 87 lines down.  The laser printer automatically
supplies 1/2 inch margins on all sides, so the [bf .m1]
through [bf .m4] values
in 'fmt' need to be set appropriately, as well as the page
and margin offsets, and the left and right margins.
.sp
'Lz' does actual underlining for text that is underlined.
If the '-i' option is supplied, 'lz' will print underlined text
in italics, instead.
.sp
The length of the output page can be given with the '-l' option.
'Lz' defaults to 87 lines per page.
.es
fmt =fmac=/evl =doc=/guide/ed | lz >file_for_xerox
.me
"Usage: lz ..." for improper arguments.
.bu
Locally supported.
.sa
fmt (1), os (1), =fmac=/evl, =fmac=/evl2
[cc]mc
