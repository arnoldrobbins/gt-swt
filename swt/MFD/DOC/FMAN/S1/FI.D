

            fi (1) --- terminate conditional statement               03/20/80


            _U_s_a_g_e

                 if <value>
                    then
                       { <command> }
                    else
                       { <command> }
                 fi


            _D_e_s_c_r_i_p_t_i_o_n

                 'Fi'  marks the end of a conditional statement.  It is a do-
                 nothing command that may be searched for by either  'if'  or
                 'else'  in the process of skipping commands.  Each 'if' com-
                 mand must be followed by a matching 'fi' command.

                 If a terminal is locked up  due  to  an  unmatched  'if'  or
                 'else', the 'fi' command may be used to regain control.


            _E_x_a_m_p_l_e_s

                 if [eval [line] ">" 33]
                    then
                       set type = phantom
                    else
                       set type = terminal
                 fi

                 if 1
                    echo "Sorry, you can't use this program."
                    goto exit
                 fi


            _B_u_g_s

                 I/o  redirectors placed before 'fi' render it unrecognizable
                 to 'if' and 'else'.


            _S_e_e _A_l_s_o

                 if (1), then (1), else (1), case (1)













            fi (1)                        - 1 -                        fi (1)


