/* l64a --- take a long, and return the base 64 string */

char *l64a (l)
unsigned long l;
{
        static char buf[7];
        int i, j, d;

        buf[6] = '\0';
        i = 6;
        do
        {
                i--;            /* generate digits */
                d = l % 64;
                if (d == 0)
                        buf[i] = '.';
                else if (d == 1)
                        buf[i] = '/';
                else if (d >= 2 && d <= 11)
                        buf[i] = d - 2 + '0';
                else if (d >= 12 && d <= 37)
                        buf[i] = d - 12 + 'A';
                else    /* d >= 38 && d <= 63 */
                        buf[i] = d - 38 + 'a';
                l /= 64;
        } while (l != 0 && i > 0);

        if (i > 0)      /* move it over */
                for (j = 0; j + i < 7; j++)
                        buf[j] = buf[j + i];

        return (buf);
}
