/* ctype.h --- character testing and conversion functions */

#ifndef _CTYPE__
#define _CTYPE__

extern int _chr_tipe[];         /* misspell to avoid name conflicts */

/* define various character types */
#define _di     00001           /* digit */
#define _pr     00002           /* printable */
#define _lo     00004           /* lower case */
#define _up     00010           /* upper case */
#define _cn     00020           /* control char */
#define _xd     00040           /* hexadecimal */
#define _pu     00100           /* punctuation */
#define _gr     00200           /* graphical */
#define _sp     00400           /* space */

/* character testing functions */
#define isalpha(ch)     (_chr_tipe[(ch)+1] & (_up | _lo))
#define isdigit(ch)     (_chr_tipe[(ch)+1] & _di)
#define isalnum(ch)     (_chr_tipe[(ch)+1] & (_up | _lo | _di))
#define isprint(ch)     (_chr_tipe[(ch)+1] & _pr)
#define islower(ch)     (_chr_tipe[(ch)+1] & _lo)
#define isupper(ch)     (_chr_tipe[(ch)+1] & _up)
#define iscntrl(ch)     (_chr_tipe[(ch)+1] & _cn)
#define isascii(ch)     (_chr_tipe[(ch)+1] & (_up | _lo | _di | _pr | _pu | _cn))
#define isxdigit(ch)    (_chr_tipe[(ch)+1] & _xd)
#define ispunct(ch)     (_chr_tipe[(ch)+1] & _pu)
#define isgraph(ch)     (_chr_tipe[(ch)+1] & _gr)
#define isspace(ch)     (_chr_tipe[(ch)+1] & _sp)

/* character conversion macros and functions */
#define toascii(c)      (((c) & 0377) | 0200)
#define _toupper(c)     ((c) - 'a' + 'A')   /* blind case conversion */
#define _tolower(c)     ((c) - 'A' + 'a')

extern int toupper();   /* change case only if lower case letter */
extern int tolower();   /* change case only if upper case letter */
#endif
