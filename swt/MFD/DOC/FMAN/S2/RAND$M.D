

            rand$m (2) --- generate a random number                  04/27/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      longreal function rand$m (l)
          |      longint l

          |      Library: vswtmath (Subsystem mathematical library)


          | _F_u_n_c_t_i_o_n

          |      The  'rand$m'  function  returns a double precision floating
          |      value in the open interval (0.0, 1.0).  The argument to  the
          |      function is set to a 32 bit integer in the range (0, 2**31 -
          |      1).   The  generator is a linear congruential generator with
          |      multiplier 764261123.  The values returned seem to  be  very
          |      well distributed, both from the standpoint of spectral tests
          |      and lattice tests.

          |      The  'rand$m'  routine does not detect or signal any errors.
          |      The first time the  'rand$m'  function  is  called,  if  the
          |      generator   has  not  been  initialized  with  the  'seed$m'
          |      procedure, a seed is derived based on the  current  time  of
          |      day  and  cpu  utilization.   This  seed  is returned in the
          |      integer argument variable.

          |      This function can  serve  as  a  single  precision  function
          |      although it returns a double precision result.  The function
          |      has  been coded so that any value returned will not overflow
          |      or underflow a single precision floating point  value.   The
          |      double  precision  register  overlaps  the  single precision
          |      register so it is possible to declare and use this  function
          |      as simply a "real" function.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Derived from information presented in "A Statistical Evalua-
          |      tion of Multiplicative Congruential Random Number Generators
          |      with  Modulus  2^32  -1"  by George S.  Fishman and Louis R.
          |      Moore,  in  the  Journal   of   the   American   Statistical
          |      Association, volume 77, number 377, March 1982.


          | _C_a_l_l_s

          |      dble$m, Primos timdat


          | _S_e_e _A_l_s_o

          |      dble$m (2), seed$m (2),
          |      _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e






            rand$m (2)                    - 1 -                    rand$m (2)


