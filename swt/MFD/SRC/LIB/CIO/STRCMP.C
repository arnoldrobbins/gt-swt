/* strcmp --- compare strings s1 and s2 */

strcmp (s1, s2)
char *s1, *s2;
{
        int i;

        if (s1 == NULL)
                if (s2 == NULL)
                        return (0);
                else
                        return (-1);
        else if (s2 == NULL)
                return (1);

        for (i = 0; s1[i] == s2[i]; i++)
                if (s1[i] == '\0')
                        return(0);      /* strings are equal */

        /* loop broken. either chars equal or not */
        return((unsigned) s1[i] - (unsigned) s2[i]);
        /* <0 if s1 < s2, >0 if s1 > s2 */
}
