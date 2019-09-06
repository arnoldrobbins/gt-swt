/* atol --- convert character string to long integer */

long atol (str)
char *str;
{
        int i = 1;
        long gctol ();

        return (gctol (str, i, 10));
}
