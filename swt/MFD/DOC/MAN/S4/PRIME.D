[cc]mc |
.hd prime "retrieve the 'i'th prime number" 07/20/84
[cc]mc
long_int function prime (i)
long_int i
.sp
[cc]mc |
Library: vswtmath (Subsystem mathematical library)
[cc]mc
.fs
'Prime' is used to retrieve a specified prime number.
The argument is the ordinal of the prime number desired.
The function return is the specified prime.
For example, if 'i' is 1, the function return is 2;
if 'i' is 3, the function return is 5, etc.
.sp
'Prime' uses the table of prime numbers in the file
"=aux=/primes".
This file contains the prime numbers up to one million in
long-integer binary format.
If "=aux=/primes" is unreadable or if 'i' is less than one
or greater than 78498, the function return is zero.
.im
The file "=aux=/primes" is opened for reading.
The read/write pointer for the file is then moved to the
desired location and the prime number read.
The file is then closed.
.ca
open, close, mapfd, Primos prwf$$
.bu
Should probably raise cain if the prime numbers file is not
available, rather than meekly returning zero.
.sp
Locally supported.
