.hd cto "copy STDIN to STDOUT up to a sentinel" 03/20/80
cto [ <string> ]
.ds
'Cto' copies its first standard input to its first
standard output, terminating either at end of file or the
first occurrence of <string>.  In order to be recognized,
<string> must appear on a line by itself.
This termination line is not copied.
If no argument is specified, <string> defaults
to "-EOF".
.sp
'Cto' is useful in shell files for terminating
programs that read from the command stream.
It is virtually a necessity for generating end-of-file
on terminals that cannot generate a control-c character.
.es
>> cto | x
paron file1 file2
delete file1
-EOF
.sa
cat (1), copy (1), slice (1)
