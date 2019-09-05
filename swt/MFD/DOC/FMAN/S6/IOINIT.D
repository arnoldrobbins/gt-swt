

            ioinit (6) --- initialize Subsystem I/O areas            03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine ioinit

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ioinit'  reinitializes  certain  control  words in the Sub-
                 system's input/output common block.  At present, it is  used
                 solely for starting the Subsystem from scratch.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ioinit'  sets  the  erase character, kill character, repeat
                 character,  escape  character,  terminal  character   buffer
                 pointer,  Subsystem  newline  character,  kill response (the
                 string  that  gets  printed  when  a   kill   character   is
                 encountered),  terminal  attributes,  and terminal character
                 count.  In addition, it "opens" the user's terminal  on  the
                 file  descriptor  designated  by  the macro TTY and sets all
                 other file descriptors to "closed", and sets  the  Subsystem
                 printer  form and printer destination.  Finally, it sets all
                 entries in the standard port table to TTY.


            _C_a_l_l_s

                 ctoc


            _S_e_e _A_l_s_o

                 icomn$ (6)






















            ioinit (6)                    - 1 -                    ioinit (6)


