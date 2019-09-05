/* cos --- return cosine of x */

double cos (x)
double x;
{
        extern double dcos$m();

        return (dcos$m (x));
}
