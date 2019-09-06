

            vfyusr (2) --- validate username                         01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vfyusr (lognam)
                 character lognam (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vfyusr'   is  used  to  verify  that  a  given  login  name
                 corresponds to an authorized user  of  the  Subsystem.   The
                 single argument is the login name of the user to be checked.
                 The  function  return is OK if the given name was validated,
                 ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Vfyusr' opens the Subsystem  user  list  file  "=userlist="
                 (nominally in "//extra/users") and simply reads it until the
                 given user name is found or EOF is encountered.


            _C_a_l_l_s

                 close, ctoc, getlin, length, mapstr, open, remark, strcmp































            vfyusr (2)                    - 1 -                    vfyusr (2)


