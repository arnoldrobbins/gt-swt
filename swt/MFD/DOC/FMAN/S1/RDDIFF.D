

            rddiff (1) --- take the difference of two relations      07/01/82


          | _U_s_a_g_e

          |      rddiff


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Rddiff'  is  part  of  the toy relational data base system,
          |      'rdb'.  It creates a new  relation  by  performing  the  set
          |      difference of the two relations specified as standard inputs
          |      1  and  2  and writes the new relation on standard output 1.
          |      Both relations  must  have  identical  descriptions  --  the
          |      domains must be identical and in the same order.

          |      The new relation is formed by examining both input relations
          |      and  retaining  those  rows  that  are in the first relation
          |      (standard input 1) but not in the second relation  (standard
          |      input  2).  The remaining rows of both relations are discar-
          |      ded.
          |      
          |           For example:
          |      
          |             p1.rel  --------------  p2.rel --------------
          |                     |code | name |         |code | name |
          |                     --------------         --------------
          |                     | 100 | pens |         | 100 | pens |
          |                     |-----|------|         |-----|------|
          |                     | 101 | ink  |         | 105 | ruler|
          |                     --------------         --------------
          |      
          |             p1.rel> p2.rel> rddiff >p.rel
          |      
          |                           p.rel --------------
          |                                 |code | name |
          |                                 --------------
          |                                 | 101 | ink  |
          |                                 --------------
          |      

          |      The input relations must be files containing relations  that
          |      were  created by 'rdmake' or other 'rdb' programs; relations
          |      cannot be read from the terminal.  The  output  relation  is
          |      displayed  in a readable format if standard output is direc-
          |      ted to a terminal; otherwise, the output relation is written
          |      in binary internal format  for  processing  by  other  'rdb'
          |      programs.


          | _E_x_a_m_p_l_e_s

          |      p1.rel> p2.rel> rddiff >p.rel
          |      p.des> newp.data> rdmake | p.rel> rddiff >newp.rel






            rddiff (1)                    - 1 -                    rddiff (1)




            rddiff (1) --- take the difference of two relations      07/01/82


          | _M_e_s_s_a_g_e_s

          |      "Sorry, a relation can't be read from the terminal"
          |      "relation is corrupted!!"
          |      "Can't access input relation 1"
          |      "Can't access input relation 2"
          |      "Relations must have identical descriptions"


          | _S_e_e _A_l_s_o

          |      rdcat  (1), rdextr (1), rdjoin (1), rdmake (1), rdprint (1),
          |      rdproj (1), rdsel (1), rdsort (1), rduniq  (1),  rdatt  (1),
          |      rdavg  (1),  rdcount  (1),  rddiv (1), rdint (1), rdmax (1),
          |      rdmin (1), rdnat (1), rdsum (1)











































            rddiff (1)                    - 2 -                    rddiff (1)


