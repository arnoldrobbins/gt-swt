

            isph$ (2) --- determine if the caller is a phantom       09/18/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function isph$ (dummy)
          |      untyped dummy

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Isph$'  returns  YES  if the caller is a phantom user or NO
          |      otherwise.  The single argument 'dummy'  is  not  referenced
          |      and  exists  only because a function in FORTRAN 66 must have
          |      at least one argument.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Isph$' simply returns the value of the 'Isphantom' variable
          |      in the SWT common  block,  which  is  set  during  Subsystem
          |      initialization.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _S_e_e _A_l_s_o

          |      isph (1)



























            isph$ (2)                     - 1 -                     isph$ (2)


