

            mkfd$ (6) --- make a file descriptor from a Primos funit  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_des function mkfd$ (funit, mode)
                 integer funit, mode

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mkfd$'  allocates  a  Subsystem  file descriptor for a disk
                 file and initializes it so that it refers to the  file  open
                 on  the  Primos  funit number given as the argument 'funit'.
                 'Mode' must be READ,  WRITE,  or  READWRITE.   The  function
                 return  is a file descriptor if the allocation succeeds, ERR
                 otherwise.

                 'Mkfd$' is normally used to enable Subsystem I/O on  a  file
                 that  for  some  reason  has already been opened by a Primos
                 routine.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A Subsystem file descriptor is allocated from the  available
                 pool  (by a call to 'getfd$') and initialized as per 'open'.
                 The given I/O mode, file unit, and disk  device  status  are
                 associated with the descriptor.


            _C_a_l_l_s

                 getfd$, Primos break$


            _S_e_e _A_l_s_o

                 getfd$ (6), mapfd (2), open (2)




















            mkfd$ (6)                     - 1 -                     mkfd$ (6)


