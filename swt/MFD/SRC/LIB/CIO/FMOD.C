/* fmod --- do floating modulus */

double fmod (x, y)
double x, y;
{
        extern double dint$m();
        extern double fabs();
        double f;
        int flag = 0;

        if (y == 0.0)
                return (x);

        flag = (x < 0.0);
        x = fabs (x);
        y = fabs (y);
        f = x - y * dint$m (x / y);
        return (flag ? -f : f);
}
