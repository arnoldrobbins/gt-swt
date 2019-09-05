/* doscan --- do the work for all 3 versions of scanf */
/*            behave slightly differently based on macros */

/*
 * control string contains literal characters which MUST match
 * the next character of input, and conversion specifiers,
 * which consist of the the following:
 *    mandatory %    begin conversion specification
 *    optional  *    assignment suppression
 *    optional       numeric field width
 *    optional  [lh] l == long var, h == short var
 *    mandatory      conversion specifier
 *       d,o,x,u        octal,decimal,hexadecimal integers
 *       c              character(s)
 *       s              string
 *       e,f,g          floating point numbers
 *       [              class of characters
 */

#ifdef DEBUG
#define debug fprintf
#else
#define debug(x,y,z)
#endif

/* "local" function to choose correct argument */
/* NOTE: modifies its argument */
/* the macro has no leading spaces in order to save room */
#define assignp(p)   switch(argno) { \
case 1: p = arg1; break; \
case 2: p = arg2; break; \
case 3: p = arg3; break; \
case 4: p = arg4; break; \
case 5: p = arg5; break; \
case 6: p = arg6; break; \
case 7: p = arg7; break; \
case 8: p = arg8; break; \
case 9: p = arg9; break; \
case 10: p = arg10; break; \
default: debug(stderr,"(doscan): attempt to use > 10 args\n");\
return(ret);} argno++

/*
 * define the input() and putback() macros depending
 * on which routine is being compiled.
 * NOTE: the input() macro modifies its argument
 */

#ifdef SCANF
#       define input(c)   {c = getchar(); if(c==EOF || c==ERR) return(ret);}
#       define putback(c) ungetc(c,stdin)
#else
#ifdef FSCANF
#       define input(c)   {c = getc(stream); if(c==EOF || c==ERR) return(ret);}
#       define putback(c) ungetc(c,stream)
#else /* SSCANF */
#       define input(c)   {c = string[s_in++]; if(c=='\0') if(!kludge){\
                           s_in--; kludge=TRUE;  c = ' ';}\
                                             else return(ret);}
#       define putback(c) s_in--
#endif
#endif

/* skipwhite - skips (leading) white space in the input */
#define skipwhite()  {input(ic); \
                      while(isspace(ic)) input(ic); \
                      putback(ic);}

#ifdef SCANF

scanf(control, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)

#else
#ifdef FSCANF

