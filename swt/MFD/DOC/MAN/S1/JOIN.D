.hd join "replace newlines with an arbitrary string" 02/22/82
join [ <delimiter> ] [ -l<nlines> ]
.ds
'Join' reads its first standard input, replaces all NEWLINEs
with the <delimiter> string, and writes the result on its first
standard output.  The <delimiter> argument may be specified as
any arbitrary string.  If it is omitted, a single blank is assumed.
If the "-l<nlines>" construct is specified, a maximum of <nlines>
input lines will be joined into each output line.
.es
files .r | join -l10 | change % "ar -u arch " | sh
file1> join "|" >file2
