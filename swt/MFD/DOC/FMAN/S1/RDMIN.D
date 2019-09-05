

            rdmin (1) --- find the minimum value of a specified attribute  07/01/82


          | _U_s_a_g_e

          |      rdmin [<selection expr>] <attr>


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Rdmin'  is  part of the toy relational data base management
          |      system, 'rdb'.  It finds the minimum value  of  a  specified
          |      attribute  over  all  rows  of the relation that satisfy the
          |      optional select expression.   If  no  select  expression  is
          |      given  then  it finds the minimum value of an attribute over
          |      all rows of the relation.  Standard input 1 must be directed
          |      to a file containing an 'rdb' relation.  The result is writ-
          |      ten to standard output.

          |      The input relation must be a file containing a relation that
          |      was created by 'rdmake' or other 'rdb' programs;  the  rela-
          |      tion  cannot  be read from the terminal.  The select expres-
          |      sion is formed from the logical  operators  "&"  (and),  "|"
          |      (or), and "~" (not) connecting relational conditions involv-
          |      ing two domains or a domain and a literal.


          | _E_x_a_m_p_l_e_s

          |      p.rel> rdmin size
          |      p.rel> rdmin "color='red'" cost


          | _M_e_s_s_a_g_e_s

          |      "Sorry, a relation can't be read from the terminal"
          |      "relation is corrupted!!"
          |      "Cannot load input relation"
          |      "Usage:  rdmin [<selection expr>] <attr>"
          |      "Domain not found"
          |      "No rows satisfy selection expression"
          |      "Invalid expression"
          |      "expected domain name or literal"


          | _S_e_e _A_l_s_o

          |      rdcat  (1), rdextr (1), rdjoin (1), rdmake (1), rdprint (1),
          |      rdproj (1), rdsel (1), rdsort (1), rduniq  (1),  rdatt  (1),
          |      rdavg  (1),  rdcount  (1), rddiff (1), rddiv (1), rdint (1),
          |      rdmax (1), rdnat (1), rdsum (1)










            rdmin (1)                     - 1 -                     rdmin (1)


