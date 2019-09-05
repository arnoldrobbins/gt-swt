

            pause (1) --- suspend command interpretation             06/10/80


            _U_s_a_g_e

                 pause ([ for ] <interval> [ <units> ]  |  until <time>)


            _D_e_s_c_r_i_p_t_i_o_n

                 'Pause' causes a user's traffic with the system to cease for
                 a  fixed  interval  of  time  or until a specific wall clock
                 time.

                 In the first usage format, <interval> is the number of  time
                 units to pause, expressed as a positive decimal integer.  It
                 must  be  less than 32768.  <Units> specifies the time unit.
                 It may be:

                      "seconds"  for seconds,
                      "minutes"  for minutes,
                      "hours"    for hours,

                 or  omitted,   in   which   case   "seconds"   is   assumed.
                 Abbreviations  consisting  of  any  initial substring of the
                 above units are allowed.  The word "for" may be included  to
                 enhance  readability;  its  presence or absence is otherwise
                 insignificant.

                 In the second format, traffic will be  suspended  until  the
                 system  clock registers the time of day specified by <time>.
                 <time> may be expressed in almost any  common  format.   One
                 guideline should be observed, however:  a colon must be used
                 to separate hours from minutes and minutes from seconds.


            _E_x_a_m_p_l_e_s

                 pause 5 seconds
                 pause for 2 hours
                 pause until 3pm
                 pause until 18:45:30


            _M_e_s_s_a_g_e_s

          |      "Usage:  pause ..."  for invalid argument syntax.


            _S_e_e _A_l_s_o

                 sema (1), date (2), Primos sleep$









            pause (1)                     - 1 -                     pause (1)


