/* fputc --- put a character to a stream */

fputc(c, stream)
int c;
FILE *stream;
{
        putc(c, stream);
}
