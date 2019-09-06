

            when (1) --- flag alternative in a case statement        02/22/82


            _U_s_a_g_e

                 case <value>
                    when <alternative1>
                       { <command> }
                    when <alternative2>
                       { <command> }
                    ...
                    out
                       { <command> }
                 esac


            _D_e_s_c_r_i_p_t_i_o_n

                 'When' is used by the 'case' command to flag alternatives in
                 a multi-way comparison.  The argument of 'when' is tested by
                 'case', and if it is found to be equivalent to <value>, then
                 the  group  of  statements following 'when' is executed.  In
                 this function, 'when' is similar to the  case  statement  in
                 the language C.

                 'When' itself is executed only when control falls out of the
                 series  of  commands controlled by the previous 'when'.  The
                 action taken  in  this  case  is  to  skip  until  the  next
                 unmatched 'esac' is seen.  In this respect, 'when' and 'out'
                 are identical.

                 Like  'out'  and 'else', if executed from a terminal without
                 proper termination by an 'esac', 'when' will cause the shell
                 to skip input until end-of-file is seen.


            _E_x_a_m_p_l_e_s

                 case [line]
                    when 10
                       se -t adds [arg 1]
                    when 15
                       se -t b200 [arg 1]
                    out
                       ed [arg 1]
                 esac


            _M_e_s_s_a_g_e_s

                 "Missing 'esac'" if end-of-file is  seen  before  an  'esac'
                      command.


            _B_u_g_s

                 Redirectors  before  the 'esac' prevent 'when' from spotting
                 it.



            when (1)                      - 1 -                      when (1)




            when (1) --- flag alternative in a case statement        02/22/82


                 The string given as the argument to 'when' is not evaluated;
                 therefore, function  calls  and  iteration  groups  are  not
                 allowed.


            _S_e_e _A_l_s_o

                 case  (1),  out  (1), esac (1), if (1), _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r

















































            when (1)                      - 2 -                      when (1)


