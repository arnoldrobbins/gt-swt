/* rindex --- find character in string (last occurrence of) */

/* previous name for strrchr, included for compatibility */
/* with V7 and Berkeley UNIX systems */

char *rindex(s, c)
char *s, c;
{
        char *strrchr(); /* declare function */

        return(strrchr(s, c));
}
