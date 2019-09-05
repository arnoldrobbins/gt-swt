/* exit --- pass exit parameter to caller and perform cleanup */

#define PNULL   01777600000

exit (exit_val)
int exit_val;   /* not used */
{
        int i;
        static struct stop_now {
                int len;
                char str[3];
        } stop = { 5, 'STOP$' };

#undef close
        /* close all opened files */
        for (i = 0; i < _NFILES; i++)
                if (c$iocm[i]._flag != _CLOSED)
                        close (c$iocm[i]._fd);

        signl$(stop, PNULL, 0, PNULL, 0, 0);
        /* works for both swt and bare primos */
}
