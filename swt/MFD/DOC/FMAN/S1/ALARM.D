

            alarm (1) --- digital alarm clock for CRTs               01/16/83


            _U_s_a_g_e

                 alarm ([ in ] <interval> [ <units> ]  |  at <time>)


            _D_e_s_c_r_i_p_t_i_o_n

                 'Alarm'  works like an alarm clock, allowing you to set when
                 the alarm goes off.  It displays the  alarm  set  time,  and
                 then  displays  the  current  time  in "hh:mm:ss" similar to
                 'clock'.  When the alarm time is reached, 'alarm' sounds the
                 terminal bell every second.

                 In the first usage format, <interval> is the number of  time
                 units  before  the  alarm  sounds,  expressed  as a positive
                 decimal integer.  It  must  be  less  than  32768.   <Units>
                 specifies the time unit.  It may be:

                      "seconds"  for seconds,
                      "minutes"  for minutes,
                      "hours"    for hours,

                 or   omitted,   in   which   case   "seconds"   is  assumed.
                 Abbreviations consisting of any  initial  substring  of  the
                 above  units  are allowed.  The word "in" may be included to
                 enhance readability; its presence or  absence  is  otherwise
                 insignificant.

                 In  the  second format, the alarm will occur when the system
                 clock registers the time of day specified by <time>.  <Time>
                 may be expressed in almost any common format.  One guideline
                 should be observed,  however:   a  colon  must  be  used  to
                 separate hours from minutes and minutes from seconds.

                 'Alarm' is terminated by typing control-P or by pressing the
                 BREAK key.


            _E_x_a_m_p_l_e_s

                 alarm
                 alarm in 5 seconds
                 alarm at 12:50pm
                 alarm at 14:55:55


            _M_e_s_s_a_g_e_s

                 "Usage:  alarm ..."  for invalid argument syntax.


            _B_u_g_s

                 Works only on CRT terminals.




            alarm (1)                     - 1 -                     alarm (1)




            alarm (1) --- digital alarm clock for CRTs               01/16/83


            _S_e_e _A_l_s_o

                 clock (1), date (1), day (1), pause (1), time (1), date (2)























































            alarm (1)                     - 2 -                     alarm (1)


