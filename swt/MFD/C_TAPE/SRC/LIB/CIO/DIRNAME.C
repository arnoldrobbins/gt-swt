/* dirname --- return all but the last part of a pathname */

char *dirname(file)
char *file;
{
        static char buf[MAXPATH];
        char *cp, *strrchr();

        strcpy (buf, file);

        if ((cp = strrchr (buf, '/')) != NULL)
                *cp = '\0';

        return (buf);
}
