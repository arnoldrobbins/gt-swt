/* memccpy --- copy from src to dst till chr seen or len reached */

/*  File   : memccpy.c
    Author : Richard A. O'Keefe.
    Updated: 25 May 1984
    Defines: memccpy()

    Edited for GT C by Arnold Robbins, 1 August 1984

    memccpy(dst, src, chr, len)
    copies bytes from src to dst until either len bytes have been moved
    or a byte equal to chr has been moved.  In the former case it gives
    NULL as the value, in the latter a pointer to just after the place
    where "chr" was moved to in dst.  Note that copying stops after the
    first instance of "chr", and that remaining characters in "dst" are
    not changed in any way, no NUL being inserted or anything.
*/

char *memccpy(dst, src, chr, len)
char *dst, *src;
int chr;        /* should be char */
int len;
{
        while (--len >= 0)
                if ((*dst++ = *src++) == chr)
                        return dst;
        return NULL;
}
