

            rddiv (1) --- perform the division of two relations      07/01/82


          | _U_s_a_g_e

          |      rddiv


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Rddiv'  is  part  of  the  toy relational data base system,
          |      'rdb'.  It creates a new  relation  by  performing  the  set
          |      division of the two relations specified as standard inputs 1
          |      and 2 and writes the resulting new relation on standard out-
          |      put.

          |      Standard  input  1  is the dividend, standard input 2 is the
          |      divisor, and standard output (the resulting relation) is the
          |      quotient.  The  quotient  consists  of  those  rows  of  the
          |      dividend, projected onto the attributes not in the division,
          |      whose  corresponding  attributes  include  every  row of the
          |      divisor.  In other  words,  a  row  X  will  appear  in  the
          |      quotient  if  and  only  if  the  pair  <X,Y> appears in the
          |      dividend for all rows Y appearing in the divisor.
          |      
          |           For example:
          |      
          |             p1.rel  --------------      p2.rel --------
          |                     |code | name |             | name |
          |                     --------------             --------
          |                     | 100 | pens |             | pens |
          |                     |-----|------|             |------|
          |                     | 100 | ink  |             | ink  |
          |                     |-----|------|             --------
          |                     | 100 | ruler|
          |                     |-----|------|
          |                     | 101 | pens |
          |                     |-----|------|
          |                     | 101 | paper|
          |                     |-----|------|
          |                     | 102 | ink  |
          |                     |-----|------|
          |                     | 103 | ink  |
          |                     |-----|------|
          |                     | 103 | pens |
          |                     --------------
          |      
          |      
          |             p1.rel> p2.rel> rddiv >p.rel
          |      
          |                           p.rel -------
          |                                 | code |
          |                                 --------
          |                                 | 100  |
          |                                 |------|
          |                                 | 103  |
          |                                 --------
          |      



            rddiv (1)                     - 1 -                     rddiv (1)




            rddiv (1) --- perform the division of two relations      07/01/82


          |      The input relations must be files containing relations  that
          |      were  created by 'rdmake' or other 'rdb' programs; relations
          |      cannot be read from the terminal.  The  output  relation  is
          |      displayed  in a readable format if standard output is direc-
          |      ted to the terminal; otherwise, the output relation is writ-
          |      ten in binary internal format for processing by other  'rdb'
          |      programs.

          |      Identical   tuples   are  not  removed  from  the  resulting
          |      relation.  These can be removed using 'rdsort' and 'rduniq'.


          | _E_x_a_m_p_l_e_s

          |      p1.rel> p2.rel> rddiv >p.rel
          |      p1.rel> p2.rel> rddiv | rdsort | rduniq | rdprint


          | _M_e_s_s_a_g_e_s

          |      "Sorry, a relation can't be read from the terminal"
          |      "relation is corrupted!!"
          |      "Cannot load input relation 1"
          |      "Cannot load input relation 2"
          |      "Relation 2 has domain not defined in relation 1"
          |      "Couldn't rewind sort file 1"
          |      "Couldn't rewind sort file 2"
          |      "Error on sort file 2"


          | _S_e_e _A_l_s_o

          |      rdcat (1), rdextr (1), rdjoin (1), rdmake (1), rdprint  (1),
          |      rdproj  (1),  rdsel  (1), rdsort (1), rduniq (1), rdatt (1),
          |      rdavg (1), rdcount (1), rddiff (1), rdint  (1),  rdmax  (1),
          |      rdmin (1), rdnat (1), rdsum (1)






















            rddiv (1)                     - 2 -                     rddiv (1)


