

            vtopt (2) --- set options for the virtual terminal handler  07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vtopt (option, str)
                 integer option, str (ARB)

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vtopt'  sets  a  number  of optional parameters for the VTH
                 screen.  The currently available values for 'option' are:

                 STATUS_ROW    enable a "status row"; 'str' should be the row
                                number on which the  "status row"  is  to  be
                                displayed.

                 DISPLAY_TIME  enable/disable   the   time   display  in  the
                                "status row"; 'str' should be YES  to  enable
                                the  display  and  it should be NO to disable
                                the display.

                 UNPRINTABLE_CHARS display  a  printable  representation   of
                                normally  unprintable  characters;  'str (1)'
                                should contain the replacement character  (as
                                a character variable).

                 SET_TABS      set  tab stops for input; 'str' should contain
                                an EOS string containing non-blank characters
                                where tab stops are to be set.



            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vtopt' simply sets certain  variables  in  the  VTH  common
                 block  to allow the rest of the routines to keep up with the
                 attributes.  For STATUS_ROW, the "status row" is written out
                 and a flag indicating that there is a status  row,  is  set.
                 For  the  rest  of  the  options,  though,  flags are set to
                 indicate each option.


            _C_a_l_l_s

                 vt$put


            _S_e_e _A_l_s_o

                 other vt?* routines (2)







            vtopt (2)                     - 1 -                     vtopt (2)


