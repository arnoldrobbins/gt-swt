.hd echo "echo arguments" 03/20/80
echo { <arbitrary string> }
.ds
'Echo' simply prints its arguments, separated by blanks,
on standard output. It is frequently
used to make announcements from shell programs or to quickly produce very
short data files.  If no arguments are specified, 'echo' produces no
output whatsoever.
.sp
Before printing them, 'echo' scans its arguments for "@@t" and "@@n"
character sequences and converts them to tabs and newlines,
respectively.
.es
echo "split@@nthis@@nline"
echo "Good morning"
.sa
error (1)
