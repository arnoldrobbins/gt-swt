.hd mt "magnetic tape interface" 03/23/82
mt [<unit>] [-p<pos>] [-(r|w) [<cvt>] [<blk>] {<file_spec>}] [-v]
   <unit>      ::=   0 | 1 | 2 | 3 | 4 | 5 | 6 | 7
   <pos>       ::=   [+|-]<file number>[/<block number>]
   <cvt>       ::=   -c (a[scii] | b[inary] | e[bcdic])
   <blocking>  ::=   -b <record size>[/<blocking factor>]
.ds
'Mt' is a program designed to provide a general purpose magnetic
tape handling facility to users of the Subsystem.
It supports
three basic types of operation: tape positioning, reading files
from tape, and writing files to tape.
It is also possible to perform both a positioning operation and
a read or write operation in a single invocation.
.sp
The first argument may be used to specify a particular tape drive.
The allowable values are integers from 0 through 7, although a
particular installation may not support that many drives.
If no unit is specified on the command line, unit 0 is assumed.
Whatever unit is used, it should have been previously assigned
by the user with the Primos ASSIGN command.
.sp
The remaining arguments select one of the basic operations
to be performed on the specified drive.
The available options are described in the following paragraphs.
.in +5
.ta 6
.tc \
.sp
.ti -5
-p\
The "-p" option may be used to accomplish either relative or
absolute positioning of the tape.
The argument following the
"-p" consists of an optional plus or minus sign followed by
either a <file number> or a <file number> and a <block number>
separated by a slash (/).
.sp
If the plus or minus sign is present,
relative positioning is selected; the <file number> specifies the
offset from the current file of the target file.
Thus "+1"
would position the tape to the beginning of the file immediately
following the current one, while "-1"
would position the tape to the immediately preceding file.
If a block number is present, the specified number of blocks
are skipped in the same direction.
As a special case, if a minus sign is present and both the
<file number> and <block number> are zero, the tape is positioned
to the beginning of the current file.
.sp
If no sign is present, absolute positioning is selected;
the <file number>
is taken as the target file's ordinal position on the tape, where
the first file has position 1, and the <block number> is taken
as the ordinal position of the desired block within the target file.
.sp
In positioning the tape, 'mt' only considers physical tape marks;
it specifically does not recognize any kind of labels in determining
where a file begins and ends.
.sp
.ti -5
-r\
The "-r" option causes 'mt' to read files from the specified tape
drive.
The "-r" may optionally be followed by conversion and blocking
specifications.
<Cvt> specifies what kind of character set
conversion is to be performed on the data read from the tape:
"-c a" indicates that the characters on the tape are in ASCII,
"-c e" indicates that they are in EBCDIC, and "-c b" indicates that
they are arbitrary binary codes and are not to be interpreted as
characters at all.
If no <cvt> is specified, ASCII is assumed.
The Prime convention for text files is to store characters
with the most significant bit set to 1, whereas most ASCII
encoded tapes are written with this bit set to 0.
'Mt' automatically turns this bit on when reading ASCII
tapes, and turns it off when writing them.
.sp
<Blk> specifies how the physical blocks from the tape will
be broken up into lines before being written out.
This argument is significant only if the specified conversion is
ASCII or EBCDIC; binary records are written out as-is, regardless
of whatever <blk> specification may be in effect.
If omitted, a default value of "80/10" is used; that is, 80
bytes per line, 10 lines per physical tape block.
Although this implicitly suggests that physical tape blocks
are 800 bytes long, 'mt' will read any size tape block
(up to 6K bytes for ASCII and EBCDIC conversion, up to 12K bytes
for binary conversion) and divide it into lines according
to the specified <record size>.
For ASCII and EBCDIC tapes, each line is stripped of trailing blanks
and terminated with a NEWLINE character before being written out to
its final destination.
.sp
.ti -5
-v\
The "-v" option is used to make 'mt' verbose, it will tell you how
many blocks it read from or wrote to the tape.
.sp
.ti -5
-w\
The "-w" option is syntactically identical to the "-r" option.
The <cvt> specification may be used to specify what character
set will be used in writing the tape, and the <blk> specification
determines the size of the blocks written.
'Mt' writes fixed size tape blocks, the size of which is
determined by the product of <record size> and <blocking factor>.
If the specified conversion is ASCII or EBCDIC,
input lines that are shorter than <record size> are padded out
to that length with blanks after having their NEWLINE character removed.
As with "-r", binary blocks are not divided into lines.
In any case,
if the end of the input file is reached before a complete block
has been constructed, the remaining bytes are filled with zeros
(for binary conversion) or blanks (for ASCII or EBCDIC conversion).
.in -5
.sp
The remaining command line arguments are taken as names of files
to be read from or written to the tape.
The full syntax of the <file_spec> argument is described in the
entry for 'cat' (1).
Most frequently, it will take the form of a Subsystem pathname.
.es
mt -p 1
mt 1 -w tape_file
mt -r -ce -b120/30 file1 file2 file3
cat file | mt -w
.me
.in +5
.ti -5
"Usage: mt ..." for incorrect argument syntax.
.ti -5
"syntax:  -b <record size>[/<blocking factor>]" for incorrect blocking
arguments.
.ti -5
"syntax:  -c (a[scii] | b[inary] | e[bcdic])" for incorrect conversion
arguments.
.ti -5
"syntax:  -p [+|-]<file number>[/<block number>]" for incorrect
positioning arguments.
.ti -5
"maximum block size is <max> bytes" if the requested block size
exceeds the maximum.
.ti -5
"units are <low> to <high>" if an illegal unit number is specified.
.ti -5
"drive is not ready" if the specified unit is not ready.
.ti -5
"drive is off line" if the specified unit is not on line.
.ti -5
"tape is at end of reel" if the tape mounted on the specified unit is
positioned beyond the end-of-tape marker.
.ti -5
"tape is in mid-file" if an attempt is made to write on a tape that
is neither at the load point or at a file mark.
.ti -5
"tape is write protected" if an attempt is made to write on a tape
that has no write ring.
.ti -5
"<file>: bad file name" if <file> begins with a dash.
.ti -5
"<file>: can't create" if <file> can't be opened for writing.
.ti -5
"<file>: can't open" if <file> can't be opened for reading.
.ti -5
"<file>:[bl]<num> blocks read from tape" when using the "-v" option.
.ti -5
"<file>:[bl]<num> blocks written to tape" when using the "-v" option.
.ti -5
"Block <n>: <error status> Unrecovered" for an unrecovered
tape i/o error on the <n>th block, resulting from <error status>.
.ti -5
"beginning of file" if an attempt is made to do backward relative block
positioning beyond a file mark.
.ti -5
"beginning of tape" if an attempt is made to do backward relative
positioning beyond the load point.
.ti -5
"end of file" if an attempt is made to do forward relative block
positioning beyond a file mark.
.ti -5
"end of tape" if an attempt is made to position beyond the end-of-tape
marker.
.in -5
.sa
cat (1), Primos MAGNET command, Primos t$mt
