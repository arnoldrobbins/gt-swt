/* cc --- compile a C program */

/* flags for c1 */
int a_flag = FALSE;             /* abort after errors */
int f_flag = FALSE;             /* do not include =cdefs= */
int u_flag = FALSE;             /* be more UNIX compatible */
int y_flag = FALSE;             /* run "lint" */
int I_flag = FALSE;             /* use the provided include directories */
int D_flag = FALSE;             /* define variables */

/* flags for vcg */
int s_flag = FALSE;             /* produce PMA in named file */
int b_flag = FALSE;             /* produce object text in named file */

char *b_name = "";              /* object file name */
char *s_name = "";              /* PMA file name */
char *u_number = "";            /* optional number for c1's -u flag */

char *incls[MAXARGV];           /* list of include directories */
char *defs[MAXARGV];            /* list of defines */
int incl_index = 0;             /* index into incls */
int def_index = 0;              /* index into defs */

char *fname = NULL;             /* pointer to file name */

char *strrchr();                /* declare function */

main(argc, argv)
int argc;
char **argv;
{
        int i;
        char *basename();

        if (argc == 1)
                usage ();

        for (i = 1; i < argc; i++)
                switch (argv[i][0]) {
                case '-':
                        switch (argv[i][1]) {
                        case 'a':
                                a_flag = TRUE;
                                break;

                        case 'b':
                                b_flag = TRUE;
                                if (argv[i][2] != '\0')
                                        b_name = & argv[i][2];
                                else if (i + 1 < argc && argv[i+1][0] != '-')
                                {
                                        i++;
                                        b_name = argv[i];
                                }
                                break;

                        case 'f':
                                f_flag = TRUE;
                                break;

                        case 's':
                                s_flag = TRUE;
                                if (argv[i][2] != '\0')
                                        s_name = & argv[i][2];
                                else if (i + 1 < argc && argv[i+1][0] != '-')
                                {
                                        i++;
                                        s_name = argv[i];
                                }
                                break;

                        case 'u':
                                u_flag = TRUE;
                                if (argv[i][2] != '\0')
                                        u_number = & argv[i][2];
                                else if (i + 1 < argc && argv[i+1][0] != '-')
                                {
                                        i++;
                                        u_number = argv[i];
                                }
                                break;

                        case 'y':
                                y_flag = TRUE;
                                break;

                        case 'D':
                                if (argv[i][2] != '\0')
                                        defs[def_index++] = & argv[i][2];
                                else if (i + 1 < argc && argv[i+1][0] != '-')
                                {
                                        defs[def_index++] = argv[i+1];
                                        i++;
                                }
                                else
                                        usage();
                                break;

                        case 'I':
                                if (argv[i][2] != '\0')
                                        incls[incl_index++] = & argv[i][2];
                                else if (i + 1 < argc && argv[i+1][0] != '-')
                                {
                                        incls[incl_index++] = argv[i+1];
                                        i++;
                                }
                                else
                                        usage();
                                break;

                        default:
                                usage ();
                                break;
                        }
                        break;

                default:
                        if (fname != NULL)
                        {
                                fprintf (stderr, "cc: more than one file name\n");
                                usage();
                        }
                        else
                                fname = basename (argv[i]);
                        break;
                 }

        shell_commands ();
}

/* shell_commmands --- write out shell commands to compile a program */

shell_commands()
{
        int i;

        if (fname == NULL)
                usage();

        printf ("declare _search_rule = \"^int,^var,=ebin=/&,=bin=/&\"\n");

        printf ("c1 ");
        if (a_flag)
                printf ("-a ");
        if (f_flag)
                printf ("-f ");
        if (y_flag)
                printf ("-y ");
        if (u_flag)
                printf ("-u %s ", u_number);

        for (i = 0; i < def_index; i++)
                printf ("-D%s ", defs[i]);

        for (i = 0; i < incl_index; i++)
                printf ("-I %s ", incls[i]);

        printf ("%s.c\n", fname);

        printf ("vcg -m %s\n", fname);

        if (s_flag)
        {
                int l;

                printf ("vcg -m %s -s\n", fname);
                if (s_name[0] != '\0')
                {
                        if (strrchr (s_name, '/') != NULL)
                        {
                                printf ("cp %s.s %s\n", fname, s_name);
                                printf ("del %s.s\n", fname);
                        }
                        else
                                printf ("cn %s.s %s\n", fname, s_name);

                        l = strlen (s_name);
                        strcpy (b_name, s_name);
                        if (s_name[l-2] == '.' && s_name[l-1] == 's')
                                b_name[l-1] = 'b';
                        else
                                strcat (b_name, ".b");
                }
        }

        if (b_flag)
        {
                if (b_name[0] != '\0')
                {
                        if (strrchr (b_name, '/') != NULL)
                        {
                                printf ("cp %s.b %s\n", fname, b_name);
                                printf ("del %s.b\n", fname);
                        }
                        else
                                printf ("cn %s.b %s\n", fname, b_name);
                }
        }

        printf ("del %s.ct1 %s.ct2 %s.ct3\n", fname, fname, fname);

        if (y_flag)
        {
                printf ("%s.ck> cck1 | sort | cck2\n", fname);
                printf ("del %s.ck\n", fname);
        }
}

/* basename --- return name without suffix */

char *basename (file)
char *file;
{
        int i;

        i = strlen (file);
        if (file[i - 2] != '.') /* no suffix */
                return (file);

        file[i-2] = '\0';
        return (file);
}

/* usage --- print Usage message and exit */

usage()
{
        fprintf (stderr, "Usage: cc <path_name> [-afy]\n");
        fprintf (stderr, "          {-D<name>[=<val>]|-I<dir>}\n");
        fprintf (stderr, "          [-b[<path_name>]]\n");
        fprintf (stderr, "          [-s[<path_name>]]\n");
        fprintf (stderr, "          [-u<u_number>]\n");
        exit (1);
}
