

            cn (1) --- change file names                             03/20/80


            _U_s_a_g_e

                 cn <pathname> <new name> { <pathname> <new name> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Cn'  changes  the  names  of  the files named as arguments.
                 Arguments must be paired; the first argument in  a  pair  is
                 the  pathname  of  the file whose name is to be changed, the
                 second argument in the pair is the new name to be  given  to
                 the  file.   The  new name must be a simple file name, not a
                 pathname.  Thus, 'cn' may not be used to move files from one
                 directory to another.  Use 'cp' for this purpose.


            _E_x_a_m_p_l_e_s

                 cn //cmdnc0/new_go go
                 cn old new   first last   always never


            _M_e_s_s_a_g_e_s

                 "<pathname>:  missing name" if <new name> is missing
                 "<pathname>:  bad pathname" if <pathname> could not be  fol-
                      lowed
                 "Usage:  cn old new {old new}" for no arguments
                 "<new name>:  already exists" for duplicate file name
                 "<pathname>:  not found" for non-existent file name.
                 "<new  name>:   cannot  move  file  to new directory" for an
                      unescaped slash in the new name.


            _S_e_e _A_l_s_o

                 cp (1), Primos cname$





















            cn (1)                        - 1 -                        cn (1)


