

            type (2) --- return type of character                    03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function type (c)
                 character c

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Type'  returns the type of the character given as its first
                 argument:  LETTER if the character was a  letter,  DIGIT  if
                 the  character  was  a digit, and the character itself if it
                 was anything else.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Type' checks the  type  of  character  by  using  a  Ratfor
                 'select'  statement  listing  all  the letters in one alter-
                 native and all the digits  in  another.   If  the  character
                 falls  within  the  first  range,  LETTER is returned; if it
                 falls within the last range, DIGIT is  returned;  if  it  is
                 outside  of  both,  the  function  return  is  the character
                 itself.

































            type (2)                      - 1 -                      type (2)


