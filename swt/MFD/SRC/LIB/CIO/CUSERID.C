/* cuserid --- return the user's login name */

char *cuserid (s)
char *s;
{
        static char log_name[L_cuserid];
        int i;

        date (SYS_USERID, log_name);    /* swt routine */

        /* map name to lower case, strip off blanks */
        for (i = 0; i < L_cuserid; i++)
                if (log_name[i] == ' ')
                        break;
                else
                        log_name[i] = tolower(log_name[i]);

        log_name[i] = '\0';

        if (s == NULL)
                return (log_name);
        else
        {
                strcpy (s, log_name);
                return (s);
        }
}
