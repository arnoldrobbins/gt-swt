

            set_create (4) --- generate a new, initially empty set   07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function set_create (set, size)
                 pointer set
                 integer size

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_create'  is  used  to  create a Pascal-style bit vector
                 representation for a set of integers from 1 to 'size'.   The
                 function  return  and  the  variable  'set'  are  set to the
                 address in dynamic storage of the newly-created set.

                 All set manipulation routines make use of  dynamic  storage,
                 which  must  be  initialized  before  use.  See 'dsinit' for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid unique name conflicts with other routines, any  Ratfor
                 program  using the set routines should include the following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Set_create' calls 'dsget' to obtain a contiguous  array  of
                 16-bit  words that is large enough to represent a bit vector
                 with 'size' elements.  The first word of this array  is  set
                 to  'size'  for  use  by other set manipulation routines.  A
                 call to 'set_init' then insures that the new set is empty.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 set


            _C_a_l_l_s

                 dsget, set_init


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)








            set_create (4)                - 1 -                set_create (4)


