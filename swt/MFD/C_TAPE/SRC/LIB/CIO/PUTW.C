/* putw --- write a machine word to the given file */

putw (w, fp)
int w;
FILE *fp;
{
        int status, isatty(), putch(), writef();

        if (isatty (fileno (fp)))
                status = putch (w, fileno (fp));
        else
                status = writef (w, 1, fileno (fp));

        if (status == EOF)
        {
                fp->_errs |= _IOEOF;
                return EOF;
        }
        else if (status == ERR)
        {
                fp->_errs |= _IOERR;
                return EOF;
        }
        else
                return w;
}
