

            vtread (2) --- read characters from a user's terminal    07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vtread (crow, ccol, clr)
                 integer crow, ccol, clr

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtread'  starts reading characters from the user's terminal
                 into the screen buffers.   'Vtenb'  must  be  called  before
                 'vtread'  to  enable input areas.  'Crow' and 'ccol' are the
                 places at which to start reading.  'Clr' is a  flag  to  let
                 'vtread'  know  if  the  user  wants the input areas cleared
                 before reading.  If 'clr' is YES, then the input  areas  are
                 cleared before reading, otherwise they are left as they are.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Clr' is checked to decide whether or not to clear the input
          |      areas,  and if so, proceeds to call 'vt$put' to place blanks
          |      in these areas, and calls 'vtupd' to update  these  changes.
                 It  then  positions  to  the input area at the given row and
                 column.  If  there  is  no  input  area  defined  there,  it
                 positions  to  the  next one defined.  If there are no input
                 areas defined, the  function  return  is  set  to  zero  and
                 'vtread'  returns.   If  an  input area has been defined, it
                 calls 'vt$get' to read  characters  from  the  terminal  and
                 place  them  on the screen, until a termination character is
                 typed (RETURN,  KILL_RIGHT_AND_RETURN,  MOVE_UP,  MOVE_DOWN)
                 and  then  returns  the  termination  code  as  the function
                 return.


            _C_a_l_l_s

                 vt$put, vt$get, vtupd


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 none


            _S_e_e _A_l_s_o

                 _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r (Se section),
                 and other vt?* routines (2)








            vtread (2)                    - 1 -                    vtread (2)