fscanf(stream, control, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
FILE *stream;

#else /* SSCANF */

sscanf(string, control, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
char *string;

#endif
#endif

char *control;
char *arg1, *arg2, *arg3, *arg4, *arg5, *arg6, *arg7, *arg8, *arg9, *arg10;
{
        int argno;              /* current argument */
        int ret;                /* return value */
        int no_assign;          /* in case of assignment suppression */
        int islong, isshort;    /* size of arguments */
        int field;              /* optional numeric field length */
        char *argp;             /* current argument */
        char inline[MAXLINE];   /* string input buffer */
        int i, j, k;            /* loop control + other misc purposes */
        int sign, expsign;      /* for handling signed numbers */
        int exp;                /* exponent */
        int base;               /* octal, hexadecimal, decimal */
        double power;           /* for handling exponents */
        short sval, *sp;        /* declare variables of various lengths */
        int ival, *ip;
        long lval, *lp;
        float fval, *flp;
        double dval, *dp;
        char ic;                /* next char in input */
        int count;              /* number successfully matched and assigned */

        double ctod();          /* SWT function for real number conversion */

        char scanset[MAXLINE];  /* set of chars to match when doing %[ */
        int scan;               /* index into scanset */
        int allbut;             /* match all characters NOT in the scanset */
        char *strchr();         /* function returns pointer to occurrence in a string */
        char tc;                /* char for expanding A-Z, 0-9, etc. */

        int c_in;               /* index into control */

#ifdef SSCANF
        int kludge = FALSE;     /* kludge to get algorithm to read all */
                                /* chars AND convert, before returning */
                                /* necessary only for sscanf  */
        int s_in = 0;           /* index into source string */
#endif

        argno = 1;              /* let's start at the very beginning... */
        ret = EOF;              /* no matches yet */

        for (c_in = count = 0; control[c_in] != '\0'; c_in++)
        {
                no_assign = islong = isshort = FALSE;
                allbut = FALSE;
                field = -1;
                base = 0;

                if (isspace(control[c_in]))
                {
                        debug(stderr, "(doscan): skipping white space\n");
                        input(ic);
                        if (! isspace(ic))
                                putback(ic);
                        continue;
                }
                else if (control[c_in] != '%')
                {
                        debug(stderr, "(doscan): matching text\n");
                        input(ic);
                        if (ic != control[c_in])
                        {
                                putback(ic);
                                return(ret);
                        }
                        /* else
                                input matched control
                                keep looping */
                        continue;
                }

                /* do a conversion */
                debug(stderr, "(doscan): doing a conversion\n");
                control++;      /* skip over the percent */
                if (control[c_in] == '*')    /* turn on assignment suprression */
                {
                        debug(stderr, "(doscan): no_assign == true\n");
                        no_assign = TRUE;
                        control++;
                }

                if (control[c_in] == '-')
                        control++;

                if (isdigit(control[c_in]))  /* a field width */
                        for (field = 0; isdigit(control[c_in]); c_in++)
                                field = 10 * field + control[c_in] - '0';

                if (control[c_in] == 'l')
                {
                        debug(stderr, "(doscan): islong == true\n");
                        islong = TRUE;
                        control++;
                }
                else if (control[c_in] == 'h')
                {
                        debug(stderr, "(doscan): isshort == true\n");
                        isshort = TRUE;
                        control++;
                }

                switch (control[c_in]) {
                case '%':       /* a literal '%' */
                        debug(stderr, "(doscan): literal %%\n");
                        input(ic);
                        if (ic != '%')
                        {
                                putback(ic);
                                return(ret);
                        }
                        /*
                         * we don't increment count, since
                         * we're just matching literal input
                         */
                        break;

                case 's':       /* a string of characters */
                        debug(stderr, "(doscan): string\n");
                        skipwhite();
                        if (field < 0)  /* no field length */
                        {
                                input(ic);
                                for (i = 0; !isspace(ic); i++)
                                {
                                        inline[i] = ic;
                                        input(ic);
                                }
                                inline[i] = '\0';
                                putback(ic);
                        }
                        else
                        {
                                input(ic);
                                j = 0;
                                for (i = 1; i <= field && !isspace(ic); i++)
                                {
                                        inline[j++] = ic;
                                        input(ic);
                                }
                                inline[j] = '\0';
                                putback(ic);
                        }
                        if (! no_assign)
                        {
                                assignp(argp);
                                strcpy(argp, inline);
                                ret = ++count;
                        }
                        break;

                case 'e':
                case 'f':       /* floating point numbers */
                case 'g':
                        debug(stderr, "(doscan): floating point\n");
                        skipwhite();
                        /* collect characters in a local array, and call */
                        /* the SWT routine dtoc() which knows about the */
                        /* idiosyncrasies of floating point on the PR1MEs */
                        j = 0;
                        input(ic);
                        if (ic == '+' || ic == '-')
                        {
                                inline[j++] = ic;
                                input(ic);
                        }
                        while (isdigit(ic))
                        {
                                inline[j++] = ic;
                                input(ic);
                        }
                        if (ic == '.')
                        {
                                inline[j++] = ic;
                                input(ic);
                                while (isdigit(ic))
                                {
                                        inline[j++] = ic;
                                        input(ic);
                                }
                        }
                        if (ic == 'E' || ic == 'e')
                        {
                                inline[j++] = ic;
                                input(ic);
                                if (ic == '+' || ic == '-')
                                {
                                        inline[j++] = ic;
                                        input(ic);
                                }
                                while (isdigit(ic))
                                {
                                        inline[j++] = ic;
                                        input(ic);
                                }
                                putback(ic);    /* character which broke the loop */
                        }
                        else
                                putback(ic);
                        inline[j] = '\0';
                        debug(stderr, "(doscan): floating point input is '%s'\n", inline);
                        if (! no_assign)
                        {
                                assignp(argp);
                                k = 1;  /* start at 1 for Fortran, pass a variable so */
                                dval = ctod(inline, k);  /* it doesn't change a constant */
                                if (islong)
                                {
                                        dp = (double *) argp;
                                        *dp = dval;
                                }
                                else
                                {
                                        flp = (float *) argp;
                                        fval = dval;
                                        *flp = fval;
                                }
                                ret = ++count;
                        }
                        debug(stderr, "(doscan): dval == %lf\n", dval);
                        break;

                case 'x':       /* hexadecimal integers */
                        base += 8;
                case 'd':
                case 'u':       /* decimal integers */
                        base += 2;
                case 'o':       /* octal integers */
                        base += 8;
                        debug(stderr, "(doscan): integer, base = %d\n", base);
#ifdef SSCANF
                        debug(stderr, "(doscan): string is %s\n", string);
#endif
                        skipwhite();
                        lval = 0L;  /* do in long, convert if necessary */
                        sign = 1;
                        input(ic);
                        if (ic == '+' || ic == '-')
                                if (control[c_in] == 'u')    /* bad input */
                                {
                                        putback(ic);
                                        return(ret);
                                }
                                else
                                {
                                        sign = (ic == '+') ? 1 : -1;
                                        input(ic);
                                }

                        /* now check for leading 0's or 0x */
                        if (ic == '0')
                        {
                                input (ic);
                                while (ic == '0')
                                        input(ic);
                                if (base == 16 && (ic == 'x' || ic == 'X'))
                                        input (ic);
                        }

                        /* do conversion */
                        /* DOES NOT check for '8' or '9' w/octal */
#ifdef SSCANF
                        debug(stderr, "(doscan): converting: ic == %c\n", ic);
#endif
                        while (isxdigit(ic))
                        {
                                if (isdigit (ic))       /* 0-9 */
                                        lval = lval * base + ic - '0';
                                else if (base != 16)
                                        break;
                                else
                                {
                                        ic = tolower (ic);
                                        lval = lval * base + ic - 'a' + 10;
                                }
                                input(ic);
#ifdef SSCANF
                                debug(stderr, "(doscan): converting: ic == %c\n", ic);
#endif
                        }
                        putback(ic);   /* loop stopped at non-digit */
                        if (sign < 0)
                                lval = -lval;
                        debug(stderr, "(doscan): integer result is %ld\n", lval);
                        if (! no_assign)
                        {
                                assignp(argp);
                                if (islong)
                                {
                                        lp = (long *) argp;
                                        *lp = lval;
                                }
                                else if (isshort)
                                {
                                        sp = (short *) argp;
                                        sval = lval;
                                        *sp = sval;
                                }
                                else
                                {
                                        ip = (int *) argp;
                                        ival = lval;
                                        *ip = ival;
                                }
                                ret = ++count;
                        }
                        break;

                case 'c':
                        /* no skip over white space in this case */
                        debug(stderr, "(doscan): character\n");
                        j = 0;
                        if (field < 0)
                        {
                                input(ic);      /* single char */
                                inline[j] = ic;
                        }
                        else
                                for (i = 1; i <= field; i++)
                                {
                                        input(ic);
                                        inline[j++] = ic;
                                }
                        if (! no_assign)        /* just read in chars */
                        {
                                assignp(argp);
                                strncpy (argp, inline, j);
                                ret = ++count;
                        }
                        break;

                case '[':       /* character class conversion */
                        control++;      /* skip '[' */
                        scan = 0;       /* build the scanset */
                        if (control[c_in] == '^')
                        {
                                allbut = TRUE;  /* match what is NOT in the scanset */
                                control++;
                        }
                        if (control[c_in] == ']')    /* literal ']' */
                        {
                                scanset[scan++] = ']';
                                control++;
                        }
                        for (; control[c_in] != ']' && control[c_in] != '\0'; c_in++)
                        {
                                scanset[scan++] = control[c_in];
                                if (control[c_in+1] == '-' && control[c_in+2] > control[c_in])
                                {
                                        for (tc = control[c_in] + 1; tc <= control[c_in+2]; tc++)
                                                scanset[scan++] = tc;
                                        control += 2;
                                }
                        }
                        scanset[scan] = '\0';
#ifdef DEBUG
                        if (control[c_in] == '\0')
                                debug(stderr,
                                        "(doscan): missing closing ']' in conversion specifier\n");
#endif
                        /* now do conversion */
                        /* no skip over white space in this case */
                        i = 0;
                        if (field < 0)
                        {
                                input(ic);
                                if (! allbut)
                                {
                                        while (strchr(scanset, ic) != NULL)
                                        {
                                                input(ic);
                                                inline[i++] = ic;
                                        }
                                }
                                else
                                {
                                        while (strchr(scanset, ic) == NULL)
                                        {
                                                input(ic);
                                                inline[i++] = ic;
                                        }
                                }
                                putback (ic);
                                inline[i] = '\0';
                        }
                        else    /* there is a field width */
                        {
                                input(ic);
                                if (! allbut)
                                {
                                        for (i = 1; strchr(scanset, ic) != NULL && i <= field; i++)
                                        {
                                                input(ic);
                                                inline[i++] = ic;
                                        }
                                }
                                else
                                {
                                        for (i = 1; strchr(scanset, ic) == NULL && i <= field; i++)
                                        {
                                                input(ic);
                                                inline[i++] = ic;
                                        }
                                }
                                putback (ic);
                                inline[i] = '\0';
                        }

                        if (! no_assign)
                        {
                                assignp(argp);
                                strcpy (argp, inline);
                                ret = ++count;
                        }
                        break;

                default:        /* bad conversion, treat like '%' */
                        debug(stderr, "(doscan): conversion char %c unknown\n", control[c_in]);
                        input(ic);
                        if (ic != control[c_in])
                        {
                                putback(ic);
                                return(ret);
                        }
                        break;
                } /* end switch */
        } /* end for */
        return(ret);
}
