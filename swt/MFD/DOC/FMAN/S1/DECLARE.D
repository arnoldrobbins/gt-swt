

            declare (1) --- create shell variables                   09/11/84


          | _U_s_a_g_e

                 declare { <identifier> [ = <value> ] }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Declare'  is the primary method of creating shell variables
                 with local (i.e., to the command file) scope.  Its arguments
                 are the names of the variables  to  be  declared;  they  are
                 declared  at  the  current  lexical  level  and assigned the
                 specified values.   If  a  value  is  not  specified  for  a
          |      variable,  it  is  given the empty string as a value.  Value
          |      may contain unprintable characters  in  a  mnemonic  format.
          |      The  format  is  '<'  ascii_mnemonic '>'.  To set dummy to a
          |      dash followed by a control-g and then another dash one would
          |      say:

          |           declare dummy = "-<bel>-".

          |      The quotes are needed to prevent the shell from interpreting
          |      the  '<'  and  '>'  signs  as  I/O  redirectors.   Variables
                 declared within a command file exist as long as that command
                 file  is active; when its execution is complete, they disap-
                 pear.  If a variable of the same name is already declared at
                 that level, its value is not changed.

                 Variables may also be created by the 'set' command.


            _E_x_a_m_p_l_e_s

                 declare name address telephone_number
                 declare terminal_type
          |      declare i = 1 bel = "<bel>"
          |      declare nobel = "@<bel>"


            _B_u_g_s

                 Does not complain about multiple declarations of a  variable
                 within a given scope.


            _S_e_e _A_l_s_o

                 forget  (1),  set  (1), vars (1), save (1), _U_s_e_r_'_s _G_u_i_d_e _f_o_r
                 _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r










            declare (1)                   - 1 -                   declare (1)


