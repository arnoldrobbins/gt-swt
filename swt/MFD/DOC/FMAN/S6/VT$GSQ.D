

            vt$gsq (6) --- get a delimited sequence of characters    07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$gsq (msg, delim, seq, max)
                 character msg (ARB), delim, seq (ARB)
                 integer max

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$gsq'  is  used to read a sequence of characters from the
                 users terminal.  The first argument is a message which  will
                 be  displayed  in  the  status line, if one is enabled.  The
                 second argument is  the  delimiter  used  to  terminate  the
                 sequence.   The third argument is the returned sequence, and
                 the last argument is the maximum  length  of  the  sequence.
                 'Vt$err'  is  called  to  print  error  messages  for  empty
                 sequences, or for sequences which are too long.   The  func-
                 tion return is ERR if an illegal sequence is entered, or the
                 length of the returned sequence.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 seq


            _C_a_l_l_s

                 ctomn, encode, vt$err, vtmsg, vtupd, Primos c1in


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)

















            vt$gsq (6)                    - 1 -                    vt$gsq (6)


