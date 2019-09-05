

            ctomn (2) --- translate ASCII control character to mnemonic  03/28/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ctomn (c, rep)
                 character c, rep (4)

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ctomn' is used to convert an unprintable ASCII character to
                 its  official  ASCII  mnemonic.   The  first argument is the
                 character to be converted; the second is a string to receive
                 the mnemonic.  The function return  is  the  length  of  the
                 string placed in the second argument.

                 If  the  character passed is printable, it is copied through
                 unchanged to the receiving string.   If  not,  its  two-  or
                 three-character  ASCII  mnemonic  (e.g.  NUL, SOH, etc.)  is
                 copied into the receiving string.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If the character is printable, it is placed in the receiving
                 string, which is then terminated with EOS.  If the character
                 is between 128 and 160, inclusive, or equals 255, its  value
                 is  used  to compute an index into a string table containing
                 the mnemonics.  The mnemonic thus selected  is  copied  into
                 the receiving string.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 rep


            _C_a_l_l_s

                 scopy


            _S_e_e _A_l_s_o

                 mntoc (2)













            ctomn (2)                     - 1 -                     ctomn (2)


