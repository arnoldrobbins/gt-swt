/* fdopen --- associate a file pointer with an open file descriptor */

/*
 * UNIX fdopen checks that the mode of the
 * already open file descriptor corresponds to the mode
 * which is handed to it. That is not possible under SWT
 * without actually trying to read and write the file.
 * So, this fdopen takes things on faith. (if you don't like
 * it, rewrite the routine)
 */

FILE *fdopen (fd, mode)
int fd;
char *mode;
{
        int file_mode;
        int i;

        /* first, find an available i/o slot */
        for (i = 3; i < _NFILES - 4; i++)
                if (c$iocm[i]._flag == _CLOSED)
                        break;  /* got one! */

        if (i == _NFILES - 4)
                return NULL;    /* no open slots */

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

        /*
         * if we could check the mode of the already
         * open file, we'd do it here.
         */

        c$iocm[i]._flag = file_mode;
        c$iocm[i]._fd = fd;
        c$iocm[i]._errs = 0;
        c$iocm[i]._pbc = ERR;

        if (mode[0] == 'a')
        {
                c$iocm[i]._flag |= _APPEND;
                wind (c$iocm[i]._fd);
        }

        return(& c$iocm[i]);
}
