.hd os "convert backspaces to line printer overstrikes" 10/17/82
os { -l <page length> | -x }
.ds
'Os' is a filter that may be used to convert backspaces
(such as those produced by the formatter for underlining
and boldfacing) into standard Fortran line printer carriage
control codes.
.sp
If the output of 'os' is spooled, the Fortran forms control
mode must be in effect.
Use of the "f" option on the 'sp' command or the "f" option
in a "/dev/lps" pathname (e.g. "/dev/lps/f") will enable Fortran
forms control.
.sp
If the "-x" option is included, 'os' will attempt to generate
output for a Printronix printer.  We are told that these
printers can overprint only a single line, and the characters
on that line can only be underscores.  Under "-x", 'os' emits
only the overstriking that can be performed on these printers.
.sp
'Os' will generate a page-eject at the bottom of each page
(to keep the pages correct in case of a paper jam).  The
<page_length> is the number of lines per output page.  If
<page_length> is omitted, 'os' assumes 66 (standard paper).
.es
fmt report | os | sp / f
junk> os >/dev/lps/f/bjunk
.me
"Usage: os ..." for invalid argument syntax.
.sa
sp (1), fos (1)
