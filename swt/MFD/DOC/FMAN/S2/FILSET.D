

            filset (2) --- expand character set, stop at delimiter   05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine filset (delim, array, i, set, j, maxset)
                 character delim, array (ARB), set (maxset)
                 integer i, j, maxset

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Filset'  expands a character class specification in 'array'
                 into a list of  characters  in  'set'.   'I'  specifies  the
                 starting  position  in 'array', 'j' gives the starting posi-
                 tion in 'set', and 'maxset' gives the maximum size of 'set'.
                 Expansion stops when there is insufficient room in 'set'  or
                 when  the  character  contained in 'delim' is encountered in
                 'array'.

                 Character sets consist of arbitrary characters,  two  lower-
                 case  letters  separated by a hyphen, two upper-case letters
                 separated by a hyphen, or two digits separated by a  hyphen.
                 The  last  three  cases  represent  a  range  of characters,
                 including the endpoints.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Ordinary characters are simply stuffed into 'set' with calls
                 to 'addset'.  The range notation is expanded by 'dodash'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 i, set, j


            _C_a_l_l_s

                 addset, esc, index, dodash


            _S_e_e _A_l_s_o

                 dodash (2), makpat (2)













            filset (2)                    - 1 -                    filset (2)


