/* write --- do a Unix style write via SWT file descriptors */

/*
** NOTE:
** Because of the Prime's file system restrictions, only
** whole words are written. When writing text files to disk
** through calls to write, text will be normal. When writing
** text files via PRIMOS, blanks will be compressed as expected.
*/

int write (fd, buf, nw)
int fd, nw;
char *buf;
{
        int result, writef();

        result = writef (buf, nw, fd);

        if (result == ERR || result == EOF)
                return -1;
        else
                return result;
}
