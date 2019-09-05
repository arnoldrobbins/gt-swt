

            unrot (1) --- 'un-rotate' output produced by kwic        02/22/82


            _U_s_a_g_e

                 unrot [ -w <width> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Unrot' processes the "rotated" output of 'kwic' to generate
                 a  key-word-in-context  index.  It reads lines from standard
                 input one and writes the index on standard output one.

                 The length of the output lines may  be  specified  with  the
                 "-w <width>"   argument  sequence.   The  maximum  width  is
                 currently 137 characters.  If no width is specified,  65  is
                 assumed.


            _E_x_a_m_p_l_e_s

                 definitions> kwic | sort | unrot >index


            _M_e_s_s_a_g_e_s

                 "Usage:  unrot ..."  for invalid argument syntax.


            _S_e_e _A_l_s_o

                 kwic (1), sort (1), uniq (1)




























            unrot (1)                     - 1 -                     unrot (1)


