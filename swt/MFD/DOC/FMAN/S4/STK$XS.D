

            stk$xs (4) --- set/read stack extension pointer          06/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine stk$xs (root, ptr_to_ext)
                 shortcall stk$xs (4)

                 integer root
                 pointer ptr_to_ext

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 The Prime machines support the mechanism of a stack that can
                 be  extended  into  additional  segments,  as  needed.  This
                 routine allows you to set  the  extension  pointer  for  any
                 stack,  or read the current extension pointer for any stack.
                 The function's actions depend on the value of  'root'  (seg-
                 ment of stack root):

                      If  (root  ==  :100000)  then  the function returns the
                      current extension pointer in 'ptr_to_ext'.  (:100000 ==
                      ints(-32768))

                      If (root > -32768 & root < 0) then the function returns
                      in 'ptr_to_ext' the current extension pointer  for  the
                      stack whose root is in segment abs(root).

                      If  (root  ==  0)  then the function sets the extension
                      pointer  of  the  current  stack  to   the   value   of
                      'ptr_to_ext'.

                      If  (root  >  0)  then  the function sets the extension
                      pointer of the stack whose root is in segment 'root' to
                      the value in 'ptr_to_ext'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a simple  PMA  routine  entered  via  a  JSXB
                 (shortcall).   If  the operation is specified as relative to
                 the current stack root then  the  stack  segment  number  is
                 taken from SB% + 1 (the current stack frame root pointer).

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr_to_ext






            stk$xs (4)                    - 1 -                    stk$xs (4)




            stk$xs (4) --- set/read stack extension pointer          06/25/82


            _B_u_g_s

                 There  is  no  validity  checking  done on either the 'root'
                 parameter or the 'ptr_to_ext' parameter.

                 No validation is done to make sure that 'ptr_to_ext'  points
                 to a valid stack.

                 Locally supported.


            _S_e_e _A_l_s_o

                 fc (1), _S_y_s_t_e_m _A_r_c_h_i_t_e_c_t_u_r_e _R_e_f_e_r_e_n_c_e _G_u_i_d_e (Prime PDR 3060)












































            stk$xs (4)                    - 2 -                    stk$xs (4)


