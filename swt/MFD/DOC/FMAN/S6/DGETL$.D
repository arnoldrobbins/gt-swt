

            dgetl$ (6) --- get a line from a disk file               01/05/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function dgetl$ (line, length, fd)
                 integer length
                 character line (length)
                 file_descriptor_struct fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dgetl$'  is an internal Subsystem routine that performs the
                 function  of  'getlin'  for  disk  files  only.   The  first
                 argument  specifies  a  string to receive the line read; the
                 second argument is the length of  the  longest  string  that
                 will  fit in the receiving buffer; the third is a pointer to
                 the appropriate file descriptor structure in  the  Subsystem
                 common  area.   'Dgetl$'  returns  the  number of characters
                 placed in the receiving buffer (excluding EOS) if  the  read
                 was successful; EOF otherwise.  'Dgetl$' is not intended for
                 general  use;  it  is not protected from user error, and may
                 cause termination of the user's program if used incorrectly.
                 It should always be referenced through 'getlin'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dgetl$' (which is written in PMA, incidentally)  shortcalls
                 an  internal routine that calls the Primos routine PRWF$$ to
                 read a buffer full of data from the disk  file  selected  by
                 the  file descriptor.  This buffer is then unpacked into the
                 user's  receiving  string.   During  the  unpack  and   copy
                 operation,  compressed  blanks  (encoded as an RHT (relative
                 horizontal tab) followed by a  blank  count)  are  converted
                 into  the proper number of ordinary blanks.  The copy opera-
                 tion ends when a NEWLINE is encountered or when  the  user's
                 buffer is full.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 line


            _C_a_l_l_s

                 Primos prwf$$


            _S_e_e _A_l_s_o

                 getlin (2), tgetl$ (6), putlin (2), dputl$ (6), tputl$ (6)





            dgetl$ (6)                    - 1 -                    dgetl$ (6)


