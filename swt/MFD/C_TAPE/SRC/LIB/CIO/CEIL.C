/* ceil --- return the smallest integer not less than x */

double ceil (x)
double x;
{
        extern double dint$m();

        if (x < 0.0)
                return (dint$m (x));
        else
                return (dint$m(x) + 1.0);
}
