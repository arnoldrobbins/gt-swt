/* atan2 --- return arc tangent of x / y */

double atan2 (x, y)
double x, y;
{
        extern double atan();
        double z;

        z = x / y;
        return (atan (z));
}
