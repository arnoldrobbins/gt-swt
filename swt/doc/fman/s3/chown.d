

            chown (3) --- change directory ownership                 08/28/84


          | _U_s_a_g_e

                 chown [-s[<depth>]] <owner> { <pathname> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Chown'  is used to change the owner password of one or more
                 directories (UFDs) in the file system.  <owner> may  consist
                 of  up  to  six  characters; shorter strings are padded with
                 blanks, and lower-case letters are converted to upper-case.

                 In order to use this command successfully, one must be  able
                 to  attach  to  the named directories with owner privileges.
                 In a standard Primos environment,  this  means  the  current
                 owner  password  must  be  included in the pathname for each
                 specified directory.  In a  Ga.   Tech  Primos  environment,
                 this  means  that  the user must currently own the specified
                 directories, or they must be public.

                 The "-s" option, if specified, causes  'chown'  to  traverse
                 the  file  system  subtree  rooted  in  the named directory,
                 changing the owner password of each directory it encounters.
                 The depth of this traversal may be limited  by  appending  a
                 positive integer to the "-s" (e.g., "-s3").

                 Specifying no <pathname> arguments is the same as specifying
                 the pathname of the current directory.


            _E_x_a_m_p_l_e_s

                 chown "" =mail=
                 chown ""
                 chown system =src= =src=/lib
                 chown -s system =aux=


            _M_e_s_s_a_g_e_s

                 "Usage:  chown ..."  for bad argument syntax.
                 "owner name too long" for illegal <owner>.
                 "<pathname>:   can't  change  owner"  for not being owner of
                      <pathname>.
                 "<pathname>:  bad pathname" for not being able to access the
                      directory containing <pathname>.


            _B_u_g_s

                 In a standard Primos environment, 'chown' sets the non-owner
                 password to zeros when it changes the owner password.






            chown (3)                     - 1 -                     chown (3)




            chown (3) --- change directory ownership                 08/28/84


            _S_e_e _A_l_s_o

          |      cd (1), chat (1), lacl (1), sacl  (1),  passwd  (3),  Primos
          |      spas$$






















































            chown (3)                     - 2 -                     chown (3)


