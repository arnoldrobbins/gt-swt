

            set_insert (4) --- place given element in a set          07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine set_insert (element, set)
                 integer element
                 pointer set

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_insert' is the primary means of placing a given element
                 in  a set.  'Element' must be an integer between one and the
                 maximum size of the set, inclusive; 'set' must be a  pointer
                 to  a  set data structure created by 'set_create'.  If it is
                 within range, the given element is marked "present"  in  the
                 bit vector associated with the set.

                 All  set  manipulation routines make use of dynamic storage,
                 which must be initialized  before  use.   See  'dsinit'  for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid  unique name conflicts with other routines, any Ratfor
                 program using the set routines should include the  following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If the element is out of range, a call to 'error' is made to
                 inform  the  user and terminate the program.  Otherwise, the
                 location of the element in the bit vector is determined  and
                 a  few  logical  operations are employed to set the selected
                 bit.


            _C_a_l_l_s

                 error


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)











            set_insert (4)                - 1 -                set_insert (4)


