

            vtinit (2) --- initialize terminal characteristics       07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vtinit (term_type)
                 character term_type (MAXTERMTYPE)

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtinit'  initializes  the  terminal  characteristic  common
                 blocks for the virtual terminal handler.  It must be  called
                 before  any  of  the  other  routines  are used.  The single
                 argument is the returned terminal type of the users  current
                 process.   The  value  returned  from  'vtinit' is OK if the
                 descriptor file for that type of terminal is found,  and  is
                 in the correct format, and ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtinit'  first  calls  'vtterm'  to initialize the terminal
                 characteristic tables and  return  the  terminal  type.   If
                 'vtterm'  couldn't  initialize  the  tables,  then  'vtinit'
          |      returns ERR.  'Vtinit' then proceeds  to  clear  the  screen
          |      buffers,  status  information, input enabling, and turns off
                 terminal echo, and then returns OK.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 term_type


            _C_a_l_l_s

                 vtterm, Primos duplx$


            _S_e_e _A_l_s_o

                 other vt?* routines (2)
















            vtinit (2)                    - 1 -                    vtinit (2)


