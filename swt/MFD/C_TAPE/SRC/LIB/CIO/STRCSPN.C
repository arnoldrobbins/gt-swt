/* strcspn --- return length of initial segment of s1 which is */
/*             made entirely of chars not from s2 */

strcspn (s1, s2)
char *s1, *s2;
{
        int i;
        char *strchr ();

        if (s1 != NULL && s2 != NULL)
        {
                for (i = 0; s1[i] != '\0'; i++)
                        if (strchr (s2, s1[i]) != NULL)   /* s1[i] is in s2 */
                                break;
        }

        return (i);
}
