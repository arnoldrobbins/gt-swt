/* ftrunc --- do Primos file truncate on C files */

int ftrunc (stream)
FILE *stream;
{
        int trunc ();
        int fflush ();

        if (fflush (stream) == 0 && trunc (fileno (stream)) != ERR)
                return (0);

        return (-1);
}
