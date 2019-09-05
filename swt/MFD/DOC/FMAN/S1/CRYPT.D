

            crypt (1) --- exclusive-or encryption and decryption     12/26/80


            _U_s_a_g_e

                 crypt [ <key> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Crypt'  encrypts  data  from its first standard input based
                 upon an encryption key supplied as an argument,  and  writes
                 the result on its first standard output.

                 'Crypt'  uses  a reversible "exclusive-or" algorithm so that
                 cipher text encrypted with a given key may be decoded  using
                 the same key.

                 If  the <key> is omitted from the command, 'crypt' turns off
                 the terminal echo and prompts for the key from the terminal.


            _E_x_a_m_p_l_e_s

                 sensitive_data> crypt bogus-key >safe_data
                 secret_message> crypt turkey


            _M_e_s_s_a_g_e_s

                 "Key:  " for a missing key






























            crypt (1)                     - 1 -                     crypt (1)


