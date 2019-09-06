

            lookup (2) --- retrieve information from a symbol table  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function lookup (symbol, info, table)
                 character symbol (ARB)
                 untyped info (ARB)
                 pointer table

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Lookup'  examines  the  symbol  table  given  as  its third
                 argument for the presence  of  the  character-string  symbol
                 given  as its first argument.  If the symbol is not present,
                 'lookup' returns  'NO'.   If  the  symbol  is  present,  the
                 information  associated  with it is copied into the informa-
                 tion array passed as the second argument  to  'lookup',  and
                 'lookup' returns 'YES'.

                 The  symbol table used must have been created by the routine
                 'mktabl'.  The size of the  information  array  must  be  at
                 least  as  great as the symbol table node size, specified at
                 its creation.

                 Note that all symbol  table  routines  use  dynamic  storage
                 space, which must have been previously initialized by a call
                 to 'dsinit'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Lookup' calls 'st$lu' to determine the location of the sym-
                 bol in the table.  If 'st$lu' returns NO, then the symbol is
                 not  present,  and 'lookup' returns NO.  Otherwise, 'lookup'
                 copies the information field from the  appropriate  node  of
                 the symbol table into the information array and returns YES.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 info


            _C_a_l_l_s

                 st$lu


            _S_e_e _A_l_s_o

                 enter  (2),  delete  (2), mktabl (2), rmtabl (2), st$lu (6),
                 sctabl (2), dsinit (2), dsget (2), dsfree (2)





            lookup (2)                    - 1 -                    lookup (2)


