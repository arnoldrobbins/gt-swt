/* strncpy.c --- copy s2 to s1, truncating or null-padding
                                   to always copy n words */

char *strncpy (s1, s2, n)
char *s1, *s2;
int n;
{
        int i;

        if (s1 != NULL && s2 != NULL)
                for (i = 0; i < n; i++)
                        if ((s1[i] = s2[i]) == '\0')
                        {
                                while (++i < n)
                                        s1[i] = '\0';
                                return (s1);
                        }
                        else
                                s1[1] = '\0';

        return (s1);
}
