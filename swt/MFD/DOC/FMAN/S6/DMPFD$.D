

            dmpfd$ (6) --- dump the contents of a file descriptor    01/05/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine dmpfd$ (fd, ofd)
                 file_des fd, ofd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dmpfd$' prints all information that is of importance to the
                 user  about  file descriptor 'fd' on file unit 'ofd'.  Among
                 the items of information produced  are  the  file  name  (if
                 obtainable),  file  position  (if  a disk file), file buffer
                 information, the most recent file system  return  code,  and
                 the  contents  of the file buffer (if a disk file).  Each of
                 these  pieces  of  information   is   displayed   with   the
                 appropriate heading.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gfnam$' is called to obtain the name of the file associated
                 with  the  descriptor.  If the name could be obtained, it is
                 printed out.  Other file unit information is printed, in the
                 proper format, from information stored in the Subsystem com-
                 mon areas.  The current position in a disk file is  obtained
                 by calling the Primos routine PRWF$$.


            _C_a_l_l_s

                 gfnam$, mapsu, print, putch, putlin, Primos prwf$$


            _S_e_e _A_l_s_o

                 dump (1)




















            dmpfd$ (6)                    - 1 -                    dmpfd$ (6)


