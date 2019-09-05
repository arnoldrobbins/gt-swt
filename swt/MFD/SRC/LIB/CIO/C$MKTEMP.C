/* c$mktemp --- do Unix mktemp */

char *c$mktemp (s)
char *s;
{
        int buf[4];
        char *cp;
        char *strchr();
        static char let = 'a';

        date (SYS_PIDSTR, buf);
        if ((cp = strchr(s, 'X')) == NULL)
                return (NULL);

        if (let == 'z')
                let = 'a';

        *cp = let++;
        cp++;
        strcpy (cp, buf);
        return (s);
}
