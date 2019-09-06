

            mksacl (6) --- encode ACL information into a SWT structure  09/04/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function mksacl (path, pairs, type, sep)
          |      character path (ARB), pairs (ARB), sep (ARB)
          |      integer type

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Mksacl'  converts  ACL  information  like  that returned by
          |      'gtacl$' into SWT ACL information in the ACL  common  block.
          |      The  name  of the pathname is returned in 'path', the string
          |      containing the access pairs is returned in 'pairs', and  the
          |      type is returned in 'type'.  'Sep' is a string that is to be
          |      placed  between  each  of  the  access  pairs.  The function
          |      return is the number of characters in 'pairs'.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The ACL common block is scanned for information and  encoded
          |      into  'pairs'.  After each pair is entered, 'sep' is encoded
          |      into the string.  The number of characters  is  returned  as
          |      the function return.


          | _C_a_l_l_s

          |      ctoc (2), encode (2)


          | _S_e_e _A_l_s_o

          |      lacl (1), sacl (1), gfdata (2), sfdata (2)






















            mksacl (6)                    - 1 -                    mksacl (6)


