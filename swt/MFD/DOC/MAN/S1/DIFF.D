.hd diff "isolate differences between two files" 02/23/82
diff [-{b | c | d | r | s | v}] [<old_file> [<new_file>]]
.ds
'Diff' compares the contents of two files
and reports on the differences between them.
The default behavior is to describe the insert, delete, and change
operations that must be performed on <old_file> to convert its
contents into those of <new_file>.
.sp
Both file name arguments are optional; if the second is omitted, the
first standard input is used for <new_file>; if neither argument appears,
the first and second standard input are used for <old_file> and <new_file>
respectively.
.sp
The options currently available are:
.tc \
.in +10
.rm -5
.lt +5
.ta 6
.sp
.ti -5
-b\Perform a word-for-word binary comparison.
'Diff' will compare corresponding words of the two input files;
if any differences are found,
or if one file is shorter than the other,
'diff' prints the message
"different" and exits.
If the files are the same, 'diff' produces no output.
When the "-v" option (see below) is specified,
'diff' prints an octal representation of the words that differ
along with their offset from the beginning of the file,
and notifies the user if
one file is shorter than the other.
.sp
.ti -5
-c\Perform a simple line-by-line comparison.
'Diff' will compare successive lines of the input files;
if any corresponding lines differ,
or if one file is shorter than the other,
'diff' prints the message
"different" and exits.
If the files are the same, 'diff' produces no output.
When the "-v" option (see below) is specified,
'diff' prints the lines that differ along with their line
number in the input file, and notifies the user if
one file is shorter than the other.
.sp
.ti -5
-d\List the "differences" between the two files, by highlighting
the insertions, deletions, and changes that will convert <old_file>
into <new_file>.  This is the default option.
If the "verbose" option "-v" (see below) is specified, unchanged
text will also be listed.
.sp
.ti -5
-r\Insert text formatter requests to mark the <new_file>
with revision bars and deletion asterisks.
This option is particularly useful for maintenance of large documents,
like Subsystem Reference Manuals.
.sp
.ti -5
-s\Output a "script" of commands for the text editor 'ed' that will
convert <old_file> into <new_file>.
This is handy for preparing updates to large programs or data files,
since generally the volume of changes required will be much smaller
than the new text in its entirety.
.sp
.ti -5
-v\Make output "verbose".
This option applies to the "-b", "-c" and "-d" options discussed above.
If not selected, 'diff' produces "concise" output;
if selected, 'diff' produces more verbiage.
.sp
.in -10
.rm +5
.es
diff myfile1 myfile2
diff rf.r nrf.r | pg
diff -b /ca/bin/rp /cb/bin/rp
diff -c afile maybe_the_same_file
diff -v rf.r nrf.r | sp
diff -r old_manual.fmt new_manual.fmt | fmt
diff -s old new >>update_old_to_new
.me
.in +5
.ti -5
"<file>:  can't open" if either <new_file> or <old_file> is not readable.
.ti -5
"Usage: diff ..." for illegal options.
.in -5
.bu
The algorithm used has one quirk: a line or a block of lines which
is not unique within a file will be labeled as an insertion (deletion)
if its immediately adjacent neighbors both above and below are labeled
as insertions (deletions).

Fails on very large files (> 10000 lines) when using the "-d" option.
.sa
common (1),
.br
Heckel, P., "A Technique for Isolating Differences Between Files",
.ul
Communications of the ACM,
vol 21, no 4 (April 1978), 264-268.
