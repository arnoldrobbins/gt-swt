/* log --- return natural log of x */

double log (x)
double x;
{
        extern double dln$m();

        return (dln$m (x));
}
