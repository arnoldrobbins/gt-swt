

            mail (1) --- send or receive mail                        03/23/82


            _U_s_a_g_e

                 mail [ -p ] { <login name> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mail'  is the user's interface to the Subsystem postal ser-
                 vice.

                 If invoked with arguments, 'mail' first verifies  that  each
                 is  the login name of a Subsystem user, reads standard input
                 one until end-of-file, and then  appends  the  message  thus
                 read  to  the mailbox files of all users named.  All letters
                 are postmarked with the sender's login name and the time and
                 date of the mailing.

                 If no argument is present on the command  line,  the  user's
                 own  mailbox  file  is displayed.  If the "-p" option is not
                 present and  standard  output  is  directed  to  the  user's
                 terminal,  letters  are printed one CRT screenful at a time.
                 (The user may skip or re-examine the mail at this point; see
                 manual entries for 'pg'  (1)  and  'page'  (2)  for  further
                 information.)   If  anything was in the mailbox, 'mail' then
                 asks the question, "Save mail?".   If  the  response  begins
                 with  the  letter "n", the mail is discarded; otherwise, the
                 contents of the mailbox are appended to the  file  named  by
                 the    template    "=mailfile="    (Subsystem   default   is
                 =varsdir=/.mail).


            _E_x_a_m_p_l_e_s

                 mail
                 mail spaf
                    (message follows, terminated by end-of-file (Control-C))
                 mail perry dan myers
                    (message follows, terminated by end-of-file (Control-C))


            _F_i_l_e_s

                 =mail=/<login_name> for mailboxes
                 =mailfile= for mail save file


            _M_e_s_s_a_g_e_s

                 "Usage:  mail ..."  for invalid arguments.
                 "Save mail?"  to ask if mail should be saved.
                 "can't create temporary file" if a temporary file  can't  be
                      created to hold the letter for distribution.
                 "can't  open <user>'s mailbox" if the mail delivery file for
                      <user> can't be opened.




            mail (1)                      - 1 -                      mail (1)




            mail (1) --- send or receive mail                        03/23/82


            _B_u_g_s

                 Mail messages are neither secure nor private.


            _S_e_e _A_l_s_o

                 to (1)


















































            mail (1)                      - 2 -                      mail (1)


