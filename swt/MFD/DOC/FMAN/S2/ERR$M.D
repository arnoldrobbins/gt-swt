

            err$m (2) --- common error condition handler for math routines  04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine err$m (ptr_to_cfh)
          |      pointer ptr_to_cfh

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      The  'err$m'  procedure is provided as a default handler for
          |      the SWT_MATH_ERROR$ condition.  It takes a single  argument,
          |      a  2 word pointer as defined by the condition mechanism, and
          |      prints  information  about  the  routine  and  values  which
          |      signalled the fault.  All output from the 'err$m' routine is
          |      sent  to  ERROUT.  Included in the output is the name of the
          |      faulting routine,  the  location  from  which  the  faulting
          |      routine  was called, the value of the argument involved, and
          |      the default return value to be used.

          |      The Primos MKON$F routine can be used to set up this on-unit
          |      handler in Ratfor  and  Fortran  66  programs.   The  Primos
          |      subroutine  MKON$P  can  be  used  in  Fortran  77  and PL/P
          |      programs.

          |      The user may wish to copy and modify the source code for the
          |      'err$m' procedure so as to provide a more specific  form  of
          |      error  handling.   If  this  is done, it would probably be a
          |      good idea to rename the user's version  to  something  other
          |      than 'err$m.'


          | _C_a_l_l_s

          |      print


          | _S_e_e _A_l_s_o

          |      Primos mkon$f, Primos mkon$p, Primos signl$,
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e

















            err$m (2)                     - 1 -                     err$m (2)


