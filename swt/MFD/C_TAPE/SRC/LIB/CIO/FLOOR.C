/* floor --- return the largest integer not greater than x */

double floor (x)
double x;
{
        extern double dint$m();

        if (x < 0.0)
                return (dint$m(x) - 1.0);
        else
                return (dint$m (x));
}
