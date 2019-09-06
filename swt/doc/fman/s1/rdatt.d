

            rdatt (1) --- list the attributes of a relation          07/01/82


          | _U_s_a_g_e

          |      rdatt {<option>}
          |      <option> ::= -t | -l | -n


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Rdatt'  is  part  of  the  toy relational data base system,
          |      'rdb'.  It lists the attributes of a relation, specified  as
          |      standard input, on standard output.  The input relation must
          |      be a file containing a relation that was created by 'rdmake'
          |      or another 'rdb' program; a relation cannot be read from the
          |      terminal.

          |      If  no options are specified then the type, length, and name
          |      of each attribute are listed on one line for each attribute.
          |      If any of the options 't', 'l', or 'n' (type, length,  name)
          |      are  specified,  then only the characteristics corresponding
          |      to the requested option will be listed.


          | _E_x_a_m_p_l_e_s

          |      p1.rel> rdatt
          |      p2.rel> rdatt -tn >attrlist


          | _M_e_s_s_a_g_e_s

          |      "Sorry, a relation can't be read from the terminal"
          |      "Can't access input relation"
          |      "relation is corrupted!!"


          | _S_e_e _A_l_s_o

          |      rdcat (1), rdextr (1), rdjoin (1), rdmake (1), rdprint  (1),
          |      rdproj (1), rdsel (1), rdsort (1), rduniq (1)



















            rdatt (1)                     - 1 -                     rdatt (1)


