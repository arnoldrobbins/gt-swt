

            pmacl (1) --- assemble and load a PMA program            08/27/84


          | _U_s_a_g_e

                 pmacl <program name> [<'ld' options>] [/ <'pmac' options>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Pmacl' is a shell file that invokes the Primos Macro Assem-
          |      bler and the Primos segmented loader.  If 'pmacl' is invoked
          |      with  no <program name> argument, it automatically processes
          |      the last program edited, since it shares the shell  variable
          |      'f'  with  the  shell  program  'e'.   The  name of the file
                 containing the program to be compiled must  end  with  ".s",
                 although  in  <program  name>  it  may  be specified with or
                 without the ending ".s".  If no output file is specified  in
                 the  <'ld'  options>,  the  output  object file name will be
                 <program name> with no extension.

                 Concerning the options,  'pmac'  will  be  called  with  the
                 <'pmac'  options>  specified  on the command line; then 'ld'
                 will be called with the <'ld' options> specified.


            _E_x_a_m_p_l_e_s

                 pmacl myprog.s
                 pmacl myprog subs.b subs2.b -l mylib
                 pmacl myprog / -x -l mylist


            _M_e_s_s_a_g_e_s

                 "<program name>.s:  cannot open"


            _B_u_g_s

                 An alternate binary file name cannot be specified.


            _S_e_e _A_l_s_o

          |      pmac (1), ld (1), bind (3)















            pmacl (1)                     - 1 -                     pmacl (1)


