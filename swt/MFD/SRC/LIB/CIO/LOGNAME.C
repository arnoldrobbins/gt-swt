/* logname --- return user's name from $LOGNAME */
/*             under swt, use =user= */

char *logname()
{
        static char buf[L_cuserid];
        char *cp;
        extern char *getenv();

        if ((cp = getenv ("LOGNAME")) != NULL)
                return (cp);
        else if (expand ("=user=", buf, L_cuserid - 1) == ERR)
                return NULL;
        else
                return buf;
}
