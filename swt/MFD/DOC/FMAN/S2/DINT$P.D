

            dint$p (2) --- get integer part of a longreal (PMA only)  04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      DFLD  VALUE
          |      EXT   DINT$P
          |      JSXB  DINT$P
          |      DFST  IVALUE

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      The  'dint$p'  function  implements the Fortran 'dint' func-
          |      tion.  It is part of the SWT Math Library  'dint$m'  routine
          |      and is a special shortcall entrance that can only be used by
          |      PMA  code.   It  takes one double precision value and resets
          |      bits in the mantissa to remove any fractional  part  of  the
          |      value.  The return value is a double precision real.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The  algorithm  involved  was  developed from known register
          |      structure; see the source code for specifics.


          | _S_e_e _A_l_s_o

          |      dint$m (2),
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e




























            dint$p (2)                    - 1 -                    dint$p (2)


