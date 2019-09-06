

            vtilin (2) --- insert lines on the user's terminal screen  08/16/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function vtilin (row, cnt)
          |      integer row, cnt

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Vtilin'  inserts  'cnt'  blank  lines  at line 'row' on the
          |      screen.  If 'cnt' is not given, it defaults  to  1.   Unlike
          |      other  'vth'  functions,  'vtilin'  makes the changes on the
          |      user's terminal immediately (ie - with no call to  'vtupd').
          |      'Vtilin' will take advantage of a terminal's hardware insert
          |      line  function,  if  one  is  available,  otherwise  it will
          |      simulate it with whatever other functions the terminal  pos-
          |      sesses.   The  function  return  is  ERR if 'row' is off the
          |      screen or 'cnt' is negative and OK otherwise.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Vtilin' first ensures that 'row' is on the screen and  that
          |      'cnt'  is  positive.   If a hardware insert line function is
          |      available, the subroutine simply positions  to  the  correct
          |      place  on  the  screen and outputs the appropriate number of
          |      line inserts.  If  hardware  insert  is  not  available  the
          |      subroutine  attempts  to use a hardware clear to end-of-line
          |      function to clear sections of the screen and then redraw the
          |      rest of the screen.  If no hardware clear to end-of-line  is
          |      available  the  subroutine  just  writes blanks to clear the
          |      correct section and then redraws the rest of the screen.


          | _C_a_l_l_s

          |      move$, vt$del, vt$out, vtmove


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _S_e_e _A_l_s_o

          |      Other vt?* routines (2)










            vtilin (2)                    - 1 -                    vtilin (2)


