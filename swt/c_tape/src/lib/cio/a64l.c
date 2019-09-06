/* a64l --- take a base 64 string and return the long it represents */

long a64l (s)
char *s;
{
        int i, j;
        long l;

        l = 0;
        for (i = 0; i <= 5 && s[i] != '\0'; i++)
        {
                switch (s[i]) {
                case '.':
                        j = 0;
                        break;

                case '/':
                        j = 1;
                        break;

                case SET_OF_DIGITS:
                        j = s[i] - '0' + 2;
                        break;

                case SET_OF_UPPER_CASE:
                        j = s[i] - 'A' + 12;
                        break;

                case SET_OF_LOWER_CASE:
                        j = s[i] - 'a' + 38;
                        break;

                default:
                        goto out;
                        break;
                }
                l *= 64;        /* will become a shift */
                l += j;
        }
out:
        return (l);
}
