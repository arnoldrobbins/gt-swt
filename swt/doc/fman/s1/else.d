

            else (1) --- introduce else-part of a conditional        03/20/80


            _U_s_a_g_e

                 if <value>
                    then
                       { <command> }
                    else
                       { <command> }
                 fi


            _D_e_s_c_r_i_p_t_i_o_n

                 'Else'  is  used  in  conjunction  with  the 'if' command to
                 introduce the negative portion of a  conditional  statement.
                 Paradoxically,  it is executed only as control falls through
                 from the then-part of the conditional; its action is to skip
                 to the first unmatched 'fi' command.

                 The else-clause of a conditional is always optional.

                 Since 'else' works as well from the terminal as it does from
                 a command file, typing "else" as a command  will  cause  the
                 command  interpreter to skip input until it sees a 'fi' com-
                 mand or end-of-file.


            _E_x_a_m_p_l_e_s

                 if [eval [line] = 10]
                    then
                       set term = consul
                    else
                       set term = unknown
                 fi


                 if [eval [take 2 [time]] ">" [deadline]]
                    then
                       echo "Time out."
                    else
                       process_job
                 fi


            _M_e_s_s_a_g_e_s

                 "Missing 'fi'" if end-of-file  is  seen  before  a  'fi'  is
                      encountered.


            _B_u_g_s

                 Redirectors  placed before the 'fi' will prevent 'else' from
                 detecting it.




            else (1)                      - 1 -                      else (1)




            else (1) --- introduce else-part of a conditional        03/20/80


            _S_e_e _A_l_s_o

                 if (1), then (1), fi (1), case (1)























































            else (1)                      - 2 -                      else (1)


