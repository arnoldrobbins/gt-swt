

            enter (2) --- place symbol in symbol table               03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function enter (symbol, info, table)
                 character symbol (ARB)
                 integer info (ARB)
                 pointer table

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Enter'  places  the  character-string  symbol  given as its
                 first argument, along with  the  information  given  in  its
                 second  argument,  into  the symbol table given as its first
                 argument.  The function return value (which  is  ignored  by
                 almost  everyone)  is  a pointer to the dynamic storage area
                 containing the text of the symbol.

                 The symbol table used must have been created by the  routine
                 'mktabl'.   The  size  of the info array must be at least as
                 large as the symbol table node  size,  determined  at  table
                 creation time.

                 Should  the  given  symbol  already be present in the symbol
                 table, its information field will simply be overwritten with
                 the new information.

                 'Enter' uses the dynamic storage management routines,  which
                 require initialization by the user; see 'dsinit' for further
                 details.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Enter'  calls  'st$lu'  to find the proper location for the
                 symbol.  If the symbol is not present in the table,  a  call
                 to  'dsget'  fetches  a  block of memory of sufficient size,
                 which is then linked onto the proper  chain  from  the  hash
                 table.   Once  the location of the node for the given symbol
                 is known, the contents of the information array  are  copied
                 into the node's information field.


            _C_a_l_l_s

                 st$lu, dsget, scopy


            _S_e_e _A_l_s_o

                 lookup  (2),  delete (2), mktabl (2), rmtabl (2), st$lu (6),
                 dsget (2), dsfree (2), dsinit (2), sctabl (2)





            enter (2)                     - 1 -                     enter (2)


