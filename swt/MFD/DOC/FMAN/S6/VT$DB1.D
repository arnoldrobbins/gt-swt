

            vt$db1 (6) --- print mnemonics for special characters    07/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine vt$db1 (title, seq)
                 character title (ARB), seq (ARB)

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$db1' is used to print out a label in 'title', along with
                 the   mnemonics  for  the  special  (unprintable)  character
                 sequence in 'seq'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Print' is called to output 'title'; then each character  in
                 'seq',  up  to the first EOS, is converted to its associated
                 mnemonic and printed out.  All output is written to ERROUT.


            _C_a_l_l_s

                 ctomn, print


            _B_u_g_s

                 Not to be called by the normal user.

                 Mainly used for debugging of the VTH package.


            _S_e_e _A_l_s_o

                 other vt?* routines (2) and (6)





















            vt$db1 (6)                    - 1 -                    vt$db1 (6)


