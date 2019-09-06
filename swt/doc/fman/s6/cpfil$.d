

            cpfil$ (6) --- copy one open file to another             03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine cpfil$ (ifd, ofd, rc)
                 integer ifd, ofd, rc

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Cpfil$'  expects 'ifd' to contain the Primos file unit num-
                 ber of a file open for reading, and  'ofd'  to  contain  the
                 Primos  file  unit  number  of  a  file  open  for  writing.
                 'Cpfil$' attempts to copy the contents of the input file  to
                 the output file.  If any condition arises that prevents com-
                 pletion  of  the copy, 'cpfil$' sets 'rc' to ERR; otherwise,
                 it sets it to OK.  On return, both files are left  open  and
                 positioned to the end.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Cpfil$'  makes repeated calls to Primos PRWF$$ with a large
                 buffer to quickly move the data between the files.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 rc


            _C_a_l_l_s

                 Primos prwf$$


            _S_e_e _A_l_s_o

                 cpseg$ (6), filcpy (2), fcopy (2)



















            cpfil$ (6)                    - 1 -                    cpfil$ (6)


