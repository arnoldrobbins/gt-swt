/* system --- execute a SWT command */
/* currently dependant on the vshlib */

system(command)
char *command;
{
#ifdef STAND_ALONE      /* to run under bare Primos */
        return (FALSE);
#else
        if (subsys (command) == ERR)
                return (FALSE);
        else
                return (TRUE);
#endif
}
