

            jdate (2) --- take month, day, and year and return day-of-year  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function jdate (month, day, year)
                 integer month, day, year

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Jdate'  is  used to determine the Julian date corresponding
                 to a given month, day,  and  year.   (For  example,  January
                 first  of  any  year  has Julian date 1; December 31st might
                 have Julian date 365 or 366, depending on whether the  given
                 year  is  a  leap  year or not.)  The function return is the
                 Julian date calculated.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Jdate' simply adds up the number  of  days  in  all  months
                 before  the month given, then adds the number of days given.
                 If the year specified is a leap year, February is  given  29
                 days instead of the usual 28.


            _S_e_e _A_l_s_o

                 date (1), wkday (2), date (2)





























            jdate (2)                     - 1 -                     jdate (2)


