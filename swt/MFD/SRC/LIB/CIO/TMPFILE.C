/* tmpfile --- return an anonymous stream */

FILE *tmpfile()
{
#undef mktemp
        int i, fd, mktemp();

        for (i = 3; i < _NFILES - 4; i++)       /* find a free file pointer */
                if (c$iocm[i]._flag == _CLOSED)     /* it's closed */
                        break;

        if (i == _NFILES - 4 || (fd = mktemp (READWRITE)) == ERR)
                return (NULL);
        else
        {
                c$iocm[i]._flag = READWRITE;
                c$iocm[i]._fd = fd;
                c$iocm[i]._errs = 0;
                c$iocm[i]._pbc = ERR;
                return (&c$iocm[i]);
        }
}
