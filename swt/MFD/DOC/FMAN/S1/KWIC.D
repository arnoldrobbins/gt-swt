

            kwic (1) --- produce key-word-in-context index           02/22/82


            _U_s_a_g_e

                 kwic [ -d [ <discard list> ] ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Kwic'  is  the  key-word-in-context  program  from _S_o_f_t_w_a_r_e
                 _T_o_o_l_s.  It is a filter, taking lines of text from its  stan-
                 dard  input, rotating them so that each word in the sentence
                 appears at the beginning of a line, and marking the original
                 position of the NEWLINE with a "fold character" (currently a
                 grave accent with zero parity bit).

                 If the "-d" option is used, 'kwic' will read a  sorted  list
                 of  words, either from the file specified by <discard list>,
                 or from standard input two if the file name is omitted.   If
                 the  first  word in a rotated line is found in the list, the
                 line will not be  written  out.   The  discard  file  should
                 contain one word per line, in lower case.  (Before searching
                 the list, 'kwic' converts the search key to lower case.)

                 The  output from 'kwic' is typically sorted with 'sort' then
                 "un-rotated" with 'unrot' to produce the finished  key-word-
                 in-context index.


            _E_x_a_m_p_l_e_s

                 text> kwic | sort | unrot >index
                 headers> kwic -d discard_list >headers.k
                 headers> discard_list> kwic -d >headers.k


            _M_e_s_s_a_g_e_s

                 "<file>:  cannot open" if discard list cannot be read.
                 "<word>:  discard list too long" if there are too many words
                      in the discard list.


            _S_e_e _A_l_s_o

                 sort (1), unrot (1), _S_o_f_t_w_a_r_e _T_o_o_l_s














            kwic (1)                      - 1 -                      kwic (1)


