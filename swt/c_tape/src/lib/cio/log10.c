/* log10 --- return log to the base 10 of x */

double log10 (x)
double x;
{
        extern double dlog$m();

        return (dlog$m (x));
}
