

            parsa$ (6) --- parse ACL changes in the common block     09/04/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function parsa$ (str)
          |      character str (ARB)

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Parsa$'  compares the protections given in 'str' with those
          |      already in the common block and modifies the common block to
          |      reflect the changes.  If the changes are made, the  function
          |      return is OK, otherwise the function returns ERR.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Parsa$'  goes  through  'str'  one  pair at a time, calling
          |      'lookac' to locate a corresponding name and  then  comparing
          |      the  differences.   It  then  changes  the  common  block to
          |      reflect any modifications  that  have  been  made  and  goes
          |      through  and  removes any deleted entries.  If there are any
          |      parse errors or erroneous attributes in 'str'  the  function
          |      returns ERR.


          | _C_a_l_l_s

          |      equal (2), lookac (6), scopy (2)


          | _S_e_e _A_l_s_o

          |      lacl (1), sacl (1), gfdata (2), sfdata (2)























            parsa$ (6)                    - 1 -                    parsa$ (6)


