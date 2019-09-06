/* ttyname --- return terminal name of fd, if attached to a terminal */

char *ttyname(fd)
int fd;
{
        static char buf[] = "/dev/tty";

        if (! isatty(fd))
                return(NULL);
        else
                return(buf);
}
