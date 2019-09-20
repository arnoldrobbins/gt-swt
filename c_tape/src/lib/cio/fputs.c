/* fputs --- put a string on the specified stream */

/* ALL stdio output should be going through this routine */

int fputs (s, fp)
char *s;
FILE *fp;
{
        int putlin();
        int val;

        if ((fp->_flag & (WRITE | READWRITE)) == 0)
        {
                /* not open for writing */
                fp->_errs |= _IOERR;
                return (EOF);
        }
        else if ((fp->_flag & _APPEND) != 0 && (fp->_errs & _NOTATEND) != 0)
        {
                /* force append to be at end */
                wind (fileno (fp));
                fp->_errs &= ~ _NOTATEND;
        }

        switch (putlin (s, fileno (fp))) {
        case ERR:
                fp->_errs |= _IOERR;
                return EOF;

        default:
                return 0;
        }
}
