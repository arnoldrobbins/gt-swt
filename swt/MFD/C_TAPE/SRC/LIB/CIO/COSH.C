/* cosh --- return hyperbolic cosine of x */

double cosh (x)
double x;
{
        extern double dcsh$m();

        return (dcsh$m (x));
}
