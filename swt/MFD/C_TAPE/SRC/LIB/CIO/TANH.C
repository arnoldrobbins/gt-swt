/* tanh --- return hyperbolic tangent of x */

double tanh (x)
double x;
{
        extern double dtnh$m();

        return (dtnh$m (x));
}
