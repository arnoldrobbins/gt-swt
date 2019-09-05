

            out (1) --- specify default alternative in a case statement  02/22/82


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

                 'Out'  is  used  to flag the default alternative in a 'case'
                 command  sequence.   It  should  appear  after  any  command
                 sequences  introduced by 'when' commands, and will be selec-
                 ted by the 'case' command if and only if none of the  alter-
                 natives specified by 'when' commands are taken.

                 'Out' is usually executed only if control falls through from
                 the  commands  under  the  control  of  a  'when'.   In this
                 instance, commands are skipped  until  an  unmatched  'esac'
                 command is found.

                 Use  of  'out' from a terminal may cause input to be ignored
                 until end-of-file or the typing of an 'esac' command.


            _E_x_a_m_p_l_e_s

                 case [line]
                    when 12
                       set location = REMOTE
                    out
                       set location = LOCAL
                 esac


            _M_e_s_s_a_g_e_s

                 "Missing 'esac'" if end-of-file  is  encountered  before  an
                      'esac' command.


            _B_u_g_s

                 'Out' is a holdover from the ALGOL 68 case-clause syntax.


            _S_e_e _A_l_s_o

                 case  (1),  when (1), esac (1), if (1), _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r



            out (1)                       - 1 -                       out (1)


