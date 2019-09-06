

            set_copy (4) --- make a copy of one set in another       07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine set_copy (source, destination)
                 pointer source, destination

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Set_copy'  duplicates  one  set  in  another.   For  proper
                 operation,  the  source  set  should  be  larger   than   or
                 equivalent  in  size to the destination set.  The source set
                 is not altered by the copy operation.

                 All set manipulation routines make use of  dynamic  storage,
                 which  must  be  initialized  before  use.  See 'dsinit' for
                 further information.

                 Note that all set manipulation routines have long names.  To
                 avoid unique name conflicts with other routines, any  Ratfor
                 program  using the set routines should include the following
                 statement:

          |           include "=src=/lib/math/swtmlb_link.r.i"


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Set_copy' uses the size field encoded in the first word  of
                 each  set to determine the number of words in the bit vector
                 to be copied.  A simple loop implements the copy.


            _B_u_g_s

                 Should handle sets of different sizes properly.


            _S_e_e _A_l_s_o

                 other set operations ('set_?*') (4)
















            set_copy (4)                  - 1 -                  set_copy (4)


