

            writef (2) --- write raw words to file                   03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function writef (buf, nw, fd)
                 integer buf (ARB), nw
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Writef'  is  used  to  write  words to a file, which may be
                 assigned to any device recognized by the Subsystem.  (A word
                 on the Prime is 16 bits long.)   The  first  argument  is  a
                 string  of  words  to  be  written  to  the file; the second
                 argument is the number of words to  be  written;  the  third
                 argument  is  the  file descriptor of the file to which data
                 will be written.  Words  are  transferred  from  the  string
                 buffer  to the file until 'nw' words are written.  The func-
                 tion return is ERR if the file  is  not  writeable,  if  the
                 given  file  descriptor  is  invalid, or if the file's error
                 flag is set; otherwise, the function return is the number of
                 words written (nominally the same as 'nw').  Exceptions:   a
                 write on the null device (/dev/null) always returns EOF, and
                 an error detected by Primos causes a return of EOF.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Writef' calls 'mapsu' to convert standard port numbers into
                 file  descriptors.   If  the last operation performed on the
                 file was not a 'writef', 'flush$' is  called  to  empty  the
                 file's  buffers.   Depending  on  the device type associated
                 with the file, one of the device dependent drivers  'dwrit$'
                 (for  disk files) or 'twrit$' (for terminal files) is called
                 to perform the actual data transfer.


            _C_a_l_l_s

                 mapsu, dwrit$, twrit$, flush$


            _B_u_g_s

                 Support for more devices would be nice.

                 EOF is returned if any error occurs when writing to disk (in
                 dwrit$); the user is not informed of the actual  error  that
                 occurs.


            _S_e_e _A_l_s_o

                 mapsu (2), dwrit$ (6), twrit$ (6), flush$ (6)



            writef (2)                    - 1 -                    writef (2)


