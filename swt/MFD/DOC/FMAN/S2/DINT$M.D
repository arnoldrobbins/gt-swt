

            dint$m (2) --- get integer part of an longreal           04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longreal function dint$m (x)
          |      longreal x

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      The  'dint$m'  function  implements the Fortran 'dint' func-
          |      tion.  That is, it takes  one  double  precision  value  and
          |      resets bits in the mantissa to remove any fractional part of
          |      the value.  The return value is a double precision real.

          |      The  'dint$m'  of  1.5 is 1.0, the 'dint$m' of -1.5 is -1.0,
          |      and the 'dint$m' of anything less than 1.0 and greater  than
          |      -1.0 is equal to zero.

          |      The 'dint$m' function has no single precision counterpart in
          |      the  SWT  Math  library.   The routine, as defined, does not
          |      recognize or signal any error conditions.  It is written  so
          |      as  to  work of both 550 and 750 style machines, despite the
          |      internal difference in register structure.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The algorithm involved was  developed  from  known  register
          |      structure; see the source code for specifics.


          | _S_e_e _A_l_s_o

          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e























            dint$m (2)                    - 1 -                    dint$m (2)


