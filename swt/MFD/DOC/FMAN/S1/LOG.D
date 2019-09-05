

            log (1) --- make an entry in a personal log              02/14/82


            _U_s_a_g_e

                 log [ <log file> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Log'  is  used  to  make entries in one of a number of user
                 logs.  When used, 'log' appends the current date, time,  and
                 day-of-week to the specified log file and then appends to it
                 the   contents  of  standard  input  one,  up  to  the  next
                 occurrence of end-of-file.

                 If <log file> is present, it must be the name of a  file  in
                 the  user's  variables  storage directory; the named file is
                 used as the log file.  If absent, the file "u.log" is used.

                 'Log' is frequently used to make records suitable for use in
                 preparing end-of-the-month time sheets and project diaries.


            _E_x_a_m_p_l_e_s

                 log time_sheet
                 log projlog
                 log


            _F_i_l_e_s

                 =varsdir=/<log_file> for log file.


            _B_u_g_s

                 The restriction of having the log file reside  in  =varsdir=
                 could be considered a bug.





















            log (1)                       - 1 -                       log (1)


