/* fwrite --- write raw words to a stream */

fwrite(ptr, itemsize, nitems, stream)
char *ptr;
int itemsize, nitems;
FILE *stream;
{
        int words_per_item, nwords;
        int words_written;

        words_per_item = itemsize / sizeof (char);
        nwords = nitems * words_per_item;
        words_written = writef (ptr, nwords, fileno (stream));
        if (words_written == ERR)
        {
                stream->_errs |= _IOERR;
                return (0);
        }
        else if (words_written == EOF)
        {
                stream->_errs |= _IOEOF;
                return (0);
        }
        /* else
                all ok */

        return (words_written / words_per_item);
}
