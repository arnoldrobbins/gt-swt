

            uniq (1) --- eliminate successive identical lines        02/22/82


            _U_s_a_g_e

                 uniq [-n]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Uniq'  is  used  to strip adjacent duplicate lines from its
                 standard input.  The resulting text is  copied  to  standard
                 output.  'Uniq' is usually used to eliminate redundant lines
                 from a sorted file.

                 If the "-n" option is specified, 'uniq' counts the number of
                 occurrences  of  each  line.   The  count  is  placed  right
                 justified in the first five columns of the output,  suitable
                 for  sorting  or further manipulation with 'change', 'find',
                 or 'field'.


            _E_x_a_m_p_l_e_s

                 words> sort | uniq -n


            _M_e_s_s_a_g_e_s

                 "Usage:  uniq ..."  for invalid argument syntax.


            _B_u_g_s

                 Does not handle lines of length greater than MAXLINE.


            _S_e_e _A_l_s_o

                 sort (1), speling (1)





















            uniq (1)                      - 1 -                      uniq (1)


