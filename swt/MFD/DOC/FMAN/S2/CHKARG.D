

            chkarg (2) --- parse single-letter arguments             03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function chkarg (arg_num, result)
                 integer arg_num, result (26)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Chkarg' scans the list of arguments supplied on the command
                 line,  starting at position 'arg_num', looking for arguments
                 that contain a dash followed by a string  of  letters.   For
                 each  letter  in  such  an  argument,  'chkarg' looks at the
                 corresponding element in the 'result' array (the letters "A"
                 and "a" correspond to element 1, "Z" and "z" to element 26).
                 If the element is non-negative, it  is  set  to  a  positive
                 value equal to the order in which the letter was encountered
                 in  scanning the arguments, counting from 1.  Otherwise, the
                 element is left unchanged and a value of ERR is returned  as
                 the  result  of  the function.  Thus, illegal letters may be
                 detected by setting the corresponding elements  in  'result'
                 to a negative value before calling 'chkarg'.

                 Scanning continues, incrementing 'arg_num', until the end of
                 the argument list is reached, an argument not beginning with
                 a  dash  is  found, or an argument beginning with a dash but
                 containing a subsequent character other  than  a  letter  is
                 found.   In  the  first two cases, 'chkarg' returns with the
                 number of letters encountered as its result.  In  the  third
                 case, a result of ERR is returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Chkarg'   does   a  straightforward  argument  scan,  using
                 'getarg' to fetch each argument in turn.  The actions  taken
                 for each argument are simply those mentioned above.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 arg_num, result


            _C_a_l_l_s

                 getarg


            _S_e_e _A_l_s_o

                 getarg (2), getkwd (2)





            chkarg (2)                    - 1 -                    chkarg (2)


