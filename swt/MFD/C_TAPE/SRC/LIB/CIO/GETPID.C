/* getpid --- return the user's process number */

getpid()
{
        int buf[1];

        date (SYS_PID, buf);
        return (buf[0]);
}
