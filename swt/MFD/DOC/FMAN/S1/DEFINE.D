

            define (1) --- define expander                           08/27/84


          | _U_s_a_g_e

          |      define [-(f | m)] {<input_file>}


            _D_e_s_c_r_i_p_t_i_o_n

                 'Define'  is  a  text  substitution facility used to replace
                 defined identifiers by their  definitions.   'Define'  takes
                 the file(s) specified in the argument list, processes dddeeefffiiinnneee
                 statements and uuunnndddeeefffiiinnneee statements, and places the output on
                 its  standard  output file.  'Define' also processes iiinnncccllluuudddeee
                 statements.  For more information  on  dddeeefffiiinnneee  and  uuunnndddeeefffiiinnneee
                 statements see the _R_a_t_f_o_r _P_r_o_g_r_a_m_m_e_r_'_s _G_u_i_d_e.

                 In  addition  to  the  way  that Ratfor handles the 'define'
                 statement, this processor will allow  the  user  to  prevent
                 premature  evaluation  of  a given string by enclosing it in
                 brackets, similar  to  'macro'  (please  see  the  Reference
                 Manual entry for the 'macro' command).

                 The following options are available:

          |           -f   Suppress    automatic    inclusion   of   standard
          |                definitions  file.   Macro  definitions  for   the
                           manifest  constants  used throughout the Subsystem
                           reside in the file "=incl=/swt_def.r.i".  'Define'
                           will  process  these  definitions   automatically,
                           unless the "-f" option is specified.

          |           -m   Map  all  identifiers  to  lower  case.  When this
                           option is selected, 'define' considers  the  upper
                           case letters equivalent to the corresponding lower
                           case letters, except inside quoted strings.

                 The  remainder  of  the  command line is used to specify the
                 names of the input file(s).  If no input file is  specified,
                 'define' will expect input from standard input.  Output will
                 be sent to standard output.


            _E_x_a_m_p_l_e_s

                 define file1.r
                 file> define -f
                 define -m file1 file2 file3


            _F_i_l_e_s

                 =incl=/swt_def.r.i for standard Subsystem macro definitions


            _M_e_s_s_a_g_e_s

                 "missing left paren in define"


            define (1)                    - 1 -                    define (1)




            define (1) --- define expander                           08/27/84


                 "non-alphanumeric name in define"
                 "missing right paren in define"
                 "missing parameter in definition"
                      (two commas in a row)
                 "non-numeric parameter not allowed"
                 "too many parameters"
                      (more than 32 parameters)
                 "missing comma in parameter list"
                 "missing comma in parameter list"
                      (no  comma  between  the parameter list or the name and
                 the definition)
                 "invalid file name in include"
                 "includes nested too deeply"
                      (more than five levels deep)
                 "can't open include file"
                 "definition too long"
                      (more then 400 characters long)
                 "missing right paren after definition"
                 "missing left paren after undefine"
                 "non-alphanumeric name in undefine"
                 "missing right paren after undefine"
                 "line too long"
                 "unexpected EOF"


            _S_e_e _A_l_s_o

                 macro (1), rp (1), _R_a_t_f_o_r _P_r_o_g_r_a_m_m_e_r_'_s _G_u_i_d_e






























            define (1)                    - 2 -                    define (1)


