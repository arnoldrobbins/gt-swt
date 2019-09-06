.hd readf "read raw words from a file" 03/25/82
integer function readf (buf, nw, fd)
integer buf (ARB), nw
file_des fd
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Readf' is used to read
words from a file, which may be assigned to any device recognized
by the Subsystem.  (A word on the Prime is 16 bits long.)
The first argument is a buffer to receive data transferred
from the file; the second argument is the number of words to be read;
the third argument is the file descriptor of the file from which
data will be read.
Words are transferred from the file to the
buffer until (1) the requested number of words are transferred,
(2) end-of-file occurs, or (3)
.bf
if the file from which the data is read is a tty file,
a NEWLINE is encountered.
.sp
If the file is not readable, the given file designator is invalid,
or the file's error flag is set, the function return is ERR.
If end-of-file is encountered on the read, the function return is
EOF.
Otherwise, the function return is the number of words returned in
the buffer.
.im
'Readf' first calls 'mapsu' to convert any standard port descriptors
it is passed into Subsystem file descriptors.
If the last operation performed on the file was not a 'readf',
then 'flush$' is called to empty the file's Subsystem buffer.
Depending on the device type associated with the file,
a device dependent driver ('dread$' for disk or 'tread$'
for the user's terminal) is called to
do the actual work of getting data into the buffer.
.am
buf
.ca
mapsu, dread$, tread$, flush$
.bu
Strange things may happen if you ask for more words than 'buf' can hold.
The semantics of reading raw characters from a terminal are a little
shaky; since one character per word is stored in a terminal buffer,
'readf' actually reads characters
from a terminal, not words.
There is a need for devices other than "terminal" and "disk"
(system console, for example).
EOF is returned if any error occurs when reading from disk (in dread$);
the user is not informed of the actual error that occurs.
.sa
dread$ (6), tread$ (6), flush$ (6), mapsu (2), writef (2), getlin (2)
