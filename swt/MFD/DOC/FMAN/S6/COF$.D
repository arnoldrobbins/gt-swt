

            cof$ (6) --- close files opened by the last user program  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine cof$ (state)
                 integer state (MAXFILESTATE)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 When  called,  'cof$' closes all open files that were opened
                 after the last call to  'iofl$'.   'Cof$'  also  resets  the
                 terminal  input  buffer  pointer  and character count in the
                 Subsystem common block.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Cof$' checks the flag word of each of the file  descriptors
                 in  'state'  up to the ERR marker.  If the file is currently
                 open, 'cof$' calls 'close' to close it.

                 Next, 'cof$' skips the ERR  marker,  and  calls  the  Primos
                 routine SRCH$$ to close all of the Primos files indicated by
                 the second list in 'state' (up to the next ERR marker).

                 Lastly, 'cof$' resets the terminal input buffer pointer to 1
                 and the terminal buffer character count to 0.


            _C_a_l_l_s

                 close, Primos srch$$


            _S_e_e _A_l_s_o

                 iofl$ (6), close (2), open (2)




















            cof$ (6)                      - 1 -                      cof$ (6)


