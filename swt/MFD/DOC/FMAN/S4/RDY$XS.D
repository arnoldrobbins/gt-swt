

            rdy$xs (4) --- see if character waiting, and if so, fetch it  06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 logical function rdy$xs (char)
                 shortcall rdy$xs (4)

                 character char

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 The  function checks to see if a character has been typed at
                 the terminal but not yet input by software.  If no character
                 is waiting, the function returns  the  value  FALSE.   If  a
                 character  is  waiting,  then  the function returns TRUE and
                 'char' gets set to the waiting character.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).   The  function  switches  to  64R mode to do a
                 "SKS '704" (handled by  the  Primos  restricted  instruction
                 FIM).  If a value is waiting, it is fetched by a call to the
                 Primos routine T1IN.

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _C_a_l_l_s

                 Primos t1in


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 char


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 chkinp (2), fc (1)








            rdy$xs (4)                    - 1 -                    rdy$xs (4)


