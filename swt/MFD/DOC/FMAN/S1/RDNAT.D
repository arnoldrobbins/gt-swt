

            rdnat (1) --- perform the natural join of two relations  07/01/82


          | _U_s_a_g_e

          |      rdnat


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Rdnat'  is  part  of  the  toy relational data base system,
          |      'rdb'.  It creates a new relation by performing the  natural
          |      join of the two relations specified as standard inputs 1 and
          |      2  and  writes the resulting new relation on standard output
          |      1.

          |      The   new    relation    is    formed    (effectively)    by
          |      "pasting together"  tuples of relation 1 and relation 2 hav-
          |      ing the same  values  on  the  same  attributes.   Identical
          |      tuples  are  not removed from the resulting relation.  These
          |      can be removed by using 'rdsort' and 'rduniq'.
          |      
          |           For example:
          |      
          |             p1.rel  --------------  p2.rel --------------
          |                     |code | name |         |code | loc  |
          |                     --------------         --------------
          |                     | 100 | pens |         | 100 | rear |
          |                     |-----|------|         |-----|------|
          |                     | 101 | ink  |         | 105 | front|
          |                     --------------         --------------
          |      
          |             p1.rel> p2.rel> rdnat >p.rel
          |      
          |                        p.rel ---------------------
          |                              |code | name | loc  |
          |                              ---------------------
          |                              | 100 | pens | rear |
          |                              ---------------------
          |      

          |      The input relations must be files containing relations  that
          |      were  created by 'rdmake' or other 'rdb' programs; relations
          |      cannot be read from the terminal.  The  output  relation  is
          |      displayed  in a readable format if standard output is direc-
          |      ted to a terminal; otherwise, the output relation is written
          |      in binary internal format  for  processing  by  other  'rdb'
          |      programs.


          | _E_x_a_m_p_l_e_s

          |      p1.rel> p2.rel> rdnat >p.rel
          |      p1.rel> p2.rel> rdnat | rdsort | rduniq | rdprint


          | _M_e_s_s_a_g_e_s

          |      "Sorry, a relation can't be read from the terminal"


            rdnat (1)                     - 1 -                     rdnat (1)




            rdnat (1) --- perform the natural join of two relations  07/01/82


          |      "relation is corrupted!!"
          |      "Cannot load input relation 1"
          |      "Cannot load input relation 2"
          |      "Resulting relation has too many domains"
          |      "in add_field_to_rd; bogus type passed"
          |      "field not found"


          | _S_e_e _A_l_s_o

          |      rdcat  (1), rdextr (1), rdjoin (1), rdmake (1), rdprint (1),
          |      rdproj (1), rdsel (1), rdsort (1), rduniq  (1),  rdatt  (1),
          |      rdavg  (1),  rdcount  (1), rddiff (1), rdint (1), rddiv (1),
          |      rdmax (1), rdmin (1), rdsum (1)












































            rdnat (1)                     - 2 -                     rdnat (1)


