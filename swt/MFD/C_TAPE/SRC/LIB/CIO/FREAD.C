/* fread --- read raw words from a stream */

fread(ptr, itemsize, nitems, stream)
char *ptr;
int itemsize, nitems;
FILE *stream;
{
        int readf ();
        int words_per_item, nwords;
        int words_read;

        words_per_item = itemsize / sizeof(char) ;
        nwords = nitems * words_per_item;
        words_read = readf(ptr, nwords, fileno(stream));
        if (words_read == EOF)
        {
                stream->_errs |= _IOEOF;
                return (0);
        }
        else if (words_read == ERR)
        {
                stream->_errs |= _IOERR;
                return (0);
        }
        /* else
                all ok */

        return (words_read / words_per_item);
}
