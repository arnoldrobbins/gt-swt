

            rdsort (1) --- sort a relation                           02/22/82


            _U_s_a_g_e

                 rdsort { <domain> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rdsort'  is  part  of  the toy relational data base system,
                 'rdb'.  It sorts the tuples in a  relation  on  the  domains
                 specified  in  the  argument list.  Standard input 1 must be
                 directed to a file containing an 'rdb' relation; the  sorted
                 relation  is written on standard output.  The input relation
                 must be a file containing a relation  that  was  created  by
                 'rdmake'  or  other 'rdb' program; a relation cannot be read
                 from the terminal.  The output relation is  displayed  in  a
                 readable format if standard output is directed to a terminal
                 (display  in  binary  would be quite a mess); otherwise, the
                 output relation is written in binary,  internal  format  for
                 processing by other 'rdb' programs.

                 The  relation  is  sorted  on  the  domains specified in the
          |      argument list.  Integer  and  real  domains  are  sorted  in
          |      numeric  order;  string domains are sorted in the ASCII col-
                 lating sequence.  If no arguments are specified,  the  rela-
                 tion  is  sorted  on all domains in the order they appear in
                 the relation.


            _E_x_a_m_p_l_e_s

                 p.rel> rdsort color >np.rel
                 sp.rel> rdproj sno | rdsort | rduniq | rdprint


            _M_e_s_s_a_g_e_s

                 "Can't access input relation"
                 "Sorry, a relation can't be read from the terminal"
                 "Relation is corrupted!!"
                 "Too many sort keys"
                 "<domain>:  field not defined"


            _B_u_g_s

                 If standard output is directed to "/dev/lps",  the  relation
                 is written in binary.


            _S_e_e _A_l_s_o

                 rdcat  (1), rdextr (1), rdjoin (1), rdmake (1), rdprint (1),
                 rdproj (1), rdsel (1), rdsort (1), rduniq (1)





            rdsort (1)                    - 1 -                    rdsort (1)


