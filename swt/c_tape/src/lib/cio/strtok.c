/* strtok --- find tokens in a string */

/*
 * s1 is a string of tokens separated by one or
 * more of the separator characters in s2. return a pointer
 * to the start of each token, and insert NULLs after each.
 * First call has s1 non-zero, subsequent calls have s1 zero.
 * s2 may change from call to call.
 */

char *strtok (s1, s2)
char *s1, *s2;
{
        static char *save = NULL;       /* where we were in s1 */
        static int first = TRUE;        /* is this the first call */
        char *cp, *start;               /* start is starting pos of token */
        int i;

        if (s2 == NULL)
                return (NULL);

        if (first)
        {
                first = FALSE;
                if (s1 == NULL)         /* nothing to work with */
                {
                        first = TRUE;   /* reset it */
                        return (NULL);
                }
                else
                        save = s1;
        }

        if (s1 == NULL)
                if (save == NULL)
                        return (NULL);  /* nothing left */
                else
                        s1 = save;      /* reset to where we were after last call */

        for (i = 0; strchr (s2, s1[i]) != NULL && s1[i]; i++)
                ;       /* skip over any leading separators */

        start = &s1[i];         /* save start of token */

        for (; s1[i] != '\0'; i++)      /* scan for token separators */
                if (strchr (s2, s1[i])) /* hit a separator */
                        break;

        if (start != &s1[i])    /* means we found something */
        {                       /* 'strchr' returns NULL when it hits '\0' */
                save = (s1[i] ? &s1[i+1] : NULL);
                /* save is now start of next token */
                /* or NULL if we used up entire string */

                s1[i] = '\0';   /* insert null */
                return (start);
        }
        else
        {
                save = NULL;    /* end of s1 */
                return (NULL);
        }
}
