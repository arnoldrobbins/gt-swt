

            guess (5) --- try to guess what command the user means   01/03/83


            _U_s_a_g_e

                 guess <command> [ <maxlevels> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Guess' is a program which tries to discern the correct com-
                 mand  when  a  misspelled  command  is entered.  The program
                 works by computing a "distance" between a misspelled command
                 and commands in a predefined  list.   If  any  commands  are
                 found  with  a  distance  less  than a predefined tolerance,
                 'guess' will present for selection all commands in the group
                 that have the lowest distance.  If this list  contains  only
                 one  command,  it will ask for verification that it selected
                 the right command.  If this list contains more than one com-
                 mand, it prefaces each command by a number, and asks for the
                 correct command to be selected by number.  In either case, a
                 response of a single carriage return  means  "don't  execute
                 anything."   If  the  list  has more than 10 commands in the
                 group with lowest distance, 'guess'  responds  as  the  Sub-
                 system normally does:  "<command>:  not found".

                 'Guess'  searches  through  the  file  "=extra=/clist" which
          |      contains  the  system  internal  commands,   commands   from
          |      "=lbin="  and  "=bin=".  The user can define his own list to
                 include  his  personal  command  directory  by  running  the
                 program 'mkclist', and this will create a file in the user's
                 "bin" directory "=ubin=/clist".


            _F_i_l_e_s

                 =ubin=/clist
                 =extra=/clist


            _B_u_g_s

                 'Guess'  will not consider commands that are accessible from
                 the user's search rule, but not in one of the "clist" files.


            _E_x_a_m_p_l_e_s

                 <<'guess' should not normally be run from command level>>


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 bs (5), bs1 (5), mkclist (3)


            guess (5)                     - 1 -                     guess (5)


