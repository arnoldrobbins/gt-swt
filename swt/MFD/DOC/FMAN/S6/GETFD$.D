

            getfd$ (6) --- look for an empty file descriptor         03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_des function getfd$ (fd)
                 file_des fd

                 Library:  vswtlb (standard Subystem library)


            _F_u_n_c_t_i_o_n

                 'Getfd$'  is  used  by  'open' and 'mkfd$' to find an unused
                 file descriptor with which to set up a  file  unit.   If  it
                 could  find one, it returns that file descriptor; otherwise,
                 it returns ERR.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The file descriptor list is searched to  find  one  that  is
                 available.   The  search is attempted first on file descrip-
                 tors that lie within the current page of memory.  If one  is
                 not  found,  the  search  is then performed on any remaining
                 file descriptors (possibly requiring paging to bring in  the
                 required  data);  if  a free descriptor is found, then it is
                 returned to the caller.  If none are found this time, ERR is
                 returned.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 fd


            _S_e_e _A_l_s_o

                 mkfd$ (6), open (2)






















            getfd$ (6)                    - 1 -                    getfd$ (6)


