

            remove (2) --- remove a file, return status              07/04/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function remove (pathname)
                 character pathname (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Remove' deletes the file specified by the pathname given as
                 the  first  argument.   If the deletion could not be carried
                 out, ERR is returned; otherwise, OK is returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Getto' is called  to  attach  to  the  UFD  containing  the
                 undesirable  file.   The  file  is  deleted  by  a  call  to
          |      'rmfil$', and a call to the Primos routine  AT$HOM  attaches
                 the  user  back  to  his  home  directory.   If  any call to
                 'rmfil$' or 'getto' fails, ERR is returned; otherwise, OK is
                 returned.


            _C_a_l_l_s

          |      getto, Primos srch$$, Primos at$hom


            _S_e_e _A_l_s_o

                 getto (2), rmtemp (2), rmfil$ (6), del (1)

























            remove (2)                    - 1 -                    remove (2)


