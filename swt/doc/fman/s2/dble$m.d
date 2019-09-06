

            dble$m (2) --- create a longreal from a longint          04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longreal function dble$m (l)
          |      longint l

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      The  'dble$m'  function  implements  something  akin  to the
          |      Fortran 66 'dble' function, or the Fortran 77 'dreal'  func-
          |      tion.   It takes as an argument a 32 bit integer and returns
          |      a double precision floating point number of the same  value.
          |      This  function  should always be used when converting 32 bit
          |      integers to double precision real numbers because  the  code
          |      generated  by  some of the compilers will (potentially) lose
          |      up to 8 bits of mantissa precision.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The algorithm  involved  was  derived  from  known  register
          |      structure; see the source code for specifics.


          | _S_e_e _A_l_s_o

          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e





























            dble$m (2)                    - 1 -                    dble$m (2)


