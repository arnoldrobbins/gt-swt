

            getlin (2) --- read one line from a file                 04/11/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function getlin (line, fd [, line_length] )
                 integer line_length
                 file_des fd
                 character line (line_length)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Getlin' is the primary Subsystem input routine.  It is used
                 to  read  a  line  from a file, which may be assigned to any
                 device recognized by the Subsystem.  The first argument is a
                 string to receive data transferred from the file; the second
                 argument is the file descriptor of the file from which  data
                 will  be  read;  the  optional third argument is the maximum
                 length of the receiving string.  Characters are  transferred
                 from  the  file  to  the string buffer until (1) end-of-file
                 occurs, (2) a NEWLINE is  encountered,  or  (3)  the  string
                 buffer  is  completely full.  Unless end-of-file occurs, the
                 function return is the length of the string returned in  the
                 buffer;   on   end-of-file,  EOF  is  returned.   The  third
                 argument, 'line_length', is optional.  If omitted, the value
                 MAXLINE is assumed.  At most, 'line_length' - 1  characters,
                 followed by an EOS, are transferred to the buffer.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Getlin'  first  calls  'mapsu'  to  map  any  standard port
                 descriptor it may have been passed  into  a  Subsystem  file
                 descriptor.   The file specified must be readable and not at
                 end-of-file; if these conditions are not met, EOF is  retur-
                 ned  immediately.   The  Primos  routine MISSIN is called to
                 determine if the line length argument is missing; if it  is,
                 the  default  value  of  MAXLINE  is assumed.  Regardless of
                 device type, 'flush$' is called to place the file buffer  in
                 a  consistent  state  if the last operation performed on the
                 file was not a 'getlin'  or  'getch'.   One  of  two  device
                 dependent   drivers  ('dgetl$'  for  disk  or  'tgetl$'  for
                 terminal) is called to do the real work of getting data into
                 the buffer.  Note:  Reads on a  null  device  always  return
                 EOF.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 line


            _C_a_l_l_s

                 mapsu, dgetl$, tgetl$, flush$, Primos missin



            getlin (2)                    - 1 -                    getlin (2)




            getlin (2) --- read one line from a file                 04/11/82


            _B_u_g_s

                 The  current  optional  use of the 'line_length' argument is
                 somewhat  shaky.   There  is  need  for  more  devices  than
                 "terminal" and "disk" (system console, for example).


            _S_e_e _A_l_s_o

                 dgetl$ (6), tgetl$ (6), mapsu (2), putlin (2), flush$ (6)
















































            getlin (2)                    - 2 -                    getlin (2)


