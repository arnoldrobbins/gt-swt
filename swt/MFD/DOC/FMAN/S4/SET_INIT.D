

            set_init (4) --- cause a set to be empty                 07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine set_init (set)
                 pointer set

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_init'  initializes  a  set created by 'set_create'.  An
                 initialized set is empty, i.e.  contains no members.

                 All set manipulation routines make use of  dynamic  storage,
                 which  must  be  initialized  before  use.  See 'dsinit' for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid unique name conflicts with other routines, any  Ratfor
                 program  using the set routines should include the following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Set_init' simply clears all elements of the bit vector por-
                 tion of the data structure addressed by its first argument.


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)
























            set_init (4)                  - 1 -                  set_init (4)


