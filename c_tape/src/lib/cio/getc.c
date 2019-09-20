/* getc --- get a character from specified file (i/o stream) */

char getc (fp)
FILE *fp;
{
        char c, buf [2];
        int getlin ();

        if ((fp->_flag & (READ | READWRITE)) == 0)
                return (EOF);
                /* file not open for reading */

        if ((c = fp->_pbc) == ERR &&
                        (c = getlin (buf, fileno (fp), 2)) != EOF)
                c = buf [0];
        else
                fp->_pbc = ERR;

        if (c == EOF)
                fp->_errs |= _IOEOF;
        else if (c == ERR)
        {
                fp->_errs |= _IOERR;
                c = EOF;
        }

        return (c);
}
