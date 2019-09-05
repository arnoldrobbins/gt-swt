

            readf (2) --- read raw words from a file                 03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function readf (buf, nw, fd)
                 integer buf (ARB), nw
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Readf'  is  used  to  read  words from a file, which may be
                 assigned to any device recognized by the Subsystem.  (A word
                 on the Prime is 16 bits long.)   The  first  argument  is  a
                 buffer to receive data transferred from the file; the second
                 argument  is  the  number  of  words  to  be read; the third
                 argument is the file descriptor of the file from which  data
                 will  be  read.   Words are transferred from the file to the
                 buffer until (1) the requested number of  words  are  trans-
                 ferred,  (2)  end-of-file  occurs,  or  (3) iiifff ttthhheee fffiiillleee fffrrrooommm
                 wwwhhhiiiccchhh ttthhheee  dddaaatttaaa  iiisss  rrreeeaaaddd  iiisss  aaa  ttttttyyy  fffiiillleee,,,  a  NEWLINE  is
                 encountered.

                 If  the  file  is not readable, the given file designator is
                 invalid, or the file's  error  flag  is  set,  the  function
                 return  is  ERR.  If end-of-file is encountered on the read,
                 the function return is EOF.  Otherwise, the function  return
                 is the number of words returned in the buffer.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Readf'  first  calls  'mapsu'  to convert any standard port
                 descriptors it is passed into  Subsystem  file  descriptors.
                 If  the  last  operation  performed  on  the  file was not a
                 'readf', then 'flush$' is called to empty  the  file's  Sub-
                 system buffer.  Depending on the device type associated with
                 the  file,  a  device dependent driver ('dread$' for disk or
                 'tread$' for the user's terminal) is called to do the actual
                 work of getting data into the buffer.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 buf


            _C_a_l_l_s

                 mapsu, dread$, tread$, flush$


            _B_u_g_s

                 Strange things may happen if you ask  for  more  words  than
                 'buf'  can  hold.   The  semantics of reading raw characters


            readf (2)                     - 1 -                     readf (2)




            readf (2) --- read raw words from a file                 03/25/82


                 from a terminal are a little shaky; since one character  per
                 word  is stored in a terminal buffer, 'readf' actually reads
                 characters from a terminal, not words.  There is a need  for
                 devices  other  than  "terminal" and "disk" (system console,
                 for example).  EOF is returned  if  any  error  occurs  when
                 reading  from  disk (in dread$); the user is not informed of
                 the actual error that occurs.


            _S_e_e _A_l_s_o

                 dread$ (6), tread$ (6), flush$ (6), mapsu (2),  writef  (2),
                 getlin (2)













































            readf (2)                     - 2 -                     readf (2)


