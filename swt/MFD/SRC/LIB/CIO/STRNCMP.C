/* strncmp --- compare at most n chars of s1 and s2 */

strncmp (s1, s2, n)
char *s1, *s2;
int n;
{
        int i;

        if (s1 == NULL)
                if (s2 == NULL)
                        return (0);
                else
                        return (-1);
        else if (s2 == NULL)
                return (1);

        for (i = 0; s1[i] == s2[i] && n > 1; n--, i++)
                if (s1[i] == '\0')
                        return(0);      /* strings are equal */

        /* loop broken. either chars not equal or n == 0 */
        return((unsigned) s1[i] - (unsigned) s2[i]);
        /* 0 if =, neg if s1 < s2, pos s1 > s2 */
}
