/* getlogin --- get login name */

char *getlogin ()
{
        static char buf[L_cuserid];
        extern char *cuserid ();

        if (isph$(0))           /* if not attached to a tty, return NULL */
                return NULL;

        cuserid (buf);
        return buf;
}
