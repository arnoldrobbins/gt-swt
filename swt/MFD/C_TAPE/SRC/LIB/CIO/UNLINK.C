/* unlink --- unlink a file, return status */

#include <keys.h>

int unlink (file)
char *file;
{
        int fname[MAXPACKEDFNAME], attach, j1[3], code;
        int getto(), rmfil$();
        int ret;

        ret = -1;
        if (getto (file, fname, j1, & attach) != ERR)
                if (rmfil$ (fname) == OK)
                        ret = 0;

        if (attach == YES)
                atch$$ (KHOME, 0, 0, 0, 0, code);

        return ret;
}
