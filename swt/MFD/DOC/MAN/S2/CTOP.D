.hd ctop "convert EOS-terminated string to packed string" 03/23/80
integer function ctop (str, i, pstr, len)
character str (ARB)
integer i, len
packed_char pstr (len)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Ctop' converts the EOS-terminated unpacked string in argument 'str',
starting at position 'i', to packed integer form in the array 'pstr'.
The argument 'len' gives the maximum length of the array 'pstr';
no more than 'len' words of this array will be modified by 'ctop'.
After conversion, 'i' points to the EOS at the end of 'str',
or one position past the last character packed if the maximum
length of 'pstr' is exceeded.
.sp
The function return is the number of characters transferred from
'str' to 'pstr'.
.im
'Ctop' picks up successive characters from 'str' and packs them into
'pstr' with the standard Subsystem macro 'spchar'.
.am
i, pstr
.sa
ptoc (2), other conversion routines ('cto?*' and '?*toc') (2)
