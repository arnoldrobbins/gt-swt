

            rduniq (1) --- remove duplicate tuples from a relation   08/03/81


            _U_s_a_g_e

                 rduniq


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rduniq'  is  part  of  the toy relational data base system,
                 'rdb'.  It removes duplicates from a sorted relation.  Stan-
                 dard input 1 must be directed to a file containing an  'rdb'
                 relation;  the  new  relation is written on standard output.
                 The input relation must be a file containing a relation that
                 was created by 'rdmake' or other 'rdb' program;  a  relation
                 cannot  be  read  from the terminal.  The output relation is
                 displayed in a readable format if standard output is  direc-
                 ted to a terminal (display in binary would be quite a mess);
                 otherwise,  the output relation is written in binary, inter-
                 nal format for processing by other 'rdb' programs.


            _E_x_a_m_p_l_e_s

                 sp.rel> rdproj sno | rdsort | rduniq | rdprint


            _M_e_s_s_a_g_e_s

                 "Can't access input relation"
                 "Sorry, a relation can't be read from the terminal"
                 "relation is corrupted!!"


            _B_u_g_s

                 If standard output is directed to "/dev/lps",  the  relation
                 is written in binary.


            _S_e_e _A_l_s_o

                 rdcat  (1), rdextr (1), rdjoin (1), rdmake (1), rdprint (1),
                 rdproj (1), rdsel (1), rdsort (1), rduniq (1)
















            rduniq (1)                    - 1 -                    rduniq (1)


