

            rdcat (1) --- concatenate two identical relations        08/03/81


            _U_s_a_g_e

                 rdcat


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rdcat'  is  part  of  the  toy relational data base system,
                 'rdb'.  It creates a new relation by concatenating  the  two
                 relations  specified  as  standard inputs 1 and 2 and writes
                 the new relation on standard output 1.  Both relations  must
                 have identical descriptions -- the domains must be identical
                 and in the same order.

                 The  input relations must be files containing relations that
                 were created by 'rdmake'; relations cannot be read from  the
                 terminal.   The  output  relation is displayed in a readable
                 format if standard output is directed to a terminal (display
                 in binary would be quite  a  mess);  otherwise,  the  output
                 relation  is  written in binary, internal format for proces-
                 sing by other 'rdb' programs.

                 Identical  tuples  are  not  removed  from   the   resulting
                 relations.    These   can  be  removed  using  'rdsort'  and
                 'rduniq'.


            _E_x_a_m_p_l_e_s

                 p1.rel> p2.rel> rdcat >p.rel
                 p.des> newp.data> rdmake | p.rel> rdcat >newp.rel


            _M_e_s_s_a_g_e_s

                 "Sorry, a relation can't be read from the terminal"
                 "Relation is corrupted!!"
                 "Can't access input relation 1"
                 "Can't access input relation 2"
                 "Relations must have identical descriptions"


            _B_u_g_s

                 It would be nice if the relations only had to have the  same
                 structure to be concatenated.

                 If  standard  output is directed to "/dev/lps", the relation
                 is written in binary.


            _S_e_e _A_l_s_o

                 rdcat (1), rdextr (1), rdjoin (1), rdmake (1), rdprint  (1),
                 rdproj (1), rdsel (1), rdsort (1), rduniq (1)



            rdcat (1)                     - 1 -                     rdcat (1)


