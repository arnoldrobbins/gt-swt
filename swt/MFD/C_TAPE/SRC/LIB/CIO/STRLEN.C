/* strlen --- return length of string s */

strlen(s)
char *s;
{
        int i = 0;

        if (s != NULL)
                for (i = 0; s[i] != '\0'; i++)
                        ;
        return (i);
}
