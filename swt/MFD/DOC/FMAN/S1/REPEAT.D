

            repeat (1) --- loop control structure for Shell files    09/05/84


          | _U_s_a_g_e

          |      repeat
          |         { <command> }
          |      until [ <value> ]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Repeat'  implements a Pascal-like repeat loop in the Shell.
          |      The optional <value> after the 'until' command  may  be  any
          |      string  or  function  call; if it is zero, empty, or missing
          |      altogether, it is interpreted  as  false,  otherwise  it  is
          |      interpreted as true.  If <value> is false, control transfers
          |      back  to  the  top  of the loop and the list of commands are
          |      executed again, otherwise the loop terminates and any  other
          |      commands after the loop are executed.

          |      'Repeat'  operates  by saving a copy of any commands entered
          |      between the 'repeat' statement and the 'until' statement  in
          |      a   temporary   file.   The  top  of  the  file  contains  a
          |      (hopefully) unique label and when the 'until'  statement  is
          |      entered, an 'if' statement is generated using <value> as the
          |      condition for a 'goto' to the label.  For example the repeat
          |      loop

          |           repeat
          |              set i = [eval i + 1]
          |           until [eval i ">" 7]

          |      generates the following Shell file

          |           :L01t
          |           set i = [eval i + 1]
          |           if [eval i ">" 7]
          |           else
          |           goto L01t

          |      and then calls the shell to execute it.  Since it is execut-
          |      ing  as  another level of the shell, the 'exit' command will
          |      actually cause early termination of the loop, but  a  'goto'
          |      statement  to a label outside the scope of the loop will not
          |      work because the label is not  accessible  from  within  the
          |      shell file.  Another incidental advantage obtained from pre-
          |      processing  the  structure  and  executing  as another Shell
          |      level is that this loop can be issued from the terminal  and
          |      it  will behave reasonably, i.e.  - it will execute the loop
          |      instead of ignoring any further commands the  way  a  'goto'
          |      statement does.


          | _E_x_a_m_p_l_e_s

          |      declare i = 0
          |      repeat | change ?* "-- & --"     # they pipe, also
          |         echo [i]


            repeat (1)                    - 1 -                    repeat (1)




            repeat (1) --- loop control structure for Shell files    09/05/84


          |         set i = [eval i + 1]
          |      until [eval i ">" 7]

          |      repeat
          |         long_command
          |         even_longer_command
          |         if [flag]
          |            exit              # terminate the loop early
          |         fi
          |      
          |         very_short_command
          |      until [done]

          |      repeat
          |         hd swt
          |         pause for 5
          |      until                   # infinite loop (defaults to false)


          | _M_e_s_s_a_g_e_s

          |      "Can't  create temporary file for repeat loop" if there is a
          |           problem creating a file to hold the processed  'repeat'
          |           loop.

          |      "Too  many arguments" if there is an argument overflow while
          |           trying to copy the current arguments for  the  'repeat'
          |           statement.

          |      "Missing 'until'" if end-of-file is reached on command input
          |           before a matching 'until' was found.


          | _B_u_g_s

          |      Since the 'repeat' command causes another level of the shell
          |      to  be executed, the arguments need to be copied to the next
          |      level.  If there are many arguments to other commands in the
          |      network in which the 'repeat' is contained, then there could
          |      be an argument overflow.

          |      Typing 'repeat' on someone's terminal will cause  the  Shell
          |      to  ignore  any command they type until an EOF or a matching
          |      'until' is typed.


          | _S_e_e _A_l_s_o

          |      if (1), then (1), else (1), fi  (1),  case  (1),  goto  (1),
          |      until  (1),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m
          |      _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r







            repeat (1)                    - 2 -                    repeat (1)


