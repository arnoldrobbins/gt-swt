

            vtdlin (2) --- delete lines on the user's terminal screen  08/16/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function vtdlin (row, cnt)
          |      integer row, cnt

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Vtdlin'  deletes  'cnt' lines starting at line 'row' on the
          |      screen.  If 'cnt' is not given, it defaults  to  1.   Unlike
          |      other  'vth'  functions,  'vtdlin'  makes the changes on the
          |      user's terminal immediately (ie - with no call to  'vtupd').
          |      'Vtdlin' will take advantage of a terminal's hardware delete
          |      line  function,  if  one  is  available,  otherwise  it will
          |      simulate it with whatever other functions the terminal  pos-
          |      sesses.   The  function  return  is  ERR if 'row' is off the
          |      screen or 'cnt' is negative and OK otherwise.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Vtdlin' first ensures that 'row' is on the screen and  that
          |      'cnt'  is  positive.   If a hardware delete line function is
          |      available, the subroutine simply positions  to  the  correct
          |      place  on  the  screen and outputs the appropriate number of
          |      line deletes.  If hardware  delete  is  not  available,  the
          |      subroutine  redraws the appropriate sections and attempts to
          |      use a hardware clear to end-of-line function  to  clear  the
          |      bottom sections of the screen.  If no hardware clear to end-
          |      of-line is available, the subroutine just redraws the screen
          |      using blanks to clear the correct sections.


          | _C_a_l_l_s

          |      move$, vt$del, vt$out, vtmove


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      none


          | _S_e_e _A_l_s_o

          |      Other vt?* routines (2)










            vtdlin (2)                    - 1 -                    vtdlin (2)


