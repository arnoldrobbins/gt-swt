/* index --- find character in string */

/* previous name for strchr, included for compatibility */
/* with V7 and Berkeley UNIX systems */

char *index(s, c)
char *s, c;
{
        char *strchr(); /* declare function */

        return(strchr(s, c));
}
