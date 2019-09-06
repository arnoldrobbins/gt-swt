

            set_remove (4) --- remove a set that is no longer needed  07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine set_remove (set)
                 pointer set

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_remove'  reclaims  the  dynamic storage space used by a
                 set data structure.  It is the inverse of 'set_create'.   To
                 prevent  dynamic  storage  space from becoming irretrievably
                 lost,  sets  should  always  be  removed  by   a   call   to
                 'set_remove' when they are no longer needed.

                 All  set  manipulation routines make use of dynamic storage,
                 which must be initialized  before  use.   See  'dsinit'  for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid  unique name conflicts with other routines, any Ratfor
                 program using the set routines should include the  following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Calls  'dsfree'  to throw away the storage space used by the
                 internal data structure.


            _C_a_l_l_s

                 dsfree


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4), dsinit  (2),  dsget  (2),
                 dsfree (2)















            set_remove (4)                - 1 -                set_remove (4)


