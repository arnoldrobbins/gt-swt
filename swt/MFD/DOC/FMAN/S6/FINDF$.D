

            findf$ (6) --- see if file exists in current directory   02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function findf$ (file)
                 packedchar file (16)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Findf$' is an internal routine used to verify the existence
                 of a file.  The argument is a packed, blank-padded character
                 string (such as that returned by 'getto') that is 32 charac-
                 ters  in length.  'Findf$' returns YES if the file exists in
                 the current directory, NO otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Findf$' calls the Primos routine SRCH$$ with the key  KEXST
                 to determine if the named file exists.


            _C_a_l_l_s

                 Primos srch$$


            _S_e_e _A_l_s_o

                 getto (2), file (1)



























            findf$ (6)                    - 1 -                    findf$ (6)


