

            cal (3) --- print a calendar on standard output          01/13/83


            _U_s_a_g_e

                 cal [ <month> ] [ <year> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cal'  prints a Gregorian calendar for any month or any year
                 of the user's choice.  When  invoked  without  arguments,  a
                 calendar  for  the  current  month  of  the  current year is
                 printed in the following format:
                           
                             May         1980
                           
                           Su Mo Tu We Th Fr Sa
                                        1  2  3
                            4  5  6  7  8  9 10
                           11 12 13 14 15 16 17
                           18 19 20 21 22 23 24
                           25 26 27 28 29 30 31
                           
                           
                 In addition, either the name of a month, or a year, or  both
                 may  be specified on the command line to select the calendar
                 to be printed.  If a month name is given without a  year,  a
                 calendar for that month in the current year is produced.  If
                 a year is given without the name of a month, then a calendar
                 for the entire year is printed.

                 'Cal'  will  accept  any unique initial abbreviation for the
                 name of a month.  Also, if  a  year  between  0  and  99  is
                 specified, 'cal' assumes the 20th century.


            _E_x_a_m_p_l_e_s

                 cal
                 cal october
                 cal 1980 | col -c 3 -w 20 -l 11 | pr
                 cal 1981 | block -w 132 >/dev/lps


            _M_e_s_s_a_g_e_s

                 "Usage:  cal ..."  for invalid argument syntax.


            _B_u_g_s

                 Can't produce calendars for other than the 20th century.


            _S_e_e _A_l_s_o

                 date (1), day (1)



            cal (3)                       - 1 -                       cal (3)


