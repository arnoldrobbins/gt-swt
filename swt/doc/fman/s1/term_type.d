

            term_type (1) --- print user's terminal type             02/22/82


            _U_s_a_g_e

                 term_type [ -[no]se | -[no]vth | -[no]lcase ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Term_type'  prints  a  mnemonic for the type of the current
                 user's terminal on standard output when it is called with no
                 arguments.  The mnemonic is  suitable  for  use  with  'se',
                 among other things.

                 If  one  of the other options is given, 'term_type' prints a
                 "1" or "0" to indicate whether or not the option is selected
                 for the terminal.  For instance, "term_type -se" prints  "1"
                 if the terminal is supported by 'se'.

                 If  no  terminal  type  has  been  specified  for the user's
                 terminal, the call to 'gtattr' or  'gttype'  in  'term_type'
                 will  request  the  terminal type from the user.  Otherwise,
                 'term_type' will use the remembered terminal type.


            _E_x_a_m_p_l_e_s

                 echo "Your terminal type: "[term_type]
                 if [term_type -se]
                    se [args]
                 else
                    ed [args]
                 fi


            _F_i_l_e_s

                 =termlist= for the terminal list.
                 =ttypes= for the legal terminal type list.


            _M_e_s_s_a_g_e_s

                 "Usage:  term_type ..."  for illegal arguments.

                 "No terminal  type  information  is  available".   For  some
                      reason  no terminal type is configured for the line and
                      the user has refused to supply a terminal type.


            _S_e_e _A_l_s_o

                 line (1), term (1), se (1), gtattr (2), gttype (2)







            term_type (1)                 - 1 -                 term_type (1)


