

            cmp (1) --- string comparison                            01/16/83


            _U_s_a_g_e

                 cmp <string1> <relation> <string2>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cmp'  is  a  string comparison utility that is designed for
                 use in function calls  within  arithmetic  expressions.   It
                 compares  the  two strings given as arguments, and returns 1
                 if the specified relation holds, 0 otherwise.  The following
                 relations are supported (operators are the same as those  in
                 Ratfor, with some synonyms):

                      ==   equal to
                      =    equal to
                      <    less than
                      >    greater than
                      <=   less than or equal to
                      =<   less than or equal to
                      >=   greater than or equal to
                      =>   greater than or equal to
                      ~=   not equal to
                      <>   not equal to
                      ><   not equal to

                 Notice  that  if  the "greater than" symbol (">") is used in
                 the <relation> argument, the  argument  must  be  quoted  to
                 prevent the shell from interpreting it as an I/O redirector.


            _E_x_a_m_p_l_e_s

                 if [cmp [day] = friday]; echo T.G.I.F.; fi
                 cmp [response] ~= "yes"
                 cmp [term] ">=" [term_list[i]]


            _M_e_s_s_a_g_e_s

                 "Usage:  cmp ..."  for invalid arguments.


            _B_u_g_s

                 Redirection problem mentioned above.


            _S_e_e _A_l_s_o

                 case (1), eval (1), if (1), equal (2), strcmp (2)







            cmp (1)                       - 1 -                       cmp (1)


