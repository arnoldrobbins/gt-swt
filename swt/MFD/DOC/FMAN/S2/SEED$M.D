

            seed$m (2) --- set the seed for the rand$m random number generator  04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine seed$m (u)
          |      untyped u

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      The  'seed$m'  procedure  is used to reset the pseudo-random
          |      number generator to a known state.  It is called with any  4
          |      byte  value which is not equal to 32 bits of zero.  The seed
          |      can therefore be  4  characters,  a  long  pointer,  a  long
          |      integer,  or  a  real  number.  If the input is identical to
          |      zero then the SWT_MATH_ERROR$ condition is  signalled.   The
          |      condition  SWT_MATH_ERROR$  is  signalled  if  there  is  an
          |      argument error.  An on-unit can be established to deal  with
          |      this  error; the SWT Math Library contains a default handler
          |      named 'err$m' which the user may utilize.  'Seed$m' does not
          |      return a value.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Based on the structure of  the  'rand$m'  routine;  see  the
          |      source for specific details.


          | _C_a_l_l_s

          |      Primos signl$


          | _S_e_e _A_l_s_o

          |      err$m (2), rand$m (2),
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e




















            seed$m (2)                    - 1 -                    seed$m (2)


