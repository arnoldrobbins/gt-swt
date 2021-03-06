

            cdmlcl (1) --- compile and load a Cobol DML program      08/27/84


          | _U_s_a_g_e

                 cdmlcl <program name> [<'ld' options>] [/ <'cobc' options>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cdmlcl'  is  a shell file that invokes the Prime DBMS Cobol
                 DML preprocessor, the Primos Cobol compiler and  the  Primos
          |      segmented  loader.   If 'cdmlcl' is invoked with no <program
          |      name> argument, it automatically processes the last  program
          |      edited,  since  it  shares  the  shell variable 'f' with the
          |      shell program 'e'.  The name  of  the  file  containing  the
                 program  to  be  compiled  must end with ".cob", although in
                 <program name> it may be specified with or without the  end-
                 ing  ".cob".   If  no  output file is specified in the <'ld'
                 options>, the output object file name will be <program name>
                 with no extension.

                 Concerning the options,  'cobc'  will  be  called  with  the
                 <'cobc'  options>  specified  on the command line; then 'ld'
                 will be called with the <'ld' options> specified.


            _E_x_a_m_p_l_e_s

                 cdmlcl myprog.cob
                 cdmlcl myprog subs.b subs2.b -l mylib
                 cdmlcl myprog / -ok -l mylist


            _M_e_s_s_a_g_e_s

                 "<program name>.cob:  cannot open"


            _B_u_g_s

                 An alternate binary file name cannot be specified.


            _S_e_e _A_l_s_o

          |      cdmlc (1), cobc (1), ld (1), bind (3)














            cdmlcl (1)                    - 1 -                    cdmlcl (1)


