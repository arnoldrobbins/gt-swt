/* abort --- cause the program to terminate, and dump core */
/*           generates a fault under unix, here just dies */

abort()
{
#ifdef notdef   /* i.e., we don't really want to do this */
        FILE *fp;

        if ((fp = fopen ("core", "w")) != NULL)
        {
                fprintf (fp, "This is a 'core' file.\n");
                fclose (fp);
        }
#endif
        exit (1);
        /* will work for both SWT and bare Primos */
}
