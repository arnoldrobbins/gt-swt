/* getpass --- get a password of at most 8 characters from the terminal */

#define NOECHO 0140000     /* for primos duplx$ */

char *getpass(prompt)
char *prompt;
{
        static char pword[9];
        FILE *fp;
        int save_lword, duplx$ ();

        if (tty == NULL && (fp = fopen ("/dev/tty", "r")) == NULL)
                fp = stdin;
        else
                fp = tty;

        fprintf (stderr, "%s", prompt);
        save_lword = duplx$ (-1);       /* save parameters */
        duplx$ (NOECHO);
        fscanf (fp, "%8s\n", pword);
        putc ('\n', stderr);            /* echo newline manually */
        duplx$ (save_lword);            /* restore */
        return (pword);
}
