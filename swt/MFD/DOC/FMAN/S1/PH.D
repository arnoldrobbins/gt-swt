

            ph (1) --- execute subsystem commands in the background  08/17/82


            _U_s_a_g_e

                 ph { <command> }


            _D_e_s_c_r_i_p_t_i_o_n

                 The  'ph'  command allows the Subsystem user to execute Sub-
                 system commands in  the  background  while  continuing  with
                 other work at his terminal.  The phantom user feature of the
                 Primos  operating  system  is used to implement this command
                 and Primos must have been configured at startup for  phantom
                 users.

                 'Ph' has two usage formats:

                      In  the  first format, the commands to be executed
                      are given as arguments.  Care should be taken when
                      using this format to enclose in  quotes  any  com-
                      mands that contain the following characters:

                           ( ) [ ] { } # , > |

                      since  these  meta-characters  will  otherwise  be
                      interpreted by the shell applied to the 'ph'  com-
                      mand itself.

                      In the second format, commands are read from stan-
          |           dard  input  up  to  the next occurrence of end of
          |           file.  This format allows 'ph' to be used  at  the
                      end of a pipeline.

                 In  either  case, 'ph' builds a script of commands that will
                 be used to drive the phantom process.

                 Assuming no errors were encountered, 'ph' responds by print-
                 ing the phantom's process id on standard output.


            _E_x_a_m_p_l_e_s

                 ph rf se.r
                 ph "rf rf.r; fc rf.f"
                 commands> ph


            _F_i_l_e_s

                 =varsdir=/ph<user_number><sequence> for phantom input file


            _M_e_s_s_a_g_e_s

                 "=temp= missing" if unable to  follow  pathname  of  phantom
                      script.
                 "No free phantoms" if Primos refuses to initiate phantom.


            ph (1)                        - 1 -                        ph (1)




            ph (1) --- execute subsystem commands in the background  08/17/82


                 "Can't create phantom temp" if unable to create file to hold
                      phantom script.


            _B_u_g_s

                 A  note  on  portability:  'ph' takes advantage of a Georgia
                 Tech  modification  to  the  Primos  operating  system  that
                 duplicates   both   current  and  home  directories  in  the
                 environment of the  phantom  (the  normal  procedure  is  to
                 duplicate  only  the current directory).  In systems that do
                 not have this feature, the first command to be  executed  by
                 the  phantom  should  be  a  'cd'  command  to attach to the
                 desired directory.

                 Only 4 phantoms may be concurrently in progress on behalf of
                 any single user.

                 Due to Primos restrictions, phantoms cannot be started while
                 the user is attached to a remote disk.


            _S_e_e _A_l_s_o

                 sh (1), x (1), batch (1), Primos phant$

































            ph (1)                        - 2 -                        ph (1)


