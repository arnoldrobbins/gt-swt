/* ucc --- compile a C program, Unix style */

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

char *pass_on[MAXARGV];         /* stuff to pass on to 'compile' */
int p_index = 0;                /* index into pass_on */

char *strrchr();                /* declare function */

main(argc, argv)
int argc;
char **argv;
{
        int i;

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
                                D_flag = TRUE;
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
                                I_flag = TRUE;
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
                                pass_on[p_index++] = argv[i];
                                break;
                        }
                        break;

                default:
                        pass_on[p_index++] = argv[i];
                        break;
                 }

        shell_commands ();
}

/* shell_commmands --- write out shell commands to compile a program */

shell_commands()
{
        int i;

        printf ("declare _search_rule = \"^int,^var,=bin=/&\"\n");

        printf ("compile -m c ");
        if (a_flag || f_flag || y_flag || u_flag || s_flag || b_flag
                || I_flag || D_flag)
        {
                printf("-C '");
                if (a_flag)
                        printf ("-a ");
                if (f_flag)
                        printf ("-f ");
                if (y_flag)
                        printf ("-y ");
                if (u_flag)
                        printf ("-u %s ", u_number);
                if (s_flag)
                        printf ("-s %s ", s_name);
                if (b_flag)
                        printf ("-b %s ", b_name);

                for (i = 0; i < def_index; i++)
                        printf ("-D%s ", defs[i]);

                for (i = 0; i < incl_index; i++)
                        printf ("-I %s ", incls[i]);
                printf ("' ");
        }

        for (i = 0; i < p_index; i++)
                printf ("'%s' ", pass_on[i]);

        printf ("\n");
}

/* usage --- print Usage message and exit */

usage()
{
        fprintf (stderr, "Usage: ucc { <path_name> }\n");
        fprintf (stderr, "           [<cc_opts>][<compile_opts>]\n");
        exit (1);
}
