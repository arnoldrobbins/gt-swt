

            pwrmod (4) --- calculate an exponential modulo a given modulus  07/20/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 long_int function pwrmod (p, e, n)
                 long_int p, e, n

          |      Library: vswtmath (Subsystem mathematical library)


            _F_u_n_c_t_i_o_n

                 'Pwrmod' is used to perform an integer exponentiation in the
                 ring  of  integers modulo a given modulus.  The argument 'p'
                 is the base of the expression, 'e' is the exponent, and  'n'
                 the modulus.  The function return is p**E (mod n).


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Pwrmod'  examines  the  exponent a bit a time, squaring the
                 intermediate result accumulated so far and multiplying it by
                 the base whenever the selected bit is a 1.   Each  operation
                 is  performed modulo 'n', so that intermediate results don't
                 become excessively large.


            _S_e_e _A_l_s_o

                 invmod (4)






























            pwrmod (4)                    - 1 -                    pwrmod (4)


