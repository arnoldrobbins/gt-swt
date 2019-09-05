

            elif (1) --- else-if construct for Shell programs        09/05/84


          | _U_s_a_g_e

          |      if <value>
          |         then
          |            { <command> }
          |         elif <value>
          |            { <command> }
          |      fi


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Elif'  is used as a short form of the 'else' statement with
          |      an 'if' statement.  It does not cause another nesting  level
          |      of  control  statements  and is useful in implementing case-
          |      like structures.  Unfortunately, <value> must be a  constant
          |      in the 'elif' statement where an else-if pair allows <value>
          |      to  be a function call.  This severely limits its usefulness
          |      since the value will be known at the time it is used.


          | _E_x_a_m_p_l_e_s

          |      if [eval [line] = 10]
          |         then
          |            set term = consul
          |      elif 7                     # always will execute, so same as an else
          |         then
          |            set term = regent
          |      fi


          | _M_e_s_s_a_g_e_s

          |      "Missing 'fi'" if end-of-file  is  seen  before  a  'fi'  is
          |           encountered.


          | _B_u_g_s

          |      Redirectors  placed before the 'fi' will prevent 'else' from
          |      detecting it.

          |      Some might consider it a bug that 'elif' takes  a  constant,
          |      instead of being able to use the result of a function call.


          | _S_e_e _A_l_s_o

          |      if (1), then (1), elif (1), fi (1), case (1)








            elif (1)                      - 1 -                      elif (1)


