/* strcpy --- copy string 't' to string 's' */

char *strcpy(s, t)
char *s, *t;
{
        int i;

        if (t != NULL && s != NULL)
                for (i = 0; (s[i] = t[i]) != '\0'; i++)
                        ;
        else if (s != NULL)     /* t == NULL */
                s[0] = '\0';

        return (s);
}
