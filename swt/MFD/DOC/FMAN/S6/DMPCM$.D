

            dmpcm$ (6) --- dump Subsystem common areas               02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine dmpcm$ (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dmpcm$'  outputs  the  contents  of  the Subsystem's common
                 blocks in a printable format.   Unprintable  characters  are
                 mapped  into  a mnemonic format, and output is appropriately
                 titled.

                 'Fd' is the file descriptor of the file  unit  which  should
                 receive the information.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  common  area values which may be unprintable are mapped
                 into mnemonic strings  by  calls  to  the  routine  'ctomn'.
                 Then,  the  value  of  each  variable  in the common area is
                 printed, with the appropriate headings.


            _C_a_l_l_s

                 ctomn, print


            _S_e_e _A_l_s_o

                 dump (1)























            dmpcm$ (6)                    - 1 -                    dmpcm$ (6)


