.hd rsa "toy RSA public-key cryptosystem" 01/15/83
rsa (-i | -e <correspondent> | -d)
.ds
'Rsa' is a simplified implementation of an RSA (Rivest-Shamir-Adleman)
public-key cryptosystem.
While interesting as a novelty, it does not provide sufficient
security to resist an informed attack.
.sp
'Rsa' has three options.
The "-i" (initialize) option must be selected by a user before any
other users can send him encrypted information.
The "-e correspondent" (encipher) option is used to encrypt standard
input to standard output using the public key of the named user.
(In a practical system, only the named user would then be able
to decrypt the result, using his private key.)
The "-d" (decipher) option is used to decrypt standard input to
standard output using the private key of the current user.
Thus, if the current user has login name "BOZO", the network
.sp
.in +10
rsa -e bozo | rsa -d
.sp
.in -10
effects an identity transformation.
.sp
Further information on public-key cryptosystems in general and
the RSA algorithm in particular can be found in the following
references:
.sp
.in +5
Hellman, Martin E.
"The Mathematics of Public-Key Cryptography,"
in
.ul
Scientific American,
Vol. 241, No. 2, pp. 146-157, August, 1979
.sp
Rivest, R. L., Adi Shamir, and Len Adleman
.ul
On Digital Signatures and Public-Key Cryptosystems,
Report MIT/LCS/Tm-82,
Laboratory for Computer Science,
Massachusetts Institute of Technology,
April, 1977
.sp
Rivest, R. L., A. Shamir, and A. Adleman
"A Method for Obtaining Digital Signatures and Public-Key
Cryptosystems,"
in
.ul
Communications of the ACM,
Vol. 21, No. 2, pages 120-126, February, 1978.
.in -5
.es
rsa -i   # initializes public and private key files
plaintext> rsa -e system >ciphertext
ciphertext> rsa -d >plaintext
rsa -e bozo >>=extra=/mail/bozo
.fl
"=varsdir=/.rsa_encipher" for public-key information;
.br
"=varsdir=/.rsa_decipher" for private-key information.
.me
"Usage: rsa ..." for invalid argument syntax.
.br
Various self-explanatory messages if key files are not present
or unreadable.
.bu
32 bit arithmetic is insufficient to guarantee security.
.sp
Locally supported.
.sa
Subsystem Mathematical Function Library ('vswtml')
