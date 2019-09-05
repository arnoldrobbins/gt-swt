/* strpbrk --- return a pointer to the first char in s1 of */
/*      any char in s2 or NULL if no char in s2 is in s1 */

char *strpbrk (s1, s2)
char *s1, *s2;
{
        int i, j;

        if (s1 == NULL || s2 == NULL)
                return (NULL);

        for (j = 0; s2[j] != '\0'; j++)
                for (i = 0; s1[i] != '\0'; i++)
                        if (s1[i] == s2[j])
                                return(&s1[i]);

        return (NULL);
}
