

            vtmsg (2) --- display a message in the status line       07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtmsg (msg, type)
                 character msg (MAXLINE)
                 integer type

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtmsg' is used to place an arbitrary message in the "status
                 line"  (if  one  has  been  enabled).   If there has been no
                 status line enabled, 'vtmsg' has no  effect.   Messages  are
                 'typed'  with  simple  integers; each new message overwrites
                 any old one with the same 'type'.  Messages  with  different
                 types  are simply shuffled to different places on the status
                 line.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtmsg' first checks to see if  the  status  line  has  been
                 enabled  and,  if  not,  simply returns.  The status line is
                 then scanned for another message with the same type.  If one
          |      is found, it checks to see if the new message  will  fit  in
          |      place of the old one, and if not, if proceeds to shuffle the
                 existing  messages  around  to  attempt  to fit them on.  If
                 another message is not found with the  same  type,  it  just
                 looks  for  enough space on the status line to place the new
                 message, shuffling the  others  around,  if  necessary.   If
                 there  isn't  enough space in which to place the message, as
                 much of it as is possible is placed on the status line.


            _C_a_l_l_s

                 length, vt$put


            _S_e_e _A_l_s_o

                 length (2), and other vt?* routines (2)















            vtmsg (2)                     - 1 -                     vtmsg (2)


