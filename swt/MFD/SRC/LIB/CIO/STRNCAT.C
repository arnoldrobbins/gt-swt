/* strncat --- concatenate n chars from t to s */

char *strncat (s, t, n)
char *s, *t;
int n;
{
        int i, j;

        if (s != NULL && t != NULL)
        {
                for (i = 0, j = strlen (s); t[i] != '\0' && n > 0; i++, j++, n--)
                        s[j] = t[i];

                s[j] = '\0';
        }

        return (s);
}
