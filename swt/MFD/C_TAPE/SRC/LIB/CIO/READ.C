/* read --- do a Unix style read via SWT file descriptors */

/*
** NOTE:
** Because of the Prime's file system restrictions, only
** whole words are read. When reading text files created
** through calls to write, text will be normal. When reading
** text files created by PRIMOS, blanks will not be expanded
** as expected.
*/

int read (fd, buf, nw)
int fd, nw;
char *buf;
{
        int result, readf();

        result = readf (buf, nw, fd);

        if (result == ERR || result == EOF)
        {
                buf[0] = '\0';
                return -1;
        }
        else
                return result;
}
