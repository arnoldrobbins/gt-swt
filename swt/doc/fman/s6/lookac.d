

            lookac (6) --- look up a name in the ACL common block    09/04/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function lookac (name)
          |      character name (ARB)

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Lookac' returns the index of 'name' in the ACL common block
          |      or ERR if 'name' is not located.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      A  linear  search  is  used to scan the common block for the
          |      name.  If the name is found, its index is  returned,  other-
          |      wise the routine returns ERR.


          | _C_a_l_l_s

          |      equal (2)


          | _S_e_e _A_l_s_o

          |      lacl (1), sacl (1), gfdata (2), sfdata (2)





























            lookac (6)                    - 1 -                    lookac (6)


