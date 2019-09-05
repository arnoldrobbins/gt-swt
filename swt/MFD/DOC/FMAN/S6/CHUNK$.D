

            chunk$ (6) --- read one chunk of a SEG runfile           01/05/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function chunk$ (bp, seg, fd)
                 longint bp
                 integer seg, fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Chunk$' expects the segment directory to be open on 'fd' (a
                 Primos  file  descriptor).  It opens the file in the segment
                 directory at position 'seg + 2' and reads  2048  words  into
                 memory  at position pointed to by 'bp'.  The function return
                 is OK if the read was successful,  and  ERR  if  any  errors
                 occur.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Straightforward through calls to the Primos routines SGDR$$,
                 SRCH$$, and PRWF$$.


            _C_a_l_l_s

                 Primos sgdr$$, Primos srch$$, Primos prwf$$


            _S_e_e _A_l_s_o

                 ldseg$ (6), zmem$ (6)

























            chunk$ (6)                    - 1 -                    chunk$ (6)


