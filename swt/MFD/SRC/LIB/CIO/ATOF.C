/* atof --- convert character to double precision floating */

double atof (str)
char *str;
{
        int i = 1;
        double ctod ();

        return (ctod (str, i));
}
