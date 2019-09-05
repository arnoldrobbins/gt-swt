

            parsdt (2) --- parse a date in mm/dd/yy format           03/20/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function parsdt (str, i, month, day, year)
                 character str (ARB)
                 integer i, month, day, year
                 
                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Parsdt' examines the string passed to it in 'str', starting
                 at  position 'i' and attempts to interpret it as a Gregorian
                 date.  The string being examined is expected to be in any of
                 three formats:  a single integer, which is interpreted as  a
                 day  in  the  current  month  of the current year; a pair of
                 integers separated by a slash (/), which is interpreted as a
                 month of the current year followed  by  a  day  within  that
                 month;  or  three  integers  separated  by slashes, which is
                 interpreted in the obvious way.

                 If the string is found to be  a  valid  date  (both  syntac-
                 tically  and semantically), the arguments 'month', 'day' and
                 'year' are set appropriately, and  OK  is  returned  as  the
                 function  value.   Otherwise, the contents of 'month', 'day'
                 and 'year' are unpredictable and  ERR  is  returned  as  the
                 function  value.   In  all  cases,  the  string index 'i' is
                 advanced beyond the last character examined in the string.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 After skipping leading blanks and checking  the  first  non-
                 blank  character  to  be  sure it is a digit, 'parsdt' calls
                 'ctoi' to convert the string to  an  integer.   As  long  as
                 there  are  trailing  slashes,  'ctoi'  is called repeatedly
                 until a month, day and year have been  parsed.   If  at  any
                 point  a  trailing  slash is not encountered, 'parsdt' calls
                 'date' to retrieve the current date and parses the remaining
                 items from that string.


            _C_a_l_l_s

                 ctoi, date


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i, month, day, year


            _S_e_e _A_l_s_o

                 parstm (2)



            parsdt (2)                    - 1 -                    parsdt (2)


