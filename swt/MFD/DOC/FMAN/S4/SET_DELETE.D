

            set_delete (4) --- remove given element from a set       07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine set_delete (element, set)
                 integer element
                 pointer set

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_delete'  is  used to remove a given element from a set.
                 The first argument is the element (an  integer  between  one
                 and  the maximum set size, inclusive), and the second is the
                 set from which it is to be removed.

                 All set manipulation routines make use of  dynamic  storage,
                 which  must  be  initialized  before  use.  See 'dsinit' for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid unique name conflicts with other routines, any  Ratfor
                 program  using the set routines should include the following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The element selected is compared to the size  field  of  the
                 set;  if  invalid,  'set_delete' prints an error message and
                 terminates the program.   Otherwise,  the  position  of  the
                 element  in  the  bit  vector  is calculated, and the bit is
                 reset by straightforward logical operations.


            _C_a_l_l_s

                 error


            _S_e_e _A_l_s_o

                 other set operations ('set_?*') (4)













            set_delete (4)                - 1 -                set_delete (4)


