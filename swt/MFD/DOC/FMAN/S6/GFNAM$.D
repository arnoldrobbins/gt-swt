

            gfnam$ (6) --- get the pathname for an open file         01/05/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gfnam$ (fd, path, size)
                 file_des fd
                 character path (MAXPATH)
                 integer size

          |      Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gfnam$'  tries to find the name of the open file unit 'fd'.
                 If the unit is a  terminal,  it  returns  the  name  of  the
                 terminal  device.   If  the  unit  is a null device, then it
                 returns the null device  name;  otherwise,  it  obtains  the
                 pathname  and  returns it in 'path'.  If the pathname can be
                 obtained, the length of 'path' is the returned value; other-
                 wise ERR is returned.

                 'Size' is the number of  characters  that  can  be  held  in
                 'path' (including EOS).


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gfnam$'  first tries to verify that the file unit for which
                 a name is desired is open and a legal file unit; if it isn't
                 both, then ERR is returned.  Otherwise,  it  checks  to  see
                 what type of file is associated with the given file descrip-
                 tor.   For terminal and null devices, the appropriate device
                 name is returned (device names are of the  form  '/dev/?*').
                 For  disk  files,  the Primos GPATH$ subroutine is called to
                 obtain the Primos treename for  the  file.   If  a  treename
                 could be obtained, then 'mkpa$' is called to generate a Sub-
                 system pathname for the file; otherwise, ERR is returned.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 path


            _C_a_l_l_s

                 ctoc, Primos gpath$, mapsu, mkpa$, ptoc












            gfnam$ (6)                    - 1 -                    gfnam$ (6)


