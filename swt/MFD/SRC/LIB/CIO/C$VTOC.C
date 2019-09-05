/* c$vtoc --- convert a PL/1 varying string to a C string str */

int c$vtoc (str, var)
char *str;
int *var;
{
        int i, j, k;
        char high, low;

        j = var[0];                 /* length of PL/1 string */
        k = 1;

        for (i = 0; k <= j;)
        {
                high = toascii(var[k] >> 8);
                low = toascii(var[k]);
                str[i] = high;
                str[i + 1] = low;
                i += 2;
                k++;
        }

        str[i] = '\0';
        return(k);
}
