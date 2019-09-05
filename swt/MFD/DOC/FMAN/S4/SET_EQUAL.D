

            set_equal (4) --- return TRUE if two sets contain the same members  07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 logical function set_equal (set1, set2)
                 pointer set1, set2

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_equal' determines if two sets contain the same members.
                 The sets need not be of equal length.

                 All  set  manipulation routines make use of dynamic storage,
                 which must be initialized  before  use.   See  'dsinit'  for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid  unique name conflicts with other routines, any Ratfor
                 program using the set routines should include the  following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Set_equal'  makes  two calls on 'set_subset'.  The function
                 return is true if 'set1' is a subset of 'set2' and 'set2' is
                 a subset of 'set1', false otherwise.


            _C_a_l_l_s

                 set_subset


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)


















            set_equal (4)                 - 1 -                 set_equal (4)


