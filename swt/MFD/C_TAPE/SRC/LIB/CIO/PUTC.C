/* putc --- CPL put a character on named i/o fp */

putc (c, fp)
char c;
FILE *fp;
{
        char buf [2];

        buf [0] = c;
        buf [1] = '\0';

        if (fputs (buf, fp) != EOF)
                return (c);
        else
                return (EOF);
}
