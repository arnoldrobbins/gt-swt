/* c$ctov --- convert C string to PL/1 varying string */

int c$ctov (var, str)
int *var;
char *str;
{
        int i, j;

        for (i = 0, j = 1; str[i] != '\0'; j++)
        {
                var[j] = (str[i] << 8) | str[i+1];
                if (str[i+1] == '\0')
                {
                        i++;    /* to counteract the --i below */
                        break;
                }
                i += 2;
        }
        var[0] = --i;

        return (i);
}
