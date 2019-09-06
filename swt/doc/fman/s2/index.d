

            index (2) --- find index of a character in a string      02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function index (str, c)
                 character str (ARB)
                 character c

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Index'  searches the string given as its first argument for
                 the character given as its second argument.  If the  charac-
                 ter  is found, its index in the string is returned; if it is
                 not found, zero is returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A simple loop checks for the character  in  the  string;  if
                 found,  an  immediate  return  takes  place.   If  the  loop
                 terminates normally, the value zero is returned.


            _B_u_g_s

                 The arguments should be reversed.































            index (2)                     - 1 -                     index (2)


