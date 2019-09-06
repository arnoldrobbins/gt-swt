/* hypot --- Euclidean distance function */

double hypot (x, y)
double x, y;
{
        extern double sqrt ();
        double z1, z2, z3;

        /* we should be checking for overflow... */
        z1 = x * x;
        z2 = y * y;
        z3 = z1 + z2;

        return (sqrt (z3));
}
