

            lsfree (4) --- free linked string space                  03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine lsfree (ptr, len)
                 pointer ptr
                 integer len

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 The  first 'len' characters of the string specified by 'ptr'
                 are deallocated.  'Ptr' is updated to point to the remaining
                 characters.  If no characters remain ('len' is  longer  than
                 the string) 'ptr' is set to zero.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  string  is  traversed, setting all visited locations to
                 the value UNUSED, until 'len' characters or an EOS has  been
                 passed.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr


            _B_u_g_s

                 Space is not available for reuse until after garbage collec-
                 tion.  This is done to avoid pointer fragmentation.

                 'Lsfree' is used for returning strings to the free list.  It
                 is not careful with pointers, so it should usually be called
                 only  to  completely deallocate a string (i.e.  "call lsfree
                 (ptr, ALL)").

                 Locally supported.


            _S_e_e _A_l_s_o

                 lsallo (4)













            lsfree (4)                    - 1 -                    lsfree (4)


