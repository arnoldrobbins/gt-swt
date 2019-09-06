/* atan --- return arc tangent of x */

double atan (x)
double x;
{
        extern double datn$m();

        return (datn$m (x));
}
