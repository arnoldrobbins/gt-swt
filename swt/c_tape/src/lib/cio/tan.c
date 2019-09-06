/* tan --- return tangent of x */

double tan (x)
double x;
{
        extern double dtan$m();

        return (dtan$m (x));
}
