/* c$open --- do a Unix style open, return a SWT fd */

int c$open (file, mode)
char *file;
int mode;
{
        int swt_mode;
        int fd;
        int filtst();
#undef open
        int open();

        switch (mode) {
        case 0:
                swt_mode = READ;
                break;
        case 1:
                swt_mode = WRITE;
                break;
        case 2:
                swt_mode = READWRITE;
                break;
        default:
                return -1;
        }

        if (filtst (file, 0, 0, 1, 0, 0, 0, 0) != YES)
                return -1;      /* file does not exist */
        else if ((fd = open (file, swt_mode)) == ERR)
                return -1;
        else
                return fd;
}
