

            date (2) --- return time, date and other system information  02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine date (item, str)
                 integer item
                 character str (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Date'  is used to return several interesting pieces of data
                 that Primos keeps for the user.  The  first  argument  is  a
                 switch  to  select the data returned; the second is a string
                 for receiving the data.  The following values of  the  first
                 argument are defined:

                     SYS_DATE     1  date, in format mm/dd/yy
                     SYS_TIME     2  time, in format hh:mm:ss
                     SYS_USERID   3  user's login name
                     SYS_PIDSTR   4  user's three digit process id
                     SYS_DAY      5  day  of the week (e.g.  "monday", "tues-
                                     day", etc.)
                     SYS_PID      6  process id as a binary  integer  in  str
                                     (1)
                     SYS_LDATE    7  name of day, name of month, day, year
                     SYS_MINUTES  8  number  of  minutes past midnight in str
                                     (1..2)
                     SYS_SECONDS  9  number of seconds past midnight  in  str
                                     (1..2)
                     SYS_MSEC    10  number  of milliseconds past midnight in
                                     str (1..2)

                 If the first argument is not one of these values,  an  empty
                 string is returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Date'  calls the Primos routine TIMDAT to fetch time, date,
                 process id, and login name information.  This information is
                 then reformatted as needed.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 Primos timdat, encode (2), mapup (2), ptoc (2), wkday (2)






            date (2)                      - 1 -                      date (2)


