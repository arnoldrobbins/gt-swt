

            raid (3) --- examine bug reports                         01/15/83


            _U_s_a_g_e

          |      raid [-(a | p)]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Raid'  allows  a user to examine bug reports submitted with
                 the 'bug' command.  'Raid' expects to find a variable  named
                 'lastbug'  in  the  global environment (you can create it by
                 entering "set lastbug = 0") containing  the  number  of  the
                 last  bug  report  examined.  If the "-a" option is present,
                 'raid' prints all bug  reports;  otherwise  it  prints  only
                 those  reports  that have not been seen.  If the "-p" option
                 is present, 'raid' spools the bug for  printing;  otherwise,
                 they are displayed on the terminal with 'pg'.

                 If  you  wish  to  be  notified  of  new bug reports as they
                 occurs,  place  the  following  command  in  your   "_hello"
                 variable, or in a shell program that is executed by "_hello"
                 variable:

                    if [eval lastbug < [=ebin=/bugn]]
                       echo "You have bugs."
                    fi



            _E_x_a_m_p_l_e_s

                 raid
                 raid -ap


            _F_i_l_e_s

                 =bug=/r???  for storage of the bug report
                 =bug=/s???   for  storage  of  the user's environment at the
                      time the bug was reported


            _M_e_s_s_a_g_e_s

                 "Usage:  raid ..."  for improper command syntax


            _S_e_e _A_l_s_o

                 bug (3)









            raid (3)                      - 1 -                      raid (3)


