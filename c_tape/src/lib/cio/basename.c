/* basename --- return the last part of a path name */

char *basename(str)
char *str;
{
        int i;

        for (i = strlen (str) - 1; i >= 0; i--)
                if (str[i] == '/')
                        break;

        if (i == 0)
                return (str);
        else
        {
                i++;
                return (&str[i]);
        }
}
