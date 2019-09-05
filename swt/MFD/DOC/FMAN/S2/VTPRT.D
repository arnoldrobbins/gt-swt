

            vtprt (2) --- place formatted strings into screen buffers  07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vtprt (row, col, fmt, a1, a2, ... , a10)
                 integer row, col
                 character fmt (ARB)
                 untyped a1, a2, a3, a4, a5, a6, a7, a8, a9, a10

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtprt'  is  used to place formatted strings into the screen
                 buffers.  'Row' and 'col' tell where the resulting string is
                 to be placed.  'Fmt' is a formatting string like  that  used
                 in encode to define how the final string is to look.  It can
                 be either an EOS terminated string, or a packed string.  The
                 remaining  arguments  are  the items to be put on the screen
                 according to formatting control.

                 'Vtprt'  works  equivalent  to  the   Subsystem   subroutine
                 'print'.   The  user is advised to look at the documentation
                 for  'print'  for  a  full  explanation  of  the  formatting
                 capabilities of 'vtprt'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtprt'  checks  for  the  legality of the position (row and
                 col), and returns ERR if it isn't legal.  It then checks the
                 string for being packed, or  unpacked.   If  it  is  packed,
                 'ptoc'  is  called to unpack the character string.  'Encode'
                 is then called to do the formatting, and  then  'vt$put'  is
                 called  to  place the string in the screen buffer.  The size
                 of the resulting string is the function return.


            _C_a_l_l_s

                 ptoc, encode, vt$put


            _S_e_e _A_l_s_o

                 encode (2), print (2), ptoc (2), other vt?* routines (2)













            vtprt (2)                     - 1 -                     vtprt (2)


