

            esac (1) --- mark the end of a case statment             03/20/80


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

                 'Esac'  is  a  do-nothing  command used to mark the end of a
                 case statement.  It may  be  searched  for  by  the  'case',
                 'when',  or  'out'  commands.   Every 'case' command must be
                 followed by a matching 'esac' command.

                 'Esac' may be used to regain control  of  a  terminal  after
                 execution of a 'when' or 'out' command.


            _E_x_a_m_p_l_e_s

                 case [time]
                    when 12:00:00
                       echo "LUNCHTIME!!!"
                    when 17:00:00
                       echo "t i m e   t o   g o   h o m e . . ."
                    out
                       echo "Back to Work."
                 esac


            _B_u_g_s

                 Redirectors before 'esac' prevent its recognition by 'when',
                      'out', and 'case'.


            _S_e_e _A_l_s_o

                 case (1), when (1), out (1), if (1)













            esac (1)                      - 1 -                      esac (1)


