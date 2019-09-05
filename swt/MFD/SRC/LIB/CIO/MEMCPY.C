/* memcpy --- copy n chars from src to dest, return dst */

/*  File   : memcpy.c
    Author : Richard A. O'Keefe.
    Updated: 25 May 1984
    Defines: memcpy()

    Edited for GT C by Arnold Robbins, 1 August 1984

    memcpy(dst, src, len)
    moves len bytes from src to dst.  The result is dst.  This is not
    the same as strncpy or strnmov, while move a maximum of len bytes
    and stop early if they hit a NUL character.  This moves len bytes
    exactly, no more, no less.
*/

char *memcpy(dst, src, len)
char *dst;
char *src;
int len;
{
        char *d;

        for (d = dst; --len >= 0; *d++ = *src++)
                ;
        return dst;
}
