/* sleep --- sleep for the given number of seconds */

sleep (amount)
unsigned amount;
{
        long l_amount;

        l_amount = amount * 1000;

        sleep$ (l_amount);   /* primos routine -- takes milliseconds */
}
