

            gklarg (2) --- parse a single key-letter argument        03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gklarg (args, str)
                 integer args (26)
                 character str (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gklarg'  is  used  to  parse  a key-letter argument string.
                 Such an argument consists of a dash ("-")  followed  by  any
                 number of letters (in upper or lower case).

                 All  elements  in  the array 'args' must be preset to one of
                 two values before calling 'gklarg'.  Elements  corresponding
                 to  allowable  option letters should be initialized to zero;
                 all others should contain -1.

                 'Gklarg' sets the elements of 'args' that correspond to  any
                 option  letters found in 'str' to the value 1.  The function
                 return is ERR if 'str' does not begin with a dash, or if any
                 disallowed option letters are encountered, OK otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gklarg' first verifies  that  the  string  given  in  'str'
                 begins  with  a dash.  If it does not, ERR is returned.  The
                 remainder of the string is examined  character-by-character.
                 If a letter is encountered, and the corresponding element of
                 'args'  is  nonnegative,  then  the  element  is set to one.
                 Otherwise the value ERR is returned immediately.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 args


            _C_a_l_l_s

                 mapdn


            _S_e_e _A_l_s_o

                 gfnarg (2), chkarg (2), getkwd (2)









            gklarg (2)                    - 1 -                    gklarg (2)


