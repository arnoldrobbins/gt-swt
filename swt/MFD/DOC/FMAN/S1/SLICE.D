

            slice (1) --- slice out a chunk of a file                03/20/80


            _U_s_a_g_e

                 slice (-i | -x) <start_pattern> [(-i | -x) <end_pattern>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Slice'  searches its standard input for a line matching the
                 pattern <start_pattern> and copies through to standard  out-
                 put  all  the lines from that one to the first line matching
                 the pattern <end_pattern>.

                 The  "-i"  and  "-x"  options  control  the  inclusion   and
                 exclusion (respectively) of the line matching the associated
                 pattern.

                 If  the  <end_pattern> and its associated inclusion flag are
                 missing, the copy operation continues until  end-of-file  is
                 encountered.

                 'Slice'   is  useful  for  pulling  out  chunks  from  well-
                 structured files, like the documentation files for the  Sub-
                 system  Reference  Manual.   For  example, "slice -i %.bu -x
                 %.sa" would copy the  "Bugs"  section  out  of  a  Reference
                 Manual entry.


            _E_x_a_m_p_l_e_s

                 slice.d> slice -i .bu -x .sa | fmt
                 slice -i % -x %-EOF$


            _M_e_s_s_a_g_e_s

                 "Usage:  slice ..."  for invalid argument syntax.


            _B_u_g_s

                 Doesn't handle lines longer than MAXLINE.


            _S_e_e _A_l_s_o

                 cto (1), find (1), match (2), makpat (2)












            slice (1)                     - 1 -                     slice (1)


