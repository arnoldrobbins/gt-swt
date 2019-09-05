

            if (1) --- conditional statement for Shell files         03/20/80


            _U_s_a_g_e

                 if <value>
                    then
                       { <command> }
                    else
                       { <command> }
                 fi


            _D_e_s_c_r_i_p_t_i_o_n

                 'If'  allows  users of the Shell's programming facilities to
                 execute commands conditionally, after  the  fashion  of  the
                 Algol 68 conditional clause.

                 The <value> after the if command may be any string; if it is
                 zero,  empty,  or  missing  altogether, it is interpreted as
                 false; otherwise, it is interpreted as true.  If <value>  is
                 true,  then  the  commands  after  the  keyword  'then'  are
                 executed; otherwise, the commands after the  keyword  'else'
                 are  executed.  In either alternative, any commands (includ-
                 ing nested if commands) may be used.

                 The keyword 'then' is optional.  The keyword 'else' and  its
                 associated  commands  may be omitted if no action is desired
                 when <value> is false.  The keyword 'fi' is mandatory.

                 'If' is not restricted to use in command files, and  so  may
                 produce  puzzling  results  when  used  incorrectly  from  a
                 terminal.  These can always be handled by typing a 'fi' com-
                 mand  or  by   generating   end-of-file   to   the   command
                 interpreter.


            _E_x_a_m_p_l_e_s

                 if [nargs]
                    set params = [args]
                 fi

                 if [eval i ">=" 10]
                    then
                       goto exit
                    else
                       set i = [eval i + 1]
                       goto loop
                 fi

                 if [flag]; then; echo "Success!"
                 else; echo "Failure..."
                 fi






            if (1)                        - 1 -                        if (1)




            if (1) --- conditional statement for Shell files         03/20/80


            _M_e_s_s_a_g_e_s

                 "Missing  'fi'"  if  end-of-file is reached on command input
                      before a matching 'fi' was found.


            _B_u_g_s

                 Redirectors in front of the  'else'  will  prevent  it  from
                 being recognized.

                 Typing  "if"  on  someone's terminal will cause the Shell to
                 ignore any command they type until an EOF  or  an  unmatched
                 'fi' is typed.


            _S_e_e _A_l_s_o

                 then (1), else (1), fi (1), case (1), goto (1), _U_s_e_r_'_s _G_u_i_d_e
                 _f_o_r _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r






































            if (1)                        - 2 -                        if (1)


