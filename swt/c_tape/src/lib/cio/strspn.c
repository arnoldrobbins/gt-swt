/* strspn --- return length of initial segment of s1 which is */
/*            made entirely of chars from s2 */

strspn(s1, s2)
char *s1, *s2;
{
        int i = 0;
        char *strchr();         /* declare function */

        if (s1 != NULL && s2 != NULL)
        {
                for (i = 0; s1[i] != '\0'; i++)
                        if (strchr(s2, s1[i]) == NULL)   /* s1[i] not in s2 */
                                break;
        }

        return (i);
}
