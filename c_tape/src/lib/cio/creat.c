/* creat --- emulate Unix system call, analogous to SWT create */

int creat (name, mode)
char *name;
int mode;       /* file protection mode, not used here */
{
        int fd;
        int create();

        if ((fd = create (name, WRITE)) == ERR)
                return -1;
        else
                return fd;
}
