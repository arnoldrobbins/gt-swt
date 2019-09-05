

            yesno (1) --- selective filter with user decision        08/06/82


            _U_s_a_g_e

                 yesno [-yes | -no]


            _D_e_s_c_r_i_p_t_i_o_n

                 This  program  can be used as a filter in a pipe to regulate
                 input to other commands.  It reads a line  at  a  time  from
                 standard  input  (STDIN), echoes the line in quotes followed
                 by a question mark, and then prompts the user for a  yes  or
                 no  answer.   A  response  of  "y", "ye", "yes", or "ok" all
                 result in the line being passed to standard output (STDOUT).
          |      A response of "n" or "no"  discards  the  line.   Any  other
          |      response  causes  an  error message and the user is prompted
          |      with the line again.  Case is not significant in responses.

                 Use of the optional "-yes" argument causes a carriage return
                 (null response) to default to a "yes" response.  Use of  the
                 optional "-no" argument causes a null response to default to
                 "no."

                 If  the  user  types  an  end-of-file  character (normally a
                 control C) as the response to any decision prompt  then  the
                 current  line  and  all  subsequent  lines  in the input are
                 discarded.

                 All display and prompting are done to and  from  device  TTY
                 and  thus  will not show up in any of the standard inputs or
                 outputs should they be redirected or piped.   As  a  result,
                 this  command cannot be used in a phantom job, nor may a set
                 of pre-determined answers be constructed  as  input  to  the
                 program.


            _E_x_a_m_p_l_e_s

                 lf -ca | yesno -no | del -n
                 lf -c /user/mfd | yesno | del -sd -n
                 =dictionary=> yesno -yes >my_dictionary


            _M_e_s_s_a_g_e_s

                 "Usage:  yesno ..."  for improper command line syntax.

                 "answer YES or NO."  for incorrect or unknown response.


            _B_u_g_s

                 Does not recognize "-y" or "-n" as command line arguments.

                 Will not work in batch or phantom jobs.




            yesno (1)                     - 1 -                     yesno (1)


