

            set_subset (4) --- return TRUE if set1 is a subset of set2  07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 logical function set_subset (set1, set2)
                 pointer set1, set2

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_subset' returns the logical value '.true.'  if and only
                 if its first argument points to a set that is a subset of or
                 equal  to  the  set  pointed to by its second argument.  The
                 sets need not be of equal length.

                 All set manipulation routines make use of  dynamic  storage,
                 which  must  be  initialized  before  use.  See 'dsinit' for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid unique name conflicts with other routines, any  Ratfor
                 program  using the set routines should include the following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 If one set is larger than the other, it is checked  to  make
                 sure that none of the higher-order elements is present.  The
                 subset  condition  is then true if and only if every element
                 of 'set1' is also an element of 'set2',  a  statement  which
                 can  be  checked  a  word  at a time with the proper logical
                 operations.


            _C_a_l_l_s

                 set_element


            _S_e_e _A_l_s_o

                 other set routines ('set_?*') (4)













            set_subset (4)                - 1 -                set_subset (4)


