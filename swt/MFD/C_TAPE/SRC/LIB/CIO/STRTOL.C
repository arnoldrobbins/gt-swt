/* strtol --- convert string to integer */

long strtol (str, ptr, base)
char *str;
char **ptr;
int base;
{
        long ret = 0L;
        int i, j, radix;
        int negative = FALSE;

        i = 0;  /* index into str */

        if (base < 0 || base > 36)
                goto bye;

        for (i = 0; isspace (str[i]); i++)
                ;

        if (str[i] == '-')
        {
                i++;
                negative = TRUE;
        }
        else if (str[i] == '+')
                i++;

        if (base == 0)
        {
                if (str[i] == '0')
                {
                        if (tolower (str[i+1]) == 'x')
                        {
                                radix = 16;
                                i += 2;
                        }
                        else
                        {
                                radix = 8;
                                i++;
                        }
                }
                else
                        radix = 10;
        }
        else if (base == 16)
                if (str[i] == '0' && tolower (str[i+1]) == 'x')
                        i += 2;
        else
                radix = base;

        for (; str[i] != '\0'; i++)
        {
                switch (tolower (str[i])) {
                case SET_OF_DIGITS:
                        j = str[i] - '0';
                        break;

                case SET_OF_LOWER_CASE:
                        j = str[i] - 'a' + 10;
                        break;

                default:
                        goto bye;
                        break;
                }

                if (j >= radix)
                        goto bye;
                else
                        ret = radix * ret + j;
        }
bye:
        if (ptr != (char **)0)
                if (ret == 0L)
                        *ptr = str;
                else
                        *ptr = &str[i];

        if (negative)
                ret = -ret;

        return ret;
}
