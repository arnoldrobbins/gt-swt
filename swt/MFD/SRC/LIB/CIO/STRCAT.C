/* strcat --- concatenate string 't' to string 's' */

/* WARNING: string 's' must be big enough! */

char *strcat(s, t)
char *s, *t;
{
        int i, j;

        if (s != NULL && t != NULL)
                for (i = 0, j = strlen(s); (s[j] = t[i]) != '\0'; i++, j++)
                        ;

        return(s);
}
