

            powr$m (2) --- calculate a longreal raised to a longreal power  04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longreal function powr$m (x, y)
          |      longreal x, y

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      The  'powr$m'  function raises a double precision real value
          |      to a double precision real power.  The  function  return  is
          |      also  double  precision.   It  is  the  same  as the Fortran
          |      statement "x**y".

          |      The function is coded so as to adhere to ANSI Fortran  stan-
          |      dards which do not allow raising negative values to a float-
          |      ing point power, and which do not allow zero to be raised to
          |      a zero or negative power.  Other inputs may trigger an error
          |      if  the  result of the calculation would result in overflow.
          |      The condition SWT_MATH_ERROR$ is signalled if  there  is  an
          |      argument  error.  An on-unit can be established to deal with
          |      this error; the SWT Math Library contains a default  handler
          |      named 'err$m' which the user may utilize.

          |      There   are  four  cases  where  this  function  may  signal
          |      SWT_MATH_ERROR$.  If an attempt is made to raise a  negative
          |      value  to  a  non-zero  power, then the default return value
          |      will be the absolute value of that quantity  raised  to  the
          |      given  power.  If an attempt is made to raise zero to a zero
          |      or negative power, the  default  return  is  zero.   If  the
          |      result  would  overflow then the default return value is the
          |      largest double precision quantity that can  be  represented.
          |      If  the  result would cause underflow, the default return is
          |      the smallest positive value which can be represented on  the
          |      machine.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Adapted from the algorithm given in the book _S_o_f_t_w_a_r_e _M_a_n_u_a_l
          |      _f_o_r  _t_h_e  _E_l_e_m_e_n_t_a_r_y  _F_u_n_c_t_i_o_n_s by William Waite and William
          |      Cody, Jr.  (Prentice-Hall, 1980).


          | _C_a_l_l_s

          |      Primos signl$


          | _S_e_e _A_l_s_o

          |      err$m (2),
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e




            powr$m (2)                    - 1 -                    powr$m (2)


