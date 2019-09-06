/* ftell --- return absolute position in a stream */

long ftell (stream)
FILE *stream;
{
        long retvalue, markf ();

        stream->_pbc = ERR;

        retvalue = markf (fileno (stream));     /* flushes buffers */
        if (retvalue == (long)ERR)
                return (-1L);

        return (retvalue);
}
