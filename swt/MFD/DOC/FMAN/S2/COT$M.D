

            cot$m (2) --- calculate cotangent                        04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longreal function cot$m (x)
          |      real x

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      This  function  calculates  the cotangent of the angle whose
          |      measure is given (in radians) as the argument to  the  func-
          |      tion.  The argument must have an absolute value greater than
          |      7.064835966E-9865  and  less than 13176794.0.  The condition
          |      SWT_MATH_ERROR$ is signalled if there is an argument  error.
          |      An  on-unit  can be established to deal with this error; the
          |      SWT Math Library contains a default  handler  named  'err$m'
          |      which  the  user may utilize.  If an error is signalled, the
          |      default function return is zero.

          |      This function is intended to serve  as  a  single  precision
          |      function although it returns a double precision result.  The
          |      function  has been coded so that any value returned will not
          |      overflow or underflow  a  single  precision  floating  point
          |      value.   The  double  precision register overlaps the single
          |      precision register so it is possible to declare and use this
          |      function as simply a "real" function.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The function is calculated based  on  a  minimax  polynomial
          |      approximation  over  a reduced argument.  It is adapted from
          |      the algorithm given in the  book  _S_o_f_t_w_a_r_e  _M_a_n_u_a_l  _f_o_r  _t_h_e
          |      _E_l_e_m_e_n_t_a_r_y  _F_u_n_c_t_i_o_n_s by William Waite and William Cody, Jr.
          |      (Prentice-Hall, 1980).


          | _C_a_l_l_s

          |      dint$p, Primos signl$


          | _S_e_e _A_l_s_o

          |      dcot$m (2), dint$p (2), err$m (2), tan$m (2),
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e











            cot$m (2)                     - 1 -                     cot$m (2)


