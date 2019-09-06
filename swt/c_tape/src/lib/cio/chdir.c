/* chdir --- get to the specified directory */

chdir (dirname)
char *dirname;
{
        int packed_fn[MAXPACKEDFNAME], passwd[3], att;
        int success;

        success = TRUE;
        if (getto (dirname, packed_fn, passwd, att) == ERR) /* use SWT routine */
                success = FALSE;

        return (success ? 0 : -1);
}
