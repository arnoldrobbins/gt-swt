

            vt$out (6) --- output a character onto the screen        07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$out (ch)
                 character ch

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$out' is the very low level routine which does the actual
                 character  output  to  the  terminal  screen;  the character
                 contained in 'ch' is printed on  the  screen  after  certain
                 considerations are evaluated.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 First, 'vt$out' checks to see if the character would be out-
                 put  on  the last character position of the last line of the
                 screen;  if  so,  it  returns  without  doing   the   output
                 operations  (thus  preventing  the  screen  from scrolling).
                 Next, the character is checked to see if it is printable; if
                 not, then a printed representation is output (if a "shifted"
                 sequence for the unprintable character is defined,  i.e.   a
                 transparent  mode  indicator  for  the  terminal,  then that
                 sequence is output before the character itself).  The inter-
                 nal screen cursor position indicators are updated to reflect
                 that a character was printed.


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)



















            vt$out (6)                    - 1 -                    vt$out (6)


