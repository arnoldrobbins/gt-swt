.hd lsinit "initialize linked string space" 02/23/82
subroutine lsinit
.sp
Library:  vlslb
.fs
'Lsinit' initializes the string space and associated variables.  It
.ul
must
be called before using any other linked string routines.
.sp
The routines in the linked string library are intended
to overcome several disadvantages of the contiguously stored
character strings used throughout the Software Tools Subsystem.
They facilitate
operations such as insertion, deletion and concatenation with a
minimum of wasted storage and time. These routines also free
the programmer from having to explicitly manage the string storage.
However, use of the linked string routines is costly in that for
operations such as copying or replacing single characters, they
are slower and require more subprogram calls than their equivalent
contiguous string routines.
Therefore, linked strings are not intended to replace contiguously
stored strings, but to provide an extension that facilitates complex
string manipulation.
.sp
All linked strings are allocated in the named common block 'ls$buf'.
Normally, the user does not directly reference this block; rather,
references are made through pointers returned from and passed to the
linked string routines. Pointers are single-precision integer variables
that contain an index of the starting location of the string in the
common block. The user has no need to examine the pointers other
than to pass them as arguments to the linked string routines.
.sp
Linked strings are stored one ASCII character per word, right-justified
with zero fill and terminated by an EOS character. Any word having a
value greater than 300 (decimal) is interpreted to be a pointer whose
value is obtained by subtracting 300 from the word. This allows for the
non-contiguity of characters in the string, hence the name "linked".
.sp
Space for new strings is obtained either directly or
indirectly through the 'lsallo' function. 'Lsallo' attempts to allocate
the string contiguously at the end of the common block. If this
fails, the available space list is examined; if no space is found here,
the garbage collector is invoked  and the searches are repeated.
Upon a second failure to find sufficient space, an error diagnostic
is issued and the program terminated.
.sp
Old strings are deallocated using the 'lsfree' subroutine. Deallocated
strings are marked with a special value and are not available for
use until after garbage collection.
.im
The pointers in the common block 'ls$buf' are set to their
proper values.  A call to 'lsinit' has the effect of deallocating
all strings.
.bu
'Lsinit' must be called to initialize the string space.
.sp
No provision is made for specifying the size of the string space.
.sp
Locally supported.
