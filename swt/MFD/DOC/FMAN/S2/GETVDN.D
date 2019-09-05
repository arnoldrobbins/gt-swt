

            getvdn (2) --- return name of file in user's variables directory  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine getvdn (filename, pathname [, username])
                 character filename (ARB), pathname (ARB), username (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Getvdn'  is used to return the full pathname of a file in a
                 user's shell variables storage directory.   Such  files  are
                 often  used  for  small  amounts of data that must be secure
                 (e.g.  mail files, encryption parameters,  shell  variables,
                 etc.).

                 The 'filename' argument is an EOS-terminated string contain-
                 ing  the  simple  name of a file in the variables directory.
                 The 'pathname' argument receives the full  pathname  of  the
                 given  file.  The 'username' argument, if present, specifies
                 the particular user  whose  variables  directory  is  to  be
                 referenced.   If  'username'  is missing, or is equal to the
                 user making the call to 'getvdn', then the user's  Subsystem
                 password is inserted in the returned pathname, allowing full
                 owner rights in the variables directory.

                 An  example:   If the current user's login name is "foo" and
                 his Subsystem password is "bar", then the call
                      call getvdn (".vars"s, pathname)
                 would return the  string  "=vars=/foo:bar/.vars"  in  'path-
                 name'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Getvdn'  calls 'ctoc' to start the pathname with the string
                 "=vars=/", then simply uses  'scopy'  to  append  the  other
                 items  of  information as needed.  The Subsystem password is
                 available in the variable 'Passwd'  in  the  shell's  common
                 areas.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 pathname


            _C_a_l_l_s

                 ctoc, date, equal, length, scopy, Primos missin


            _B_u_g_s

                 Security  of  the  variables  directory  can  be broken by a
                 Trojan horse.


            getvdn (2)                    - 1 -                    getvdn (2)




            getvdn (2) --- return name of file in user's variables directory  01/07/83


            _S_e_e _A_l_s_o

                 vfyusr (2), expand (2), lutemp (6)























































            getvdn (2)                    - 2 -                    getvdn (2)


