

            invmod (4) --- find inverse of an integer modulo another integer  07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 long_int function invmod (x1, x0)
                 long_int x1, x0

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Invmod'  is used to find the inverse of 'x1' in the ring of
                 integers modulo 'x0'.  The function return is the inverse if
                 it could  be  found,  or  ERR  if  'x1'  and  'x0'  are  not
                 relatively prime.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Invmod'  uses a variant of Euclid's greatest common divisor
                 algorithm.


            _B_u_g_s

                 Rational behavior for nonpositive  arguments  has  not  been
                 established.

                 Locally supported.


            _S_e_e _A_l_s_o

                 gcd (4)

























            invmod (4)                    - 1 -                    invmod (4)


