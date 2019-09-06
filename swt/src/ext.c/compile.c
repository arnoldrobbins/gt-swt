/* compile --- general purpose compiler interface */

enum { C, Ratfor, Pascal, Fortran, Pma, Nolang } Lang = Nolang;

struct file {
        char *name;
        char suffix;
        struct file *next_file;
        };

struct file *filelist = NULL;
struct file *fileq = NULL;
struct file *tail = NULL;

struct lib {
        char *name;
        struct lib *next_lib;
        };

struct lib *liblist = NULL;
struct lib *libq = NULL;
struct lib *libtail = NULL;

char *cc_opts = "";             /* pointers to options */
char *pc_opts = "";             /* will be set to point into argv */
char *rp_opts = "";
char *fc_opts = "";
char *pma_opts = "";            /* null strings so low level routines don't bomb */

char *pass_on[MAXARGV];         /* pass unknown options on to loader */
int p_index = 0;                /* index into pass_on */

int c_flag = FALSE;             /* compile only */
int o_flag = FALSE;             /* select output file */

char *output = NULL;            /* final output file name */

main (argc, argv)
int argc;
char **argv;
{
        int i, j;

        if (argc == 1)
                usage ();

        for (i = 1; i < argc; i++)
                if (argv[i][0] != '-')          /* it's a file.... */
                        buildfile (argv[i]);
                else
                        process_arg (argv, &i);

        shell_commands ();      /* produce shell commands on stdout */
}

/* process_arg --- handle an argument off the command line */

process_arg (argv, ip)
char **argv;
int *ip;
{
        switch (argv[*ip][1]) {
        case 'c':
                c_flag = TRUE;
                break;

        case 'm':       /* set main language and default suffix */
                if (argv[*ip][2] != '\0')
                        set_lang (argv[*ip][2]);
                else
                {
                        set_lang (argv[(*ip) + 1][0]);
                        (*ip)++;
                }
                break;

        case 'o':       /* choose name of final output file */
                o_flag = TRUE;
                if (argv[*ip][2] != '\0')
                        output = & argv[*ip][2];
                else
                {
                        output = argv[(*ip) + 1];
                        (*ip)++;
                }
                break;

        case 'C':
                if (argv[*ip][2] != '\0')
                        cc_opts = & argv[*ip][2];
                else
                {
                        cc_opts = argv[(*ip) + 1];
                        (*ip)++;
                }
                break;

        case 'R':
                if (argv[*ip][2] != '\0')
                        rp_opts = & argv[*ip][2];
                else
                {
                        rp_opts = argv[(*ip) + 1];
                        (*ip)++;
                }
                break;

        case 'P':
                if (argv[*ip][2] != '\0')
                        pc_opts = & argv[*ip][2];
                else
                {
                        pc_opts = argv[*ip + 1];
                        (*ip)++;
                }
                break;

        case 'F':
                if (argv[*ip][2] != '\0')
                        fc_opts = & argv[*ip][2];
                else
                {
                        fc_opts = argv[(*ip) + 1];
                        (*ip)++;
                }
                break;

        case 'S':
                if (argv[*ip][2] != '\0')
                        pma_opts = & argv[*ip][2];
                else
                {
                        pma_opts = argv[(*ip) + 1];
                        (*ip)++;
                }
                break;

        case 'l':       /* special case -l, even tho passed to loader */
                if (argv[*ip][2] != '\0')
                        buildlib (& argv[*ip][2]);
                else
                {
                        buildlib (argv[(*ip) + 1]);
                        (*ip)++;
                }
                break;

        default:
                pass_on[p_index++] = argv[*ip];
                break;
        }
}

/* buildfile --- put a plain file into the file list */

buildfile (filename)
char *filename;
{
        struct file *newfile;
        int strlen();
        char *malloc();
        int i;

        i = strlen (filename);

        if (filename[i-2] != '.')       /* there is not a suffix */
        {
                pass_on[p_index++] = filename;
                return;
        }

        newfile = (struct file *) malloc (sizeof (struct file));
        newfile->next_file = NULL;
        newfile->name = filename;       /* pointer to argv */

        newfile->suffix = filename[i-1];
        newfile->name[i-2] = '\0';

        if (filelist == NULL)   /* first file */
                filelist = newfile;
        else
                tail->next_file = newfile;
        tail = newfile;
}

/* buildlib --- add a library to the list */

buildlib (libname)
char *libname;
{
        struct lib *newlib;
        int strlen();
        char *malloc();

        newlib = (struct lib *) malloc (sizeof (struct lib));
        newlib->next_lib = NULL;
        newlib->name = libname;       /* pointer to argv */

        if (liblist == NULL)   /* first lib */
                liblist = newlib;
        else
                libtail->next_lib = newlib;
        libtail = newlib;
}

/* shell_commands --- print out shell commands */

shell_commands()
{
        int i;

        if (filelist == NULL)
                usage();

        printf ("declare _search_rule = '^int,^var,=ebin=/&'\n");

        for (fileq = filelist; fileq != NULL; fileq = fileq->next_file)
                switch (fileq->suffix) {
                case 'r':
                        printf ("rp %s.r %s\n", fileq->name, rp_opts);
                        /* fall through */

                case 'f':
                        printf ("fc %s.f %s | x\n", fileq->name, fc_opts);
                        break;

                case 'p':
                        printf ("pc %s.p %s | x\n", fileq->name, pc_opts);
                        break;

                case 's':
                        printf ("pmac %s.s %s | x\n", fileq->name, pma_opts);
                        break;

                case 'c':
                        printf ("cc %s %s.c | sh\n", cc_opts, fileq->name);
                        break;

                case 'b':
                        break;

                default:
                        error ("in shell_commands: can't happen");
                        break;
                }

        if (c_flag)     /* compile only */
                return;

        printf ("ld -u ");      /* generate loader commands */
        if (Lang == C)
                printf ("-b ");
        else if (Lang == Pascal)
                printf ("-a ");

        for (fileq = filelist; fileq != NULL; fileq = fileq->next_file)
                printf ("%s.b ", fileq->name);

        for (libq = liblist; libq != NULL; libq = libq->next_lib)
                printf ("-l %s ", libq->name);

        for (i = 0; i < p_index; i++)
                printf ("%s ", pass_on[i]);

        if (! o_flag)
                output = filelist->name;        /* first file name */

        printf ("-o %s ", output);
        printf ("| x\n");
}

/* set_lang --- decide on main language */

set_lang (suffix)
char suffix;
{
        switch (mapdn (suffix)) {
        case 'r':
                Lang = Ratfor;
                break;

        case 'c':
                Lang = C;
                break;

        case 'p':
                Lang = Pascal;
                break;

        case 's':
                Lang = Pma;
                break;

        case 'f':
                Lang = Fortran;
                break;

        default:
                usage ();
                break;
        }
}

/* usage --- print usage message and die */

usage()
{
        static char *msg[] = {
                "Usage: compile {<input_files>} [-c] [-m <language>]\n",
                "              [-C<'cc' options>] [-R<'rp' options>]\n",
                "              [-F<'fc' options>] [-S<'pmac' options>]\n",
                "              [-P<'pc' options>] [{-l <library>}]\n",
                "              [-o <output_file>]\n",
                NULL
                };
        int i;

        for (i = 0; msg[i] != NULL; i++)
                fputs (msg[i], stderr);

        exit (1);
}
