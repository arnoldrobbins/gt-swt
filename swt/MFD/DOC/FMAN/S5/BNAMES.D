

            bnames (5) --- print entry point names in object files   01/03/83


            _U_s_a_g_e

                 bnames {<object file>}


            _D_e_s_c_r_i_p_t_i_o_n

                 'Bnames'  is a program which will open each of the files, if
                 any, named as its arguments  and  print  the  names  of  the
                 routines  encountered  on  standard output.  This program is
                 useful for examining library files to  see  if  the  correct
                 subroutines have been included.

                 The following are the possible types of output :

                      _t_y_p_e              _m_e_a_n_i_n_g
                      <name>            name of a subprogram entry point
                      .main             main program entry point
                      .data             Fortran block data module
                      .rfl              a reset "force load" loader group
                      .sfl              a set "force load" loader group


            _E_x_a_m_p_l_e_s

                 bnames ave.b ave_lib.b
                 bnames [files .b$] | find "%." -x >routine_names


            _M_e_s_s_a_g_e_s

                 "<name>: bad  object  file..."   for an ill-formatted object
                      code file.
                 "block size (<integer>)  exceeds  buffer  space"  for  files
                      whose block size exceeds the program input buffer size.
                 "<name>: extraneous END block" for superfluous END blocks in
                      the object code file.


            _B_u_g_s

                 If a module has multiple entry points, only the first one is
                 recognized.


            _S_e_e _A_l_s_o

                 bmerge (5), brefs (5), ld (1), lorder (1)










            bnames (5)                    - 1 -                    bnames (5)


