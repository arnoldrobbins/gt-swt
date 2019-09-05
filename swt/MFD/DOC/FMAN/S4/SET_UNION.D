

            set_union (4) --- place union of two sets in a third     07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine set_union (set1, set2, destination)
                 pointer set1, set2, destination

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_union' computes the union of 'set1' and 'set2', placing
                 the  result  in  'destination'.   For  proper operation, all
                 three sets should be the same size.

                 All set manipulation routines make use of  dynamic  storage,
                 which  must  be  initialized  before  use.  See 'dsinit' for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid unique name conflicts with other routines, any  Ratfor
                 program  using the set routines should include the following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The set union is computed by logically 'or'ing the bit  vec-
                 tors associated with 'set1' and 'set2'.


            _B_u_g_s

                 Should work with sets of differing sizes.


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)


















            set_union (4)                 - 1 -                 set_union (4)


