

            wkday (2) --- get day-of-week corresponding to month, day, year  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function wkday (month, day, year)
                 integer month, day, year

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Wkday'  is used to return the day-of-the-week corresponding
                 to a given date.  The three arguments completely specify the
                 date:  the month (1-12), day (1-28, 29, 30, or 31), and year
                 (e.g.  1980).  The function return is the ordinal number  of
                 the day-of-the-week (1 == Sunday, 7 == Saturday).


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Zeller's Congruence.


            _S_e_e _A_l_s_o

                 date (2), day (1)

































            wkday (2)                     - 1 -                     wkday (2)


