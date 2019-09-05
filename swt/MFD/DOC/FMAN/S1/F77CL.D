

            f77cl (1) --- compile and load a Fortran 77 program      08/27/84


          | _U_s_a_g_e

                 f77cl <program name> [<'ld' options>] [/ <'f77c' options>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'F77cl'  is  a shell file that invokes the Primos Fortran 77
          |      and the Primos segmented loader.  If 'f77cl' is invoked with
          |      no <program name> argument, it automatically  processes  the
          |      last  program edited, since it shares the shell variable 'f'
          |      with the shell program 'e'.  The name of the file containing
                 the program to be compiled must end with ".f77", although in
                 <program name> it may be specified with or without the  end-
                 ing  ".f77".   If  no  output file is specified in the <'ld'
                 options>, the output object file name will be <program name>
                 with no extension.

                 Concerning the options,  'f77c'  will  be  called  with  the
                 <'f77c'  options>  specified  on the command line; then 'ld'
                 will be called with the <'ld' options> specified.


            _E_x_a_m_p_l_e_s

                 f77cl myprog.f77
                 f77cl myprog subs.b subs2.b -l mylib
                 f77cl myprog / -ok -l mylist


            _M_e_s_s_a_g_e_s

                 "<program name>.f77:  cannot open"


            _B_u_g_s

                 An alternate binary file name cannot be specified.


            _S_e_e _A_l_s_o

          |      f77c (1), ld (1), init$f (2), bind (3)















            f77cl (1)                     - 1 -                     f77cl (1)


