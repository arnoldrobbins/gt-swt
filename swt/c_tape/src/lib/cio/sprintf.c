/* sprintf --- do formatted memory to memory conversion */
/*                                                      */
/* sprintf (str, control, arg1, arg2, ...)              */
/*   in control str conversion fields are               */
/*   %  (start of conversion specifier)                 */
/*      optional flag, one of                           */
/*              - + <blank> #                           */
/*      optional decimal width value ('*' val from arg) */
/*      optional period                                 */
/*      optional decimal precision value ('*' from arg) */
/*      optional long int designation ('l')             */
/*              (recognize and ignore 'h')              */
/*      conversion designator, one of                   */
/*              d o u x X f e E g G c s %               */
/*                                                      */
/* any other characters are copied to the str from      */
/* control directly.                                    */
/*                                                      */
/********************************************************/
/*  WARNING:  Number of arguments MUST match number of  */
/*            fields specified in the control string.   */
/********************************************************/

/*
** Go through control string and arguments, using encode to build
** temporary formatted strings, copying the results into the final
** string.
*/

/*
** The defining or not defining of DEBUG controls whether or
** the debug(x) statements are compiled in.  This device is
** very useful for debugging code, without having to worry
** about putting code in and out of comments
*/

#include <debug.h>

/* macro for getting a given argument */
#define assign(p) switch (argno) { \
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
default: debug(fprintf(stderr,"sprintf: tried to use > 10 args\n"));return (EOF);}

#define BOMB()  if (1) { string[s_in] = '\0'; return (EOF); } else

