/* envinit --- intialize the environment */

/*
** Initialize the environment a la Unix.
** Set up a bunch of strings of the form
** name=value
** sorted on name. The names and values
** are the user's shell variables.
** Make everything available through the
** variable environ and the getenv() routine.
**
** For use under bare primos, getenv returns NULL, and
** environ is set to NULL.  This is conditionally compiled in,
** and handled by the build procedures.
*/

/* maximum length of the name and value of a variable */
/* maximum number of variables we'll allow */

#define MAXVAR          50
#define MAXVAL          250
#define MAXENV          256
#define MAXBUF          1024

char **environ = NULL;  /* available for the outside world */

#ifndef STAND_ALONE     /* to run under bare primos (shudder!) */

static char env[MAXBUF];        /* holds the strings */
static char *envptr[MAXENV+1];  /* points to them, sort this array */

static int no_vars;     /* keep count */

/* The static functions must come first to avoid a bogus error form c1 */

#define swap(x,y) (temp = x, x = y, y = temp)

static int compare(s1,s2)
char *s1,*s2;
{
        int i;

        for(i = 0; s1[i] == s2[i]; i++)
                if(s1[i] == '\0')
                        return(0);      /* strings are equal */
        else if(s1[i] == '=' || s2[i] == '=')
                return((unsigned) s1[i-1] - (unsigned) s2[i-1]);

        /* loop broken. either chars equal or not */
        return((unsigned) s1[i] - (unsigned) s2[i]);
        /* <0 if s1 < s2, >0 if s1 > s2 */
}

static sort()
{
        char *temp;
        int i,j;
        int incr;
        int n;

        /* shell sort */

        n = no_vars;
        incr = n / 2;
        while(incr > 0)
        {
                for (i = incr + 1; i <= n; i++)
                {
                        j = i - incr;
                        while(j > 0)
                        {
                                if(compare(envptr[j-1], envptr[j+incr-1])       > 0)
                                {
                                        swap(envptr[j-1], envptr[j+incr-1]);
                                        j -= incr;
                                }
                                else
                                        break;
                        }       /* end while */
                }       /* end for */
                incr /= 2;
        }       /* end while */
}
#endif

/* envinit --- initialize the environment */

envinit()
{
#ifndef STAND_ALONE
        int i, j, k, l;
        char value[MAXVAL+1];
        int svscan(), svget();  /* get variables and values respectively */
        static int first = TRUE;
        static int status[3] = { 0, 0, 0 };

        if(first)
                first = FALSE;
        else
                return; /* initialize the environment only once */

        /* string the name=value groups end to end */
        for(i = j = 0; i < MAXBUF && j <= MAXENV
                && (k = svscan(&env[i], MAXVAR, status)) != EOF; j++)
        {
                l = svget(&env[i], &env[i+k+1], MAXVAL);
                env[i+k] = '=';
                envptr[j] = & env[i];
                i += k + l + 1 + 1; /* leave room for the EOS */
        }

        envptr[j] = NULL;

        no_vars = i;

        if(i >= MAXENV)
        {
                fprintf(stderr,"envinit(): too many variable in environment, ");
                fprintf(stderr,"using only the first %d variables\n",MAXENV);
        }

        if(j >= MAXBUF)
        {
                fprintf(stderr, "envinit(): too many characters in environment, ");
                fprintf(stderr, "using only the first %d characters\n", MAXBUF);
        }

        no_vars = j;

        sort();         /* sort the little devils */

        environ = envptr;
#endif
}

/* getenv --- return value of name=value pair from environment */

char *getenv (var)
char *var;
{
#ifndef STAND_ALONE
        static int first = TRUE;
        int i,j;
        int low, mid, high, val;

        if(first)
        {
                first = FALSE;
                if(environ == NULL)
                        envinit();
        }

        /* use binary search */
        i = val = 0;
        j = strlen(var);

        low = 0;
        high = no_vars - 1;
        mid = (high + low) / 2;
        while(low < high)
        {
                val = strncmp(var, environ[mid], j);
                if(val == 0) /* found */
                        break;
                else if(val < 0) /* var < environ[i] */
                        high = mid - 1;
                else /* var > environ[i] */
                        low = mid + 1;
                mid = (high + low) / 2;
        }

        if(strncmp(var, environ[mid], j) == 0) /* found */
                i = mid;
        else /* not found */
                return(NULL);

        if(environ[i] != NULL)           /* got it */
        {
                for(j = 0; environ[i][j] != '='; j++)
                        ;       /* skip over name */
                j++;            /* skip over '=' */
                return(&environ[i][j]);
        }
        else
                return(NULL);
#else
        return (NULL);
#endif
}
