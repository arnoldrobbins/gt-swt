

            fdmlcl (1) --- compile and load a Fortran DML program    08/27/84


          | _U_s_a_g_e

                 fdmlcl <program name> [<'ld' options>] [/ <'fc' options>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Fdmlcl' is a shell file that invokes the Prime DBMS Fortran
                 DML  preprocessor,  the  Primos  Fortran 66 compiler and the
          |      Primos segmented loader.  If 'fdmlcl'  is  invoked  with  no
          |      <program name> argument, it automatically processes the last
          |      program  edited, since it shares the shell variable 'f' with
          |      the shell program 'e'.  The name of the file containing  the
                 program  to  be  compiled  must  end  with ".f", although in
                 <program name> it may be specified with or without the  end-
                 ing   ".f".    If   no  output  file  is  specified  in  the
                 <'ld' options>,  the  output  object  file  name   will   be
                 <program name> with no extension.

                 Concerning  the  options,  'fc'  will  be  called  with  the
                 <'fc' options> specified on the command line; then 'ld' will
                 be called with the <'ld' options> specified.


            _E_x_a_m_p_l_e_s

                 fdmlcl myprog.f
                 fdmlcl myprog subs.b subs2.b -l mylib
                 fdmlcl myprog / -ok -l mylist


            _M_e_s_s_a_g_e_s

                 "<program name>.f:  cannot open"


            _B_u_g_s

                 An alternate binary file name cannot be specified.


            _S_e_e _A_l_s_o

          |      fc (1), ld (1), bind (3)














            fdmlcl (1)                    - 1 -                    fdmlcl (1)


