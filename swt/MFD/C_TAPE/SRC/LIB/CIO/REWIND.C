/* rewind --- rewind to beginning of a stream */

rewind (fp)
FILE *fp;
{
        fseek (fp, 0L, 0);
        return 0;       /* this is a void function under UNIX */
}
