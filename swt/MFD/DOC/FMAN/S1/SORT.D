

            sort (1) --- sort ASCII-encoded records                  02/22/82


            _U_s_a_g_e

                 sort {-d | -r} { <pathname> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Sort'  is  a  rather straightforward program that sorts the
                 contents of the files named in its argument list and  writes
                 the  result  on its first standard output port.  By default,
                 lines are sorted in ascending order on the  basis  of  ASCII
                 collating  sequence, using the entire line as a key.  If the
                 "-d" option  is  specified,  dictionary  collating  sequence
                 (upper  and  lower  case  are  equivalent,  punctuation  and
                 special characters are ignored) is used.  If the "-r" option
                 is specified, lines are sorted in descending order.

                 If no pathname arguments are given, or if the  pathname  "-"
                 appears  as  an  argument,  standard  input  one is used for
                 input.  Thus, 'sort' may be used as a filter.

                 'Sort' uses a combination of 'quicksort' and  merge;  it  is
                 taken directly from _S_o_f_t_w_a_r_e _T_o_o_l_s.


            _E_x_a_m_p_l_e_s

                 lf -c | sort | cat -n
                 sort -d wordlist dictionary >new_dictionary
                 files .r$ | sort -r | print -n


            _F_i_l_e_s

                 =temp=/st$?* for sort temporary files


            _M_e_s_s_a_g_e_s

                 "<file>:  can't open" for unreadable files.
                 "<file>:  can't create" if temporary file can't be created.


            _S_e_e _A_l_s_o

                 _S_o_f_t_w_a_r_e _T_o_o_l_s












            sort (1)                      - 1 -                      sort (1)


