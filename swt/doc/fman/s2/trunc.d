

            trunc (2) --- truncate a file                            02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function trunc (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Trunc' is used to truncate writeable files at their current
                 position; that is, to delete the remainder of the file.  The
                 argument is the file descriptor of the file to be truncated;
                 the  function return is OK if the truncation was successful,
                 ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Flush$' is called to empty the buffers associated with  the
                 given  file.  If the file to be truncated is a terminal file
                 or the null device, then an immediate successful  return  is
                 taken.   If  the  file to be truncated is a disk file, it is
                 truncated by the Primos routine PRWF$$.  If the return  from
                 PRWF$$  is good, 'trunc' returns OK; if not, 'trunc' returns
                 ERR.


            _C_a_l_l_s

                 flush$, mapsu, Primos prwf$$


            _B_u_g_s

                 Behavior on terminal files is somewhat questionable.


            _S_e_e _A_l_s_o

                 remove (2), rmtemp (2)

















            trunc (2)                     - 1 -                     trunc (2)


