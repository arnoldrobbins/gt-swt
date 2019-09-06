

            lps (1) --- line printer status monitor                  08/17/82


            _U_s_a_g_e

                 lps ( <cancel> | <list> )
                 <cancel> ::= -c { <seq> }
                 <list>   ::= { -{d|m|q} | -a <dest> | -p <paper> } { <pack> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Lps'  allows the user to cancel entries from his home spool
                 queue, or to list the contents of any  spool  queue  in  the
                 system.

                 To  cancel  entries,  the  "-c"  argument is followed by the
                 entry numbers to be cancelled.  If an entry does not  belong
                 to  the  user,  'lps' prints an error message and leaves the
                 entry intact.

                 In the  absence  of  the  "-c"  argument,  'lps'  lists  the
                 contents  of  the  spool queues on the specified disk packs,
                 interpreting the remaining arguments as listing  constraints
                 as follows:

                   -a   list  only  entries  that  will  be  printed  at  the
                        specified destination.

                   -d   list only entries that are deferred.

                   -m   list only entries that belong to the current user.

                   -p   list  only  entries  that  will  be  printed  on  the
                        specified type of paper.

                   -q   print  a "quiet" listing that contains no heading and
                        lists only the  sequence  number,  user  name,  size,
                        destination  and  file  name  of each entry selected.
                        (Note:  this option merely controls the format of the
                        listing and has nothing to do with which entries  are
                        selected.)

                 If  multiple  constraints  are  specified, only entries that
                 satisfy all constraints are listed.  If no  constraints  are
                 specified, the entire queue is listed.


            _E_x_a_m_p_l_e_s

                 lps
                 lps -c 1 5 prt10
                 lps -a lpb -p narrow -q  sa sb sc


            _F_i_l_e_s

                 /<pack>/spoolq/q.ctrl queue control file
                 //spoolq/prt???  print files


            lps (1)                       - 1 -                       lps (1)




            lps (1) --- line printer status monitor                  08/17/82


            _M_e_s_s_a_g_e_s

                 "Usage:  lps ..."  for improper command syntax.
                 "Can't   find  SPOOLQ  directory  on  disk  <pack>"  if  the
                      specified disk partition is inaccessible  or  does  not
                      contain a spooler queue.
                 "Can't  read  queue  on disk <pack>" if the spooler queue on
                      the specified disk can't be opened for reading.
                 "<seq>:  bad sequence number" for illegal syntax in specify-
                      ing a print file.
                 "<print_file>:  in use" for trying to cancel  a  print  file
                      that is either being printed or still being written.
                 "<print_file>:   can't  cancel"  when  an  unexpected  error
                      occurs while cancelling a print file.
                 "<print_file>:  not found"  for  trying  to  cancel  a  non-
                      existent print file.
                 "<print_file>:   not yours" for attempting to cancel someone
                      else's print file.


            _S_e_e _A_l_s_o

                 sp (1), pr (1)



































            lps (1)                       - 2 -                       lps (1)


