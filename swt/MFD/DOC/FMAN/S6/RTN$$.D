

            rtn$$ (6) --- return to stack frame of call$$            01/06/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine rtn$$

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Rtn$$'  unwinds  the  stack  and  returns  to  the  routine
                 (usually 'call$$') indicated by 'rtlabel' in  the  Subsystem
                 common block.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Rtn$$'  first checks the Primos command level data flags to
                 see if the calling routine was DBG; if  so,  it  immediately
                 exits.   If it was not called by DBG, 'rtn$$' returns to the
                 routine  indicated  by  'rtlabel'  via  the  Primos  routine
                 PL1$NL.


            _C_a_l_l_s

                 Primos pl1$nl


            _S_e_e _A_l_s_o

                 call$$ (6)



























            rtn$$ (6)                     - 1 -                     rtn$$ (6)


