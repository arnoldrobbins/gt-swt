

            whois (1) --- find the user associated with a login name  02/22/82


            _U_s_a_g_e

                 whois (- | { <login-name> })


            _D_e_s_c_r_i_p_t_i_o_n

                 'Whois' is used to determine the name of the user associated
                 with  a  particular  login name.  The most frequent usage is
                 "whois  <login_name>",  which  looks  up  the   login   name
                 specified  and  prints  the  name  of its owner.  If the "-"
                 option is specified, 'whois' prints the  entire  name  list.
                 If  no  argument  is  given, 'whois' accepts a list of login
                 names from standard input and prints the name of  the  owner
                 of each.


            _E_x_a_m_p_l_e_s

                 whois -
          |      whois - | pg
                 whois allen perry dan


            _F_i_l_e_s

          |      =userlist= for name list


          | _B_u_g_s

          |      Has  a  grubby output format due to the incredibly long user
          |      login names.


            _S_e_e _A_l_s_o

                 us (1), vfyusr (2), who (3)




















            whois (1)                     - 1 -                     whois (1)


