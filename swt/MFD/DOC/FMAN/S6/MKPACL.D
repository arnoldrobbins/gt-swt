

            mkpacl (6) --- encode ACL information into a Primos structure  09/04/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      subroutine mkpacl

          |      Library: vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Mkpacl'  converts  ACL  information  like  that returned by
          |      'gtacl$' into Primos  ACL  information  in  the  ACL  common
          |      block.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      The  ACL common block is scanned for information and encoded
          |      into an EOS-terminated string a character at a  time.   When
          |      finished,  a  call to 'ctov' converts the information into a
          |      form that Primos can use.


          | _C_a_l_l_s

          |      ctoc (2), ctov (2), encode (2)


          | _S_e_e _A_l_s_o

          |      lacl (1), sacl (1), gfdata (2), sfdata (2)




























            mkpacl (6)                    - 1 -                    mkpacl (6)


