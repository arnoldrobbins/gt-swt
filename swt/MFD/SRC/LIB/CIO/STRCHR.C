/* strchr --- return pointer to first occurrence of c in s */

char *strchr(s, c)
char *s, c;
{
        int i;

        if (s == NULL)
                return (NULL);  /* graceful return */

        for (i = 0; ; i++)
        {
                if (s[i] == c)
                        return (&s[i]);
                if (s[i] == '\0')
                        return (NULL);
        }
}
