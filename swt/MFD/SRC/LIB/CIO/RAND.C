/* rand --- simple random number generator */

static int seeded = FALSE;
extern double rand$m();
extern /* void */ seed$m();

int rand()
{
        long l;
        int ret;
        long one = 1L;

        if (! seeded)
        {
                seeded = TRUE;
                /* obey UNIX semantics: seed initialized to 1 */
                seed$m (one);
        }

        rand$m (&l);
        ret = (int) l;
        return (ret);
}

/* srand --- reseed the random number generator */

srand (seed)
unsigned seed;
{
        long l;

        seeded = TRUE;
        l = seed;
        seed$m (l);
        return 0;
}
