

            plgcl (1) --- compile and load a PL/I subset G program   08/27/84


          | _U_s_a_g_e

                 plgcl <program name> [<'ld' options>] [/ <'plgc' options>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Plgcl'  is a shell file that invokes the Primos PL/I subset
          |      G compiler and the Primos segmented loader.  If  'plgcl'  is
          |      invoked  with  no  <program name> argument, it automatically
          |      processes the last program edited, since it shares the shell
          |      variable 'f' with the shell program 'e'.  The  name  of  the
                 file  containing  the  program  to be compiled must end with
                 ".plg", although in <program name> it may be specified  with
                 or  without  the  ending  ".plg".   If  no  output  file  is
                 specified in the <'ld' options>, the output object file name
                 will be <program name> with no extension.

                 Concerning the options,  'plgc'  will  be  called  with  the
                 <'plgc'  options>  specified  on the command line; then 'ld'
                 will be called with the <'ld' options> specified.


            _E_x_a_m_p_l_e_s

                 plgcl myprog.plg
                 plgcl myprog subs.b subs2.b -l mylib
                 plgcl myprog / -ok -l mylist


            _M_e_s_s_a_g_e_s

                 "<program name>.plg:  cannot open"


            _B_u_g_s

                 An alternate binary file name cannot be specified.


            _S_e_e _A_l_s_o

          |      plgc (1), ld (1), init$plg (2), bind (3)















            plgcl (1)                     - 1 -                     plgcl (1)


