/* getcwd --- get path name of current working directory */

char *getcwd (buf, size)
char *buf;
int size;
{
        char *malloc();
        char *cp;
        auto int used_malloc = FALSE;

        if (follow ("", 0) == ERR)
                return (NULL);

        if (buf == NULL)
                if (size <= 1)
                        return NULL;
                else if ((cp = malloc (size)) == NULL)  /* error */
                        return NULL;
                else
                        used_malloc = TRUE;
        else
                cp = buf;

        if (gcdir$ (cp) == ERR)
        {
                if (used_malloc)
                        free (cp);
                return NULL;
        }
        else
                return cp;
}
