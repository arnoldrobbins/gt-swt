

            plpcl (1) --- compile and load a PL/P program            08/27/84


          | _U_s_a_g_e

                 plpcl <program name> [<'ld' options>] [/ <'plpc' options>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Plpcl'  is  a  shell file that invokes the Primos PL/P com-
          |      piler and  the  Primos  segmented  loader.   If  'plpcl'  is
          |      invoked  with  no  <program name> argument, it automatically
          |      processes the last program edited, since it shares the shell
          |      variable 'f' with the shell program 'e'.  The  name  of  the
                 file  containing  the  program  to be compiled must end with
                 ".plp", although in <program name> it may be specified  with
                 or  without  the  ending  ".plp".   If  no  output  file  is
                 specified in the <'ld' options>, the output object file name
                 will be <program name> with no extension.

                 Concerning the options,  'plpc'  will  be  called  with  the
                 <'plpc'  options>  specified  on the command line; then 'ld'
                 will be called with the <'ld' options> specified.


            _E_x_a_m_p_l_e_s

                 plpcl myprog.plp
                 plpcl myprog subs.b subs2.b -l mylib
                 plpcl myprog / -xv -l mylist


            _M_e_s_s_a_g_e_s

                 "<program name>.plp:  cannot open"


            _B_u_g_s

                 An alternate binary file name cannot be specified.


            _S_e_e _A_l_s_o

          |      plpc (1), ld (1), bind (3)















            plpcl (1)                     - 1 -                     plpcl (1)


