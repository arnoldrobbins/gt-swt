/* sin --- return sine of x */

double sin (x)
double x;
{
        extern double dsin$m();

        return (dsin$m (x));
}
