

            quote (1) --- enquote strings from standard input        02/22/82


            _U_s_a_g_e

                 quote


            _D_e_s_c_r_i_p_t_i_o_n

                 'Quote'  supplies one layer of quotes around strings present
                 on its standard input.  It is useful in function  calls,  to
                 prevent   premature   evaluation  of  text  by  the  command
                 interpreter.

                 For example, suppose the string

                      "# [a-d]"

                 were specified as an argument in the invocation of a command
                 file which, in turn, passed the string  as  an  argument  to
                 another  program  or  command  file.  The first command file
                 might access the string using the 'arg' command in  a  func-
                 tion call:

                      [arg 1]

                 However,  to  prevent  the  meta-characters "#", "[" and "]"
                 from being interpreted by the shell after the evaluation  of
                 the  function,  the  following  function call should be used
                 instead:

                      [arg 1 | quote]

                 The string will then be quoted before being substituted back
                 into the command line containing the function call, and  the
                 meta-characters will not be evaluated.

                 The result of a function call is quoted automatically by the
                 shell  if  the  variable  '_quote_opt'  contains  the string
                 "YES".  This, however, is not the default setting.


            _E_x_a_m_p_l_e_s

                 to ics002 [args | quote]
                 echo [arg 1 | quote] >request_file


            _B_u_g_s

                 Depends on having both ' and " available as quoting  charac-
                 ters.

                 Is  probably  too  smart for general application, but under-
                 stands the shell's quoting requirements quite well.





            quote (1)                     - 1 -                     quote (1)




            quote (1) --- enquote strings from standard input        02/22/82


            _S_e_e _A_l_s_o

                 sh (1),  arg  (1),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s
                 _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r






















































            quote (1)                     - 2 -                     quote (1)


