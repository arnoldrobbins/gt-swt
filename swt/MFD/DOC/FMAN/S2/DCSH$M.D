

            dcsh$m (2) --- calculate double precision hyperbolic cosine  04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longreal function dcsh$m (x)
          |      longreal x

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      This   routine  calculates  the  hyperbolic  cosine  of  its
          |      argument, defined as cosh(x) = [exp(x)  +  exp(-x)]/2.   The
          |      absolute   value   of   the   argument  must  be  less  than
          |      22623.630826296.  The condition SWT_MATH_ERROR$ is signalled
          |      if  there  is  an  argument  error.   An  on-unit   can   be
          |      established  to  deal  with this error; the SWT Math Library
          |      contains a default handler named 'err$m' which the user  may
          |      utilize.   If  an  error  is signalled, the default function
          |      value is zero.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Adapted from the algorithm given in the book _S_o_f_t_w_a_r_e _M_a_n_u_a_l
          |      _f_o_r _t_h_e _E_l_e_m_e_n_t_a_r_y _F_u_n_c_t_i_o_n_s by William  Waite  and  William
          |      Cody, Jr.  (Prentice-Hall, 1980).


          | _C_a_l_l_s

          |      dexp$m, Primos signl$


          | _S_e_e _A_l_s_o

          |      cosh$m (2), dexp$m (2), dsnh$m (2), err$m (2),
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e





















            dcsh$m (2)                    - 1 -                    dcsh$m (2)


