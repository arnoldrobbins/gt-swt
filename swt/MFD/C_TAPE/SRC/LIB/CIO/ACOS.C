/* acos --- return arc cosine of x */

double acos (x)
double x;
{
        extern double dacs$m();

        return (dacs$m (x));
}
