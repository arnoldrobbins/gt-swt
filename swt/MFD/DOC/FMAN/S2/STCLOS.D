

            stclos (2) --- insert closure entry in pattern           05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function stclos (pat, j, lastj, lastcl)
                 character pat (MAXPAT)
                 integer j, lastj, lastcl

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Stclos'  inserts a closure entry into a pattern being built
                 by 'makpat'.  This involves shuffling the last pattern entry
                 far enough to allow a closure entry  to  be  inserted,  then
                 linking  the  closure entry to the last closure entry in the
                 pattern.  'Pat' is the  pattern  being  built;  'j'  is  the
                 current  end  of 'pat'; 'lastj' is the index in 'pat' of the
                 last element inserted (the one that  is  controlled  by  the
                 closure); 'lastcl' is the index of the last closure entry in
                 'pat'.   The  function  return is equal to 'lastj', which is
                 the index of the new closure after insertion is completed.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 A simple loop shuffles the last element down; several  calls
                 to 'addset' then create the closure entry and link it to the
                 previous closure.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 pat, j


            _C_a_l_l_s

                 addset


            _S_e_e _A_l_s_o

                 addset (2), makpat (2)















            stclos (2)                    - 1 -                    stclos (2)


