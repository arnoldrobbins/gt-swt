/* gets --- gets a string up to a newline from stdin */

char *gets(s)
char *s;
{
        int c, i;

        i = 0;
        while ((c = getchar()) != '\n' && c != EOF)
                s[i++] = c;    /* use indexing, since it's faster on the prime */

        s[i] = '\0';

        if (c == EOF)
                return(NULL);
        else
                return(s);
}
