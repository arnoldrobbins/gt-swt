

            dacs$m (2) --- calculate double precision inverse cosine  04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longreal function dacs$m (x)
          |      longreal x

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      This  function  calculates  the  inverse cosine of an angle.
          |      The argument to the function is the cosine of the angle, and
          |      the function returns the measure of the angle,  in  radians.
          |      Arguments  to  the  function  must be in the closed interval
          |      [-1.0, 1.0].  The condition SWT_MATH_ERROR$ is signalled  if
          |      there  is  an argument error.  An on-unit can be established
          |      to deal with this error; the SWT  Math  Library  contains  a
          |      default  handler  named  'err$m' which the user may utilize.
          |      In the case of an error, the default return value is zero.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The function is implemented as a rational minimax approxima-
          |      tion on a modified argument value.  It is adapted  from  the
          |      algorithm   given  in  the  book  _S_o_f_t_w_a_r_e  _M_a_n_u_a_l  _f_o_r  _t_h_e
          |      _E_l_e_m_e_n_t_a_r_y _F_u_n_c_t_i_o_n_s by William Waite and William Cody,  Jr.
          |      (Prentice-Hall, 1980).


          | _C_a_l_l_s

          |      Primos signl$


          | _S_e_e _A_l_s_o

          |      acos$m (2), dcos$m (2), dsqt$m (2), err$m (2),
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e



















            dacs$m (2)                    - 1 -                    dacs$m (2)


