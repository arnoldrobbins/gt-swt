

            vtterm (2) --- read terminal characteristics file        07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vtterm (term_type)
                 character term_type (MAXTERMTYPE)

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtterm'  is  used  to  read  in  the  characteristics for a
                 terminal and put that information  into  the  common  blocks
                 used  by  the  other  VTH  routines.   It obtains the user's
                 terminal type and attempts  to  open  the  terminal  charac-
          |      teristic  file.   If it succeeds, the function return is OK,
          |      otherwise ERR.  The user should not call this  routine  him-
                 self,  but  should use the routine 'vtinit' as the interface
                 into this routine.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtterm' calls 'gttype' to return the user's terminal  type.
                 It   attempts  to  open  the  file  "=vth=/<term_type>"  for
          |      reading, and if it can't, it  returns  ERR.   Otherwise,  it
          |      reads the file, decodes the symbolic characteristics, places
                 them in the VTH common block, and then returns OK.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 term_type


            _C_a_l_l_s

                 close,  ctoc,  ctoi,  encode, equal, getlin, gtattr, gttype,
                 length, mntoc, open, strbsr, vt$alc, vt$ier


            _S_e_e _A_l_s_o

                 other vt?* routines (2)















            vtterm (2)                    - 1 -                    vtterm (2)


