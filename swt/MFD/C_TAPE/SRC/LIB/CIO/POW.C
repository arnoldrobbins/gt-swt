/* pow --- return x to the y */

double pow (x, y)
double x, y;
{
        extern double powr$m();

        return (powr$m (x, y));
}
