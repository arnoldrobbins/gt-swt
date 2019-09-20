/* printf --- formatted output to stdout */

/*
 * see sprintf for details of how formatting is done
 */

printf(control, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
char *control;
char *a1, *a2, *a3, *a4, *a5;
char *a6, *a7, *a8, *a9, *a10;
{
        int sprintf();
        int ret;
        char str[BUFSIZ];

        ret = sprintf(str, control, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
        fputs(str, stdout);
        return(ret);
}
