

            mntoc (2) --- convert ASCII mnemonic to character        03/28/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 character function mntoc (buf, p, default)
                 character buf (ARB), default
                 integer p

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mntoc'  is  used to convert a standard ASCII mnemonic (e.g.
                 ACK, BEL, BS) into an ASCII character  code.   The  argument
                 'buf' is an EOS-terminated string presumed to contain either
                 a  single  character  or  a  two-  or  three-character ASCII
                 mnemonic (in either upper or lower case), starting at  posi-
                 tion 'p'.  The function return depends on the outcome of the
                 conversion  as  follows:   (1)  if  'buf'  contains only one
                 character, the function return is equivalent to that charac-
                 ter; (2) if 'buf' contains an ASCII mnemonic terminated by a
                 nonalphanumeric  character,  the  function  return  is   the
                 character code associated with that mnemonic; (3) otherwise,
                 the function return is equivalent to the character specified
                 as  the  third  argument  ('default').  In all cases, 'p' is
                 advanced to the first character beyond the presumed mnemonic
                 or single character.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The mnemonic is transferred to an internal character buffer,
                 then used in a binary search of a  string  table  containing
                 the ASCII mnemonics.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 p


            _C_a_l_l_s

                 mapstr, strbsr


            _S_e_e _A_l_s_o

                 ctomn










            mntoc (2)                     - 1 -                     mntoc (2)


