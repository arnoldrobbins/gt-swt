

            st_profile (1) --- statement-level profile               03/25/82


            _U_s_a_g_e

                 st_profile  [ <count_file> ]  <source_code_file>


            _D_e_s_c_r_i_p_t_i_o_n

                 'St_profile'  is  used  to convert the profiling information
                 generated by a Ratfor program processed with the "-c" option
                 into a readable report.  The optional <count_file>  argument
                 is the name of a statement_level profile data file generated
                 by  a  profiled  program;  if  omitted,  the default name of
                 "_st_profile" is assumed.  The  <source_code_file>  argument
                 is  the  name  of the file containing the Ratfor source code
                 for the program being profiled.


            _E_x_a_m_p_l_e_s

                 st_profile rp.r
                 st_profile guide_profile fmt.r


            _F_i_l_e_s

                 _st_profile is the default <count_file>.


            _M_e_s_s_a_g_e_s

                 "Usage:  st_profile ..."  if no arguments given.
                 "can't open" if files are inaccessible.


            _B_u_g_s

                 See Reference Manual entry for 'rp'.

                 Seems to leave out the last line of source code.


            _S_e_e _A_l_s_o

                 rp (1), profile (1), c$init (6), c$incr (6), c$end (6)














            st_profile (1)                - 1 -                st_profile (1)


