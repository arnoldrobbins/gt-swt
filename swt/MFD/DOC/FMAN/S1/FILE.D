

            file (1) --- test information about a file               04/03/82


            _U_s_a_g_e

                 file <pathname> {<option>}
                 <option> ::= -d | -[n]e | -p twrtwr | -[n]r |
                              -s | -u | -[n]w | -[n]z


            _D_e_s_c_r_i_p_t_i_o_n

                 'File'  tests the specified pathname for certain conditions.
                 'File' only operates on one pathname per call and  can  only
                 test  for  all specified conditions true (the and-product of
                 all conditions).  If no conditions are given, 'file' assumes
                 the "-e" option.  All other tests must be specifically  tur-
                 ned  on.   The output of 'file' is a "1" or "0" depending on
                 whether the conditions were all true  or  one  or  more  was
                 false.

                 'File' is most commonly used with the 'if' command.

                 The options available are:

                 -d         file type is DAM (direct access)
                 -[n]e      test for the [non] existence of <pathname>
                 -p twrtwr  test for specific protection bits on
                 -[n]r      test for [no] read permission on <pathname>
                 -s         file type is SAM (sequential access)
                 -u         file type is UFD (directory)
                 -[n]w      test for [no] write permission on <pathname>
                 -[n]z      test <pathname> for [non] zero length


            _E_x_a_m_p_l_e_s

                 if [file [arg 1] -ne]
                    echo [arg 1] does not exist
                    exit
                 fi


            _M_e_s_s_a_g_e_s

                 "Usage:  file ..."  for illegal argument syntax.

                 "<pathname>:   cannot  test conditions" if 'filtst' returned
                      an error in trying to test the pathname.

                 Primos file system errors will be noted if found.


            _B_u_g_s

                 Should accept multiple pathnames.

                 Should probably have an option to test for 'or' of arguments
                 as well as 'and' of arguments.


            file (1)                      - 1 -                      file (1)




            file (1) --- test information about a file               04/03/82


                 Accepts only an obsolete  syntax  for  the  file  protection
                 argument.


            _S_e_e _A_l_s_o

                 if (1), chat (1), lf (1), find$ (2)



















































            file (1)                      - 2 -                      file (1)


