/* fgets --- get a C string from specified i/o stream */

char *fgets (line, size, fp)
char *line;
int size;
FILE *fp;
{
        if ((fp->_flag & (READ | READWRITE)) == 0 || size <= 0)
                /* file not open for reading, or size too small */
                return NULL;

        /*
         * getlin won't return ERR, so we can't set the _errs if
         * and error occured, since we don't know about it.
         */

        if (getlin (line, fileno(fp), size) == EOF)
        {
                fp->_errs |= _IOEOF;
                return NULL;
        }
        else
                return line;
}
