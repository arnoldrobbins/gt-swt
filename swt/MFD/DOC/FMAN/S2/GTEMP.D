

            gtemp (2) --- parse a template into name and definition  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gtemp (str, nm, repl)
                 character str (ARB), nm (MAXARG), repl (MAXARG)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gtemp'  takes  a NEWLINE or EOS terminated character string
                 in 'str' and assigns the first blank-delimited token to 'nm'
                 and the remaining characters of the string to 'repl'.  Lead-
                 ing and trailing blanks  are  removed  from  both  'nm'  and
                 'repl'.  Ratfor-style (beginning with a sharp sign) comments
                 are  also  ignored.   If  the  input string consists only of
                 blanks and comments, 'gtemp' returns EOF and 'nm' and 'repl'
                 are unmodified; otherwise 'gtemp' returns OK.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gtemp' first removes any trailing comments  (begun  with  a
                 sharp  sign,  as  in Ratfor) and leading and trailing blanks
                 from the string.  It then selects the first  blank-delimited
                 token  from the string, and assigns it to 'nm'.  Then, after
                 removing intervening blanks, 'gtemp' assigns  the  remaining
                 characters of the string to 'repl'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 nm, repl


            _S_e_e _A_l_s_o

                 ldtmp$ (6)




















            gtemp (2)                     - 1 -                     gtemp (2)


