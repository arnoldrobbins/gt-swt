

            set_element (4) --- see if a given element is in a set   07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function set_element (element, set)
                 integer element
                 pointer set

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_element'  returns 1 if 'element' is a member of the set
                 'set', 0 otherwise.   The  argument  'element'  must  be  an
                 integer  from  1  to the maximum size of the set, inclusive.
                 The argument 'set' must have been  created  beforehand  with
                 'set_create'.

                 All  set  manipulation routines make use of dynamic storage,
                 which must be initialized  before  use.   See  'dsinit'  for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid  unique name conflicts with other routines, any Ratfor
                 program using the set routines should include the  following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If  'element'  is not in the range of allowable set elements
                 for the given set, the program is terminated by  a  call  to
                 'error'.   Otherwise, the location of the element in the bit
                 vector is calculated, and the function returns the value  of
                 the bit at that position.


            _C_a_l_l_s

                 error


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)












            set_element (4)               - 1 -               set_element (4)


