

            mktabl (2) --- make a symbol table                       03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function mktabl (nodesize)
                 integer nodesize

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mktabl'  creates  a  symbol  table  for manipulation by the
                 routines 'enter', 'lookup',  'delete',  and  'rmtabl'.   The
                 symbol  table  is a general means of associating data with a
                 symbol identified by a character string.  The sole  argument
                 to  'mktabl' is the number of (integer) words of information
                 that are to be associated with each  symbol.   The  function
                 return is the address of the symbol table in dynamic storage
                 space (see 'dsinit' and 'dsget').  This value must be passed
                 to  the  other  symbol  table  routines to select the symbol
                 table to be manipulated.

                 Note that dynamic storage space must  be  initialized  by  a
                 call to 'dsinit' before using any symbol table routines.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Mktabl' calls 'dsget' to allocate space for a hash table in
                 dynamic memory.  Each entry in the hash table is the head of
                 a  linked  list  (with  zero  used as a null link) of symbol
                 table nodes.  'Mktabl' also records the  nodesize  specified
                 by the user, so 'enter' will know how much space to allocate
                 when a new symbol is entered in the table.


            _C_a_l_l_s

                 dsget


            _S_e_e _A_l_s_o

                 enter  (2),  lookup  (2), delete (2), rmtabl (2), st$lu (6),
                 dsget (2), dsfree (2), dsinit (2), sctabl (2)














            mktabl (2)                    - 1 -                    mktabl (2)


