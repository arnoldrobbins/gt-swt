/* exp --- return e to the x */

double exp (x)
double x;
{
        extern double dexp$m();

        return (dexp$m (x));
}
