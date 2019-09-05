

            case (1) --- case statement for shell files              02/22/82


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

                 'Case'  provides  capabilities  for conditional execution of
                 commands in a manner similar to the case statements  of  the
                 Algol  68  and  Pascal  programming  languages.  It allows a
                 group of commands to be selected for  execution  based  upon
                 the value of some expression.

                 'Case' is always associated with a corresponding 'esac' com-
                 mand which marks the end of the scope of the 'case'.

                 'Case'  accepts  one argument to determine which of the sub-
                 sequent groups of commands is to be executed.  Any construct
                 that yields a valid argument may be  used.   Each  group  of
                 commands  following  'case' is introduced by either a 'when'
                 command or an 'out' command.  The  'when'  command  takes  a
                 string  argument which is compared with <value>.  If the two
                 match, the associated group of commands is executed and  the
                 remaining   alternatives   are   skipped;   otherwise,   the
                 associated commands are skipped.  This proceeds until either
                 an 'out' command or an 'esac' command is seen.  If 'out'  is
                 seen,   the  associated  command  group  is  unconditionally
                 executed; otherwise, the whole 'case' command results in  no
                 action.  Thus, the commands associated with an 'out' command
                 are  executed  by default, if no other alternative is selec-
                 ted.


            _E_x_a_m_p_l_e_s

                 case [term_type]
                    when "b200"
                       se -t b200 [args]
                    when "diablo"
                       ed [args]
                    out
                       echo "Unknown terminal type."
                 esac







            case (1)                      - 1 -                      case (1)




            case (1) --- case statement for shell files              02/22/82


                 case [login_name]
                    when ICS002
                       set name = Allen
                       set class = 4A
                    when ICS005
                       set name = Dan
                       set class = 6D
                    when ISLAB
                       set name = Perry
                       set class = Staff
                    out
                       echo "I'm sorry, but I don't recognize you."
                       set (name class) = ([login_name] UNKNOWN)
                 esac


            _M_e_s_s_a_g_e_s

                 "missing esac" when end of file is encountered before match-
                      ing 'esac' command is seen


            _B_u_g_s

                 The string on the 'when' command is not evaluated, so  func-
                 tion calls, iteration, etc.  are not allowed there.


            _S_e_e _A_l_s_o

                 if (1), esac (1), out (1), when (1), goto (1)



























            case (1)                      - 2 -                      case (1)


