/* sinh --- return hyperbolic sine of x */

double sinh (x)
double x;
{
        extern double dsnh$m();

        return (dsnh$m (x));
}
