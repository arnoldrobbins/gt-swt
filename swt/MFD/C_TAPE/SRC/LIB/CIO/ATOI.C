/* atoi --- convert character string to integer */

int atoi (str)
char *str;
{
        int i = 1;
        int gctoi ();

        return (gctoi (str, i, 10));
}
