/* fseek --- seek to given place, and return 0 for OK, not 0 otherwise */

int fseek (fp, offset, orig)
FILE *fp;
long offset;
int orig;
{
        long lseek(), ret;
        long pos, ftell ();

        if (isatty (fileno (fp)) ||
                        (fp->_flag & (READ | READWRITE)) == 0)
                return -1;

        fp->_pbc = ERR;
        pos = ftell (fp);
        ret = lseek (fileno (fp), offset, orig);
        if (ret == -1)
                return -1;

        if ((fp->_flag & _APPEND) != 0          /* append mode */
                && (fp->_errs & _NOTATEND) == 0 /* didn't set this yet */
                && ret - pos < 0)       /* seeking backwards */
                fp->_errs |= _NOTATEND;
                /* seeked backwards on append file, so don't write */
                /* until seeking to end of file (see putc.c) */

        return 0;
}
