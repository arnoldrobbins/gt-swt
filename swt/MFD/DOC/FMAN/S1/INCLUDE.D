

            include (1) --- expand include statements                03/20/80


            _U_s_a_g_e

                 include


            _D_e_s_c_r_i_p_t_i_o_n

                 Many  Ratfor  programs use the Ratfor "include" statement to
                 include a frequently used body of code, such as the standard
                 definition file "=incl=/swt_def.r.i", as part of the  source
                 input.   This  is  useful  for  saving  disk  space,  but is
                 sometimes inconvenient if the programmer wishes to  see  the
                 entire  text  of  his  program.   The  'include'  command is
                 provided to make this possible.  'Include' copies its  stan-
                 dard  input  to its standard output, while looking for lines
                 that begin with "include", followed by a file name, possibly
                 enclosed in quotes (" or ').  If such a line is  found,  the
                 contents  of  the  named  file are inserted in its place and
                 copying continues as before.  Files to be  included  may  be
                 nested to a depth of 5.


            _E_x_a_m_p_l_e_s

                 prog.r> include | pr


            _M_e_s_s_a_g_e_s

                 "Can't open include" if include file could not be found.


            _S_e_e _A_l_s_o

                 rp (1), macro (1)























            include (1)                   - 1 -                   include (1)


