

            t$init (6) --- initialize for a subroutine trace run     09/05/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine t$init


          | _F_u_n_c_t_i_o_n

          |      'T$init'  is  called at the beginning of the main program in
          |      Ratfor programs that  have  been  processed  with  the  "-p"
          |      (profiling)  option  of  'rp'.  It initializes the profiling
          |      common blocks with the number of routines in the program.

          |      'T$init' is inserted into the Fortran output as inline code,
          |      rather than being referenced  from  the  standard  Subsystem
          |      library.   As  such,  it  can  never be accessed by the user
          |      unless the "-p" option is specified (even  then,  it  should
          |      not  be  called  by  the user, since it has no effect on the
          |      profiling information).


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      A simple assignment statement initializes a variable in  the
          |      common  blocks  produced  by  'rp' and used by the profiling
          |      subroutines.


          | _S_e_e _A_l_s_o

          |      rp (1) t$clup (6),  t$entr  (6),  t$exit  (6),  t$time  (6),
          |      t$trac (6)



























            t$init (6)                    - 1 -                    t$init (6)


