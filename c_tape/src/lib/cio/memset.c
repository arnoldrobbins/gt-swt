/* memset --- set first n chars in dst = to chr */

/*  File   : memset.c
    Author : Richard A. O'Keefe.
    Updated: 25 May 1984
    Defines: memset()

    Edited for GT C by Arnold Robbins, 1 August 1984

    memset(dst, chr, len)
    fills the memory area dst[0..len-1] with len "bytes" all equal to chr.
    The result is dst.
*/

char *memset(dst, chr, len)
char *dst;
int chr;        /* should be char */
int len;
{
        char *d;

        for (d = dst; --len >= 0; *d++ = chr)
                ;
        return dst;
}
