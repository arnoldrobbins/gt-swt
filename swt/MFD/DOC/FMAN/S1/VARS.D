

            vars (1) --- print, save, or restore shell variables     08/27/84


          | _U_s_a_g_e

                 vars [ -{v | c | g | a | l} ] [-r [<file>] | -s [<file>]]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Vars'  can  be  used  to  print the names and values of all
                 currently defined shell variables, save the variables  in  a
                 file,  or  restore  them  from  a  file.   The  options have
                 meanings as follows:

          |           -v   Values.  Print the value of each variable as  well
          |                as its name.

          |           -c   Columnar.   Print  information in a single column,
          |                instead of across the  page  (similar  to  the  -c
                           option of 'lf').

          |           -g   Global.   Print  names of all global variables, as
          |                well as those on the current nesting level.

          |           -a   All.  Print names of all shell variables,  on  any
          |                nesting  level, including those beginning with "_"
                           (normally reserved for use by the shell).

          |           -l   Long.  Select options a, g, and v.

          |           -s   Save.  Save shell variables.  If a  file  name  is
          |                specified, variables and their values are saved in
                           the  given  file; otherwise, the file "=varsfile="
                           is used.  Only  level  1  (global)  variables  are
                           saved.  Listing of variable names and values still
                           occurs.

          |           -r   Restore.   Restore shell variables.  Variables and
          |                values from the named file (default  "=varsfile=")
                           are  merged  with  the  currently  active  set  of
                           variables, at the current nesting level.   Listing
                           of variable names and values still occurs.

                 If  no  options are specified, 'vars' lists the names of all
                 variables active at the current nesting level  in  a  multi-
                 column format.

                 For  more  information  on  shell  variables, see the 'set',
                 'declare' and 'forget' commands, or the _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r.


            _E_x_a_m_p_l_e_s

                 vars
                 vars -vc
                 vars -l
                 vars -s


            vars (1)                      - 1 -                      vars (1)




            vars (1) --- print, save, or restore shell variables     08/27/84


                 vars -s =varsdir=/environment
                 vars -r =varsdir=/environment


            _B_u_g_s

          |      Should print the mnemonic form of the variable names.


            _S_e_e _A_l_s_o

                 declare (1), forget (1),  set  (1),  _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r













































            vars (1)                      - 2 -                      vars (1)


