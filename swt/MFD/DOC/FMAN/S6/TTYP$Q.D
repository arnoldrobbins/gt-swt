

            ttyp$q (6) --- query for the terminal type from the user  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function ttyp$q (ttype, blankok)
                 character ttype (MAXTERMTYPE)
                 integer blankok

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ttyp$q'  asks the user for the name of his terminal.  If an
                 unknown terminal type is specified, the user  is  given  the
                 option of having the known terminal types listed by entering
                 either  a  "?"  or "help" or entering a valid terminal type.
                 If a valid terminal type was given by the user, the function
                 returns YES; otherwise, the function  return  value  is  NO.
                 For valid user responses, 'ttype' contains the terminal type
                 name.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 After a user response is entered, it is mapped to lower case
                 (for  consistency).   If  a  null response is entered and is
                 permitted by the caller (i.e., 'blankok' is YES),  then  all
                 terminal  type  information  in the Subsystem common area is
                 erased; otherwise, the terminal type entered  is  validated.
                 If it is a valid terminal type, the values of its attributes
                 are  set;  otherwise,  the  user is asked to enter a correct
                 response or a help request.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ttype


            _C_a_l_l_s

                 ctoc, equal, input, mapstr, print, ttyp$l, ttyp$v


            _S_e_e _A_l_s_o

                 se (1), term (1), term_type (1), other ttyp$?* routines (6)












            ttyp$q (6)                    - 1 -                    ttyp$q (6)


