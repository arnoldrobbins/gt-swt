

            set_intersect (4) --- place intersection of two sets in a third  07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine set_intersect (set1, set2, destination)
                 pointer set1, set2, destination

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_intersect'  determines  the  intersection  of  the sets
                 given as its first two arguments and places  that  intersec-
                 tion  in  the  set  specified  by  the  third.   For  proper
                 operation, all three sets should be equal in size.

                 All set manipulation routines make use of  dynamic  storage,
                 which  must  be  initialized  before  use.  See 'dsinit' for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid unique name conflicts with other routines, any  Ratfor
                 program  using the set routines should include the following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Does a word-by-word logical 'and' of the bit vectors for the
                 first two sets, placing the result in the third.


            _B_u_g_s

                 Should be fixed to work with sets of differing lengths.


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)

















            set_intersect (4)             - 1 -             set_intersect (4)


