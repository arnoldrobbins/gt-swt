

            iofl$ (6) --- initialize open file list                  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine iofl$ (state)
                 integer state (MAXFILESTATE)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Iofl$'  saves  the  Subsystem  and  Primos file descriptors
                 which correspond to closed files in 'state',  so  that  sub-
                 sequently opened files can be closed by 'cof$'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 For each Subsystem file descriptor, 'iofl$' examines the its
                 flag  word  to  determine  if it is closed.  For each closed
                 file, its descriptor is saved in 'state'.   After  the  last
                 closed  Subsystem  file descriptor entered into 'state', ERR
                 is entered into 'state' to mark the end of the list.

                 Next, for each Primos file  descriptor,  'iofl$'  calls  the
                 Primos  routine  PRWF$$  to  test whether or not the file is
                 open and valid.   For  each  valid  closed  file,  its  file
                 descriptor  is  entered  into 'state'.  After the last valid
                 closed Primos file  descriptor  has  been  entered,  ERR  is
                 entered into 'state' to mark the end of the list.


            _C_a_l_l_s

                 Primos prwf$$


            _S_e_e _A_l_s_o

                 cof$ (6)



















            iofl$ (6)                     - 1 -                     iofl$ (6)


