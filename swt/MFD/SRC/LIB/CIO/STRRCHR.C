/* strrchr --- return pointer to last occurence of c in s */

char *strrchr(s, c)
char *s, c;
{
        int i;

        if (s == NULL)
                return (NULL);

        for (i = strlen(s); s[i] != c && i >= 0; i--)
                ;       /* work backwards from end of string */
                        /* including '\0'                    */

        if (s[i] == c)
                return(&s[i]);
        else
                return(NULL);
}
