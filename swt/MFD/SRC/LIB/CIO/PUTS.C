/* puts --- put a string (followed by NEWLINE) on stdout */

puts(s)
char *s;
{
        if (fputs (s, stdout) != 0)
                return EOF;
        return putchar ('\n');
}
