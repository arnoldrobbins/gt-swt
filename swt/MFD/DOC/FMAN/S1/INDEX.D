

            index (1) --- find index of a character in a string      03/20/80


            _U_s_a_g_e

                 index <string> <character>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Index' is a version of the PL/I index function.  The string
                 specified   as   the  first  argument  is  searched  for  an
                 occurrence  of  the  character  specified  as   the   second
                 argument;  if  the  character  is  found, 'index' prints its
                 location in the string (first character in the string is  at
                 position  1)  on  standard  output.  If the character is not
                 found, zero is printed.

                 'Index' is equivalent to the 'index' subprogram available in
                 the standard Software Tools Subsystem library.


            _E_x_a_m_p_l_e_s

                 index "abcdefghijklmnopqrstuvwxyz" a
                 index [upalf] a
                 take [index [string] " "]] [string]


            _B_u_g_s

                 None, unless you consider the argument order a bug.


            _S_e_e _A_l_s_o

                 take (1), drop (1), substr (1), index (2)
























            index (1)                     - 1 -                     index (1)


