

            icomn$ (6) --- initialize Subsystem common areas         03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine icomn$

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Icomn$'  is  used  to completely reinitialize all Subsystem
                 common areas.  At present, it is used only  by  the  program
                 'swt' on Subsystem entry.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Icomn$' initializes the Subsystem password, argument count,
                 command  interpreter  status flag, shell error code, command
                 input unit, user template  storage  area,  Subsystem  return
                 label,  and linked string control words, then calls 'ioinit'
                 to set up the input/output common blocks.


            _C_a_l_l_s

                 ioinit


            _S_e_e _A_l_s_o

                 ioinit (6)



























            icomn$ (6)                    - 1 -                    icomn$ (6)


