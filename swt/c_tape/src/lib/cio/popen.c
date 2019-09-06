/* popen --- open a "pipe" to or from a command */

/* always return NULL if to run under bare primos */

#ifndef STAND_ALONE
static int pipe_opened = FALSE;
static enum { reading, writing, notinuse } p_mode = notinuse;

static char filename[MAXLINE];
static char real_command[MAXLINE];

static FILE *fp;
#endif

FILE *popen (cmd, mode)
char *cmd, *mode;
{
#ifndef STAND_ALONE
        if (pipe_opened || mode[1] != '\0')
                return (NULL);   /* only 1 pipe allowed or bad mode */

        switch (mode[0]) {
        case 'r':
                p_mode = reading;
                break;

        case 'w':
                p_mode = writing;
                break;

        default:
                return(NULL);
        }
        if (mode[1] != '\0')
                return (NULL);

        tmpnam (filename);       /* make a temporary file */

        if (p_mode == reading)
        {
                sprintf (real_command, "%s >%s", cmd, filename);
                /* execute cmd, save output in file */
                if (subsys (real_command) == ERR ||
                                (fp = fopen(filename, "r")) == NULL)
                        return (NULL);
                pipe_opened = TRUE;
                return (fp);
        }
        else    /* mode is writing */
        {
                sprintf (real_command, "%s> %s", filename, cmd);
                /* save command to use by pclose */
                if ((fp = fopen(filename, "w")) == NULL)
                        return (NULL);
                pipe_opened = TRUE;
                return (fp);
        }
#else
        return (NULL);
#endif
}

/* pclose --- close a pipe opened by popen */

pclose (fp2)
FILE *fp2;
{
#ifndef STAND_ALONE
        int ret;

        if (fp2 != fp || ! pipe_opened)
                return (-1);

        fclose (fp);
        if (p_mode == writing)
                ret = subsys (real_command);
                /* send the saved output to the command */

        pipe_opened = FALSE;
        p_mode = notinuse;
        return (ret == OK ? 0 : -1);
#else
        return (-1);
#endif
}
