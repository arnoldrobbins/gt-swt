

            edit (2) --- invoke the line-oriented text editor        06/26/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine edit (filename, fdin, fdout)
                 character filename (ARB)
                 file_des fdin, fdout

                 Library:  vedtlb (Subsystem text editor library)


            _F_u_n_c_t_i_o_n

                 'Edit'  accesses  the  Subsystem  line-oriented text editor.
                 When called, 'edit' begins an editing session, reading edit-
                 ing commands from the file specified by "fdin"  and  writing
                 editing  output  on  the  file  specified  by  "fdout".   If
                 "filename" is other than an empty string, 'edit'  reads  the
          |      file into the edit buffer before accepting editing commands.

          |      Since  the  editor  can now call the shell, the shared shell
          |      library, 'vshlib', must be  loaded  along  with  the  editor
          |      library 'vedtlb' for any program that calls 'edit'.

          |      'Edit'  arranges  to  catch the 'LOGOUT$' condition.  When a
          |      LOGOUT$ occurs, 'edit' saves the  current  contents  of  the
          |      edit  buffer  in the file =home=/<prog>.logout, where <prog>
          |      is the name of the program using 'edit'.  For example,  'ed'
          |      would  have  the  buffer  saved  in  =home=/ed.logout, while
          |      'moot' would have its buffer saved in =home=/moot.logout.

                 For  complete   information   on   editing   commands,   see
                 _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Edit'  is  the  top-level  routine  for  the Subsystem line
                 editor.





















            edit (2)                      - 1 -                      edit (2)


