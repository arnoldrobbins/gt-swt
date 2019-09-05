/* lseek --- do a seek a la Unix, via SWT file descriptors */

long lseek (fd, offset, orig)
int fd, orig;
long offset;
{
        int seekf(), wind();
        long pos, markf();
        int i, result;

        switch (orig) {
        case 0:         /* seek offset from start of file */
                result = seekf (0L, fd);
                if (result != OK)
                        return (-1L);   /* couldn't rewind to start of file */
                result = seekf (offset, fd);
                break;

        case 1:         /* seek offset from current position */
                pos = markf (fd);       /* get current postion -- auto flush */
                if (pos == -1L)
                        return (-1L);   /* couldn't get position */
                pos += offset;          /* figure desired position */
                result = seekf (offset, fd);
                break;

        case 2:         /* seek offset from end of file */
                if (wind (fd) == ERR)
                        return (-1L);   /* couldn't get to last part of file */
                pos = markf (fd);       /* auto flush */
                if (pos == -1L)
                        return (-1L);   /* couldn't get current position */
                pos += offset;          /* figure desired position */
                result = seekf (offset, fd);
                break;

        default:
                return -1L;
        }

        if (result == ERR)
                return -1L;
        else
                return (markf (fd));
                /* lseek returns current file position */
                /* markf flushes buffers if needed */
}
