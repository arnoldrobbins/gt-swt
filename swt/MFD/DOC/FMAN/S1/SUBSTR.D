

            substr (1) --- take a substring of a string              02/22/82


            _U_s_a_g_e

                 substr <start> <length> <string>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Substr' is similar in function to the PL/I substr function;
                 it  prints  on  standard output a specified substring of its
                 third  argument.   The  substring  printed  is  taken   from
                 <string>  starting  at  position  <start> and continuing for
                 <length>  characters,  or  until  the  end  of  <string>  is
                 reached.   If  <start> is negative, the starting position is
                 -<start> characters from the end of <string>.   If  <length>
                 is negative, characters are extracted from right to left.

                 'Substr'   is   perhaps   excessively  general;  for  common
                 problems,  the  'take'  and  'drop'  commands  will  usually
                 suffice.


            _E_x_a_m_p_l_e_s

                 substr 1 2 11/27/84
                 substr [start] [len] [full_name]
                 set last_five = [substr -5 5 [variable]]


            _S_e_e _A_l_s_o

                 take  (1),  drop  (1), rot (1), substr (2), stake (2), sdrop
                 (2)


























            substr (1)                    - 1 -                    substr (1)


