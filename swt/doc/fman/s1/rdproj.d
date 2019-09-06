

            rdproj (1) --- project a relation                        02/22/82


            _U_s_a_g_e

                 rdproj { <new domain> }
                    <new domain> ::= <domain> [ = <domain> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rdproj'  is part of the toy relational data base management
                 system  'rdb'.   It  projects  a  relation  over   specified
                 domains.   Standard  input  1  must  be  directed  to a file
                 containing an 'rdb' relation.  A new relation is created and
                 written to standard output.  The input relation  must  be  a
                 file  containing  a relation that was created by 'rdmake' or
                 other 'rdb' programs; a relation cannot  be  read  from  the
                 terminal.   The  output  relation is displayed in a readable
                 format if standard output is directed to a terminal (display
                 in binary would be quite  a  mess);  otherwise,  the  output
                 relation  is  written in binary, internal format for proces-
                 sing by other 'rdb' programs.

                 Domains are projected in the order specified on the  command
                 line.    A  domain  can  be  renamed  by  using  the  syntax
                 "<old>=<new>".  Identical tuples are not  removed  from  the
                 resulting  relations.   These  can be removed using 'rdsort'
                 and 'rduniq'.


            _E_x_a_m_p_l_e_s

                 p.rel> rdproj pname=name color city | rdsort | rduniq
                 sp.rel> rdproj pno=no | rdsort | rduniq


            _M_e_s_s_a_g_e_s

                 "Can't access input relation"
                 "Sorry, a relation can't be read from the terminal"
                 "Relation is corrupted!!"
                 "Too many fields in new relation"
                 "<domain>:  invalid name"
                 "<domain>:  field not found"
                 "<domain>:  duplicate field"
                 "<domain>:  cannot add new field"


            _B_u_g_s

                 If standard output is directed to "/dev/lps",  the  relation
                 is written in binary.
                 
                 If  a single domain is to be renamed, all other domains must
                 be named in the argument list.





            rdproj (1)                    - 1 -                    rdproj (1)




            rdproj (1) --- project a relation                        02/22/82


            _S_e_e _A_l_s_o

                 rdcat (1), rdextr (1), rdjoin (1), rdmake (1), rdprint  (1),
                 rdproj (1), rdsel (1), rdsort (1), rduniq (1)






















































            rdproj (1)                    - 2 -                    rdproj (1)


