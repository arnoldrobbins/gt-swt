/* fclose --- close the a stdio file descriptor */

int fclose (fp)
FILE *fp;
{
#undef close
        if (fp == NULL || fp->_flag == _CLOSED)
                return EOF;

        if (fflush (fp) == EOF || close (fileno(fp)) == ERR)
        {
                /* fflush bombed or */
                /* SWT close bombed */
                fp->_errs |= _IOERR;
                return EOF;
        }
        else
        {
                fp->_flag = _CLOSED;
                fp->_fd = -1;
                fp->_errs = 0;
                fp->_pbc = ERR;
                return 0;
        }
}
