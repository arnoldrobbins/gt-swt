/* ctermid --- return filename of a terminal device */

char *ctermid(s)
char *s;
{
      static char term[] = "/dev/tty";

      if (s == NULL)
            return(term);
      else
      {
            strcpy(s, term);
            return(s);
      }
}
