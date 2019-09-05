/* memchr --- return pointer to chr w/in first len chars of src */

/*  File   : memchr.c
    Author : Richard A. O'Keefe.
    Updated: 25 May 1984
    Defines: memchr()

    Edited for GT C by Arnold Robbins, 1 August 1984

    memchr(src, chr, len)
    searches the memory area pointed to by src extending for len bytes,
    looking for an occurrence of the byte value chr.  It returns NULL
    if there is no such occurrence.  Otherwise it returns a pointer to
    the FIRST such occurrence.

    See the "Character Comparison" section in the READ-ME file.
*/

char *memchr(src, chr, len)
char *src;
int chr;        /* should be char */
int len;
{
        while (--len >= 0)
                if (*src++ == chr)
                        return src - 1;
        return NULL;
}
