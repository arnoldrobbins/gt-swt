/* c$clos --- do a Unix style close */

int c$clos (fd)
int fd;
{
#undef close
        int close();

        if (close (fd) == OK)
                return 0;
        else
                return -1;
}
