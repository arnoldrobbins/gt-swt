/* tmpnam --- return filename for a temporary file */

char *tmpnam(s)
char *s;
{
        static char tmpname[L_tmpnam];
        static int n = 0;       /* new file name generated on every call */

        if (n == 999)
                n = 0;

        sprintf (tmpname, "%s/ct=pid=%d", P_tmpdir, n++);

        if (s == NULL)
                return (tmpname);
        else
        {
                strcpy (s, tmpname);
                return (s);
        }
}
