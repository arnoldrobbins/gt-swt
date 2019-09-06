.hd banner "convert text to banner size" 01/16/83
banner { - | -c <char> } <string>
.ds
'Banner' converts the text in the <string> argument into
large characters for printing on a suitable hard copy
printer. The printer should be able to handle 132 characters
per line.
.sp
Output is produced on standard output 1 and may thus be piped
to some other program or redirected to a file.
.sp
The dash argument, if present, causes the banner to be white-on-black;
if absent, the banner is black-on-white.
.sp
The character used for printing the banner is the rubout, which appears
on the line printer as a small rectangle composed of three vertical lines.
This may be changed to any arbitrary ASCII character by using the
"-c <char>" argument sequence.
.sp
The type font produced is Fortune Light, by the Bauer Type Foundry.
.sp
'Banner' is capable of producing all of the printable ASCII characters
except for the following:
.sp
          ~ ^ \ ` { } [ ] _
.sp
Of these characters, three may be used to specify other special
symbols:  the caret ("^") is interpreted as the "degrees" symbol
(superscript zero), the grave accent ("`") is interpreted as the
'cent' symbol, and the underscore ("_") is interpreted as the
superscript 'th' symbol.
.es
banner "Happy Birthday!" >saved_banner
banner - "Hi Mom"
banner "School of I. C. S." >/dev/lps
.me
"Usage: banner ..." for improper arguments.
.sa
block (3)
