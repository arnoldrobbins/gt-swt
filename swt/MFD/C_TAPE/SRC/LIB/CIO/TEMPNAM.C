/* tempnam --- make a temporary file name */

char *tempnam (dir, pfx)
char *dir, *pfx;
{
        char *malloc();
        static int n = 0;       /* new file name generated on every call */
        extern char *getenv();
        char *cp;
        int space = 0;

        if (n == 999)
                n = 0;

        if ((cp = getenv ("TMPDIR")) != NULL)
                dir = cp;
        else if (dir == NULL)
                dir = P_tmpdir;

        if (pfx == NULL)
                pfx = "ct";

        space = strlen (dir) + 1 + strlen (pfx) + sizeof ("=pid=") - 1 + 3 + 1;
        /*         dir         /     pfx            =pid=              num  \0 */
        if ((cp = malloc (space)) == NULL)
                return NULL;

        sprintf(cp, "%s/%s=pid=%d", dir, pfx, n++);

        return (cp);
}
