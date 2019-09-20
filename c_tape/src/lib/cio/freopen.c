/* freopen --- associate a new file with an already open stream */

FILE *freopen (name, mode, stream)
char *name, *mode;
FILE *stream;
{
        int file_mode;

        if (fclose(stream) == EOF)      /* close old file */
                return(NULL);

        switch (mode[0]) {
        case 'r':
                file_mode = READ;
                break;
        case 'a':
        case 'w':
                file_mode = WRITE;
                break;
        default:
                return (NULL);  /* bad mode */
        }
        if (mode[1] == '+' && mode[2] == '\0')
                /* readwrite, no matter what */
                file_mode = READWRITE;
        else if (mode[1] != '\0')
                return (NULL);


        stream->_flag = file_mode;
        if (mode[0] == 'a')
                stream->_flag |= _APPEND;

#undef open
        stream->_fd = open(name, file_mode);  /* use SWT style open */

        if (stream->_fd == -1)  /* we bombed */
        {
                stream->_flag = _CLOSED;
                stream->_fd = -1;
                stream->_errs = 0;
                stream->_pbc = ERR;
                return (NULL);
        }

        return (stream);
}
