

            dputl$ (6) --- put a line on a disk file                 03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function dputl$ (line, fd)
                 character line (ARB)
                 file_descriptor_struct fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dputl$'  is  called  by  'putlin' to write a line on a disk
                 file.  The first argument is an EOS-terminated string to  be
                 placed  on  the  disk  file; the second argument is the file
                 descriptor of the file on which the string is to be written.
                 The function return is OK for a successful call, ERR  other-
                 wise.   'Dputl$'  is  not  protected from user error, and so
                 should not be used except as it is called by 'putlin'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dputl$' maintains a count of blanks to  be  used  for  file
                 compression.   When  a non-blank character is encountered in
                 the string, any  blanks  accumulated  are  translated  to  a
                 relative  horizontal  tab  (RHT)  and a blank count, and the
                 non-blank character is output.   Characters  placed  in  the
                 disk  buffer are output by a shortcalled routine internal to
                 'dputl$'; this routine calls the Primos routine PRWF$$ to do
                 the actual data transfer.


            _C_a_l_l_s

                 Primos prwf$$


            _S_e_e _A_l_s_o

                 putlin (2), dgetl$ (6), tputl$ (6)


















            dputl$ (6)                    - 1 -                    dputl$ (6)


