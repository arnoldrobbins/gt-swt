.hd des "NBS Data Encryption Standard Implementation" 01/13/83
des  (-e | -d)  [-k <key>]  {filename}  >output_file
.ds
'Des' is an implementation of the National Bureau of Standards
Data Encryption Standard.
It can be used for protection of on-line copies of sensitive information.
.sp
The first argument must be "-e" (for "encryption") or "-d" (for
decryption).
The DES is not self-inverting like the exclusive-or algorithm
used in 'crypt'; the encryption and decryption processes are different
and one or the other must be selected.
.sp
The optional argument sequence "-k[bl]<key>" can be used to specify a
key to control the encryption or decryption process.
If a key is not specified on the command line, 'des' will print
a prompt message, turn off the terminal's character echo, and read
the key.
Furthermore, after the key has been read, 'des' will prompt the user
for key validation;
the key must then be re-entered to insure that no typographical
errors occurred during the original key entry.
.sp
Remaining arguments must be the names of files containing information
to be encrypted or decrypted.
Filenames may be read from standard input as well as from the command
line;
see the reference manual entry for 'cat' for further information.
If no filenames are specified, 'des' takes data from its first
standard input.
DO NOT use this feature to read data from the terminal;
'des' uses binary I/O with the unfortunate side effect that end-of-file
cannot be generated from a terminal keyboard.
.sp
The output of 'des' is always produced on its first standard output.
Because 'des' processes data in binary rather than ASCII form,
its output will not be displayed correctly on a terminal.
Always direct the output of 'des' to a disk file or into a pipe for
further processing.
.es
des -e -k turkey document >document.des
des -d -k turkey document.des >original_document
.me
"Usage: des ..." for improper argument syntax.
.br
"keys do not match" if the validation key entry does not match the
original key entry.
.bu
Binary I/O is needed to handle the arbitrary bit-patterns output by
the DES algorithm without considerable expansion of the output text.
Unfortunately, binary I/O from and to the terminal does not behave
rationally at all.
.sp
The present implementation is very slow, averaging about 1730 bits
per CPU second throughput.
.sa
crypt (1)
