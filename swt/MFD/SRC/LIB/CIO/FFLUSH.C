/* fflush --- flush the buffer associated with the given file pointer */

int fflush (fp)
FILE *fp;
{
        int mapsu(), flush$();
        int f, status;

        fp->_pbc = ERR;         /* wipe out ungetc buffer */

        f = mapsu (fileno (fp));
        status = flush$ (f);

        if (status == ERR)
        {
                fp->_errs |= _IOERR;
                return EOF;
        }
        else if (status == EOF)
        {
                fp->_errs |= _IOEOF;
                return EOF;
        }
        else
                return 0;       /* all ok */
}
