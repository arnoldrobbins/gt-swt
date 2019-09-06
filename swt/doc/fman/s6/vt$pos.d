

            vt$pos (6) --- position the cursor to row, col           11/06/84


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$pos (row, col, crow, ccol)
                 integer row, col, crow, ccol

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$pos'  positions  the  cursor  on  the terminal screen to
                 'row', 'col' from 'Crow', 'ccol'.  If the positioning can be
                 done faster  relatively,  a  relative  position  is  output,
                 otherwise  the  positioning is done absolutely.  'Vtinit' or
                 'vtterm' should have been called beforehand to  set  up  the
                 terminal  characteristics  in  the virtual terminal handler.
                 If the positioning can be done, 'vt$pos' returns OK.  If the
                 positioning can't be done, or the row and column are out  of
                 the terminal's screen boundary, ERR is returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vt$pos'  after  checking to make sure the coordinates given
                 are actually on the  terminal's  screen,  computes  a  'row-
                 coordinate'  and a 'column-coordinate' that are output after
                 the lead-in absolute cursor  positioning  sequence  for  the
                 terminal.   There  are only a few different standard ways to
                 compute this character.  Based  on  how  the  terminal  does
                 absolute addressing, 'vt$pos' then outputs the characters in
                 the  correct  sequence to do the positioning.  A small delay
                 (usually nulls)  is  output  for  terminals  that  need  it.
                 Interested   users   should   look  at  the  code  for  more
                 information.


            _C_a_l_l_s

                 print, vt$del


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)









            vt$pos (6)                    - 1 -                    vt$pos (6)