sprintf (string, control, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
char *string;
char *control;
char *arg1, *arg2, *arg3, *arg4, *arg5, *arg6, *arg7, *arg8, *arg9, *arg10;
{
        int left_justify;
        int signed_output;      /* number is always signed (pos no has +) */
        int prefix_blank;       /* put a blank in front of pos no's */
        int alternate_form;     /* see printf doc... */
        int is_long;            /* long int (floats always double) */
        int is_negative;        /* negative number */
        int is_unsigned;        /* use unsigned notation */
        int use_shortest;       /* 'g' --- shortest of 'e' & 'f' */
        int no_point;           /* no decimal point in floating pt */

        char swtcontrol [MAXLINE];      /* encode string */
        char width[MAXLINE];            /* field width */
        char prec[MAXLINE];             /* precision */
        char fill;                      /* padding char */
        char conv;                      /* conv specifier */

        char *argp;             /* current argument */
        int argno = 0;          /* current arg number */

        char result [MAXLINE];  /* temp str for encode */
        char result2 [MAXLINE];
        char *cp;

        int s_in;               /* index into dest string */
        int c_in;               /* index into control string */
        int i, j, k;
        int base;               /* converting to base 8, 10, 16 */

        s_in = 0;
        for (c_in = 0; control[c_in] != '\0'; c_in++)
        {
                /* set defaults */
                fill = ' ';
                width[0] = prec[0] = '\0';
                left_justify = signed_output = prefix_blank =
                        alternate_form = is_long = is_negative =
                        is_unsigned = use_shortest = no_point = FALSE;
                base = 8;       /* will be added to as necessary */

                if (control[c_in] != '%' && control[c_in] != '\0')
                {
                        string[s_in++] = control[c_in];
                        /* copy literal characters */
                        continue;
                        /* get the next character in the string */
                }

                if (control[c_in] == '\0')
                        break;
                /* else
                        just saw a '%' */

                c_in++;         /* skip leading '%' */

                argno++;        /* get next arg */

                /* control flag */
                switch (control[c_in]) {
                case '-':
                        left_justify = TRUE;
                        c_in++;
                        break;

                case '+':
                        signed_output = TRUE;
                        c_in++;
                        break;

                case ' ':
                        prefix_blank = TRUE;
                        c_in++;
                        break;

                case '#':
                        alternate_form = TRUE;
                        c_in++;
                        break;

                case '\0':
                        /* error!! */
                        BOMB();
                        break;

                default:
                        break;
                }

                /* field width */
                if (control[c_in] == '*')       /* get from arg */
                {
                        assign (argp);
                        itoc (*argp, width, sizeof (width));
                        c_in++;
                        argno++;        /* to get proper arg */
                }
                else if (control[c_in] == '-')  /* negative width no good */
                        c_in++;

                if (isdigit (control[c_in]))
                {
                        for (i = 0; isdigit (control[c_in]); i++)
                                width[i] = control[c_in++];
                        width[i] = '\0';
                }

                if (control[c_in] == '\0')
                        BOMB();
                else if (control[c_in] == '.')
                {
                        c_in++;
                        /* precision */
                        if (control[c_in] == '*')       /* get from arg */
                        {
                                assign (argp);
                                itoc (*argp, prec, sizeof (prec));
                                c_in++;
                                argno++;        /* to get proper arg */
                        }
                        else if (isdigit (control[c_in]))
                        {
                                for (i = 0; isdigit (control[c_in]); i++)
                                        prec[i] = control[c_in++];
                                prec[i] = '\0';
                        }
                        else
                                prec[0] = '\0';
                }

                if (control[c_in] == '\0')
                        BOMB();

                if (control[c_in] == 'l')       /* long arg */
                {
                        is_long = TRUE;
                        c_in++;
                }
                else if (control[c_in] == 'h')
                        c_in++;         /* ignore it */

                /* for compatibility with earlier printf's */
                /* a leading 0 in the width means fill with 0's */
                if (width[0] == '0')
                        fill = '0';

                conv = control[c_in];
                        /* do not increment c_in, that is done by for loop */

                assign (argp);          /* do only once */

                switch (conv) {
                case '%':
                        string[s_in++] = '%';
                        break;

                case 'c':
                        string[s_in++] = (char) *argp;
                        break;

                case 'x':
                case 'X':
                        base += 6;
                case 'u':
                case 'd':
                        base += 2;
                case 'o':
                        is_unsigned = (conv != 'd');
                        i = 0;
                        encode(swtcontrol, MAXLINE, "*s*s,*i*s*c",
                                left_justify ? "*-" : "*",
                                width,  /* if empty will print nothing */
                                is_unsigned ? -base : base,
                                fill == '0' ? ",0" : "",
                                is_long ? 'l' : 'i');
                        encode (result, MAXLINE, swtcontrol, argp);
                        if (! is_unsigned)      /* signed conversion */
                        {
                                if (signed_output && result[0] != '-')
                                        string[s_in++] = '+';
                                else if (prefix_blank)
                                        string[s_in++] = ' ';
                        }
                        else if (alternate_form && conv != 'u')
                        {
                                /* octal or hex */
                                string[s_in++] = '0';
                                if (tolower (conv) == 'x')
                                        string[s_in++] = conv;
                        }
                        if (conv == 'X')
                                mapstr (result, UPPER);

                        for (i = 0; result[i] != '\0'; i++)
                                string[s_in++] = result[i];
                        break;

                case 's':
                        if (argp == NULL)
                                break;          /* null string */
                        i = encode (swtcontrol, MAXLINE, "*s*s",
                                left_justify ? "*" : "*-", width);
                        if (prec[0] != '\0')
                        {
                                swtcontrol[i++] = ',';
                                for (j = 0; prec[j] != '\0'; j++)
                                        swtcontrol[i++] = prec[j];
                        }
                        swtcontrol[i++] = 's';
                        swtcontrol[i] = '\0';
                        encode (result, MAXLINE, swtcontrol, * argp);
                        for (i = 0; result[i] != '\0'; i++)
                                string[s_in++] = result[i];
                        break;

                case 'g':
                case 'G':
                        use_shortest = TRUE;
                case 'e':
                case 'E':
                case 'f':
                        if (prec[0] == '\0')
                        {
                                prec[0] = '6';
                                prec[1] = '\0';
                        }
                        else if (ctoi (prec, (j = 1, &j)) == 0)
                                no_point = TRUE;

                        encode (swtcontrol, MAXLINE, "*s*s,*sd",
                                left_justify ? "*" : "*-", width, prec);
                        /* f format */
                        i = encode (result, MAXLINE, swtcontrol, argp);

                        encode (swtcontrol, MAXLINE, "*s*s,-*sd",
                                left_justify ? "*" : "*-", width, prec);
                        /* e format */
                        j = encode (result2, MAXLINE, swtcontrol, argp);

                        if (use_shortest)
                        {
                                if (i <= j)
                                        conv = 'f';
                                else
                                        conv = 'e';
                        }

                        if (conv == 'f')
                                cp = result;
                        else
                        {
                                i = j;
                                cp = result2;
                        }
                        /* cp will be string, i length */

                        if (signed_output && cp[0] != '-')
                                string[s_in++] = '+';
                        else if (prefix_blank)
                                string[s_in++] = ' ';

                        if (isupper (conv))
                                mapstr (cp, UPPER);
                        else
                                mapstr (cp, LOWER);

                        /* copy first part of number */
                        j = 0;
                        if (cp[j] == '-')
                                string[s_in++] = cp[j++];
                        for (; isdigit (cp[j]); j++)
                                string[s_in++] = cp[j];

                        if (alternate_form)     /* keep decimal point */
                        {
                                if (cp[j] == '.' && no_point)
                                {
                                        string[s_in++] = cp[j];
                                        for (j++; isdigit (cp[j]); j++)
                                                ;
                                }
                                /* else
                                        fall thru to copy all of it */
                        }
                        else if (no_point)
                        {
                                if (cp[j] == '.')
                                        for (j++; isdigit (cp[j]); j++)
                                                ;
                        }

                        /* copy the rest of it */
                        for (; cp[j] != '\0'; j++)
                                string[s_in++] = cp[j];
                        break;

                case '\0':
                        BOMB();
                        break;

                default:
                        /* treat like a string with the char in it */
                        i = encode (swtcontrol, MAXLINE, "*s*s",
                                left_justify ? "*" : "*-", width);
                        if (prec[0] != '\0')
                        {
                                swtcontrol[i++] = ',';
                                for (j = 0; prec[j] != '\0'; j++)
                                        swtcontrol[i++] = prec[j];
                        }
                        swtcontrol[i++] = 's';
                        swtcontrol[i] = '\0';
                        result2[0] = conv;
                        result2[1] = '\0';      /* use as temp buf */
                        encode (result, MAXLINE, swtcontrol, result2);
                        for (i = 0; result[i] != '\0'; i++)
                                string[s_in++] = result[i];
                        break;
                }
        }

        /* normal exit */
        string[s_in] = '\0';
        return (--s_in);
}
