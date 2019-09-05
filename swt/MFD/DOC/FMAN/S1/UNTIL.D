

            until (1) --- terminate a loop statement                 09/05/84


          | _U_s_a_g_e

          |      repeat
          |         { <command> }
          |      until [ <value> ]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Until'  marks the end of a 'repeat' loop.  It actually does
          |      nothing and is just searched for by the  'repeat'  statement
          |      when  it  is  in the process of pre-processing a loop.  Each
          |      'repeat' command must be followed by a matching 'until' com-
          |      mand.


          | _E_x_a_m_p_l_e_s

          |      repeat
          |         echo This terminal is taken
          |      until                            # infinite loop

          |      repeat
          |         hd swt
          |         lf
          |      until [eval [template =date=] == 110284]


          | _S_e_e _A_l_s_o

          |      if (1), then (1), else (1), fi (1), case (1), repeat (1)



























            until (1)                     - 1 -                     until (1)


