/* getw --- read a machine word from the named stream */

int getw (fp)
FILE *fp;
{
        int word, status, getch(), readf(), isatty();

        if (isatty (fileno(fp)))
                status = getch (& word, fileno(fp));
        else
                status = readf (& word, 1, fileno(fp));

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
                return word;
}
