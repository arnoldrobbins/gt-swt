/* fopen --- open a file, return a file pointer */

FILE *fopen (name, mode)
char *name, *mode;
{
        int file_mode;
        int i, fd;

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

#undef open
        if ((fd = open (name, file_mode)) == ERR)     /* use SWT open */
                return (NULL);

        if (mode[0] == 'w' && trunc (fd) == ERR)
                return (NULL);
        else if (mode[0] == 'a')
        {
                wind (fd);
                c$iocm[i]._flag = _APPEND;
        }

        c$iocm[i]._flag |= file_mode;
        c$iocm[i]._fd = fd;
        c$iocm[i]._errs = 0;
        c$iocm[i]._pbc = ERR;

        return(& c$iocm[i]);
}
