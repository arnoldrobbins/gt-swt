/* ungetc --- push a single character back to its input buffer */

ungetc (ch, stream)
char ch;
FILE *stream;
{
        if (stream->_flag == _CLOSED)
        {
                stream->_errs |= _IOERR;
                return (EOF);
        }

        if (stream->_pbc != ERR)
        {
                stream->_errs |= _IOERR;
                return (EOF);
        }

        stream->_pbc = ch;

        return (ch);
}
