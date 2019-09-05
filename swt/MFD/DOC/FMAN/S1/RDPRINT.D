

            rdprint (1) --- print a relation or relation descriptor  08/03/81


            _U_s_a_g_e

                 rdprint { -d | -r }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rdprint' is part of the toy relational data base management
                 system  'rdb'.   It  displays  a  relation in readable form.
                 Standard input 1 must be directed to a  file  containing  an
                 'rdb'  relation.  The input relation must be a file contain-
                 ing relation that was created by  'rdmake'  or  other  'rdb'
                 programs; a relation cannot be read from the terminal.

                 Printable  output  is produced on standard output.  The "-d"
                 option indicates that only the relation description is to be
                 displayed; the "-r" option indicates that only the  relation
                 data  is  to  be  displayed.   If  both  or neither of these
                 options are present,  both  the  description  and  data  are
                 displayed.


            _E_x_a_m_p_l_e_s

                 p.rel> rdprint -d
                 p.rel> rdproj pname pno | rdsort | rduniq | rdprint -r


            _M_e_s_s_a_g_e_s

                 "Usage:  rdprint (-d | -r)"
                 "Sorry, a relation can't be read from the terminal"
                 "Can't access input relation"
                 "relation is corrupted!!"


            _B_u_g_s

                 Relations  more  than  80  columns wide display badly on the
                 terminal.


            _S_e_e _A_l_s_o

                 rdcat (1), rdextr (1), rdjoin (1), rdmake (1), rdprint  (1),
                 rdproj (1), rdsel (1), rdsort (1), rduniq (1)












            rdprint (1)                   - 1 -                   rdprint (1)


