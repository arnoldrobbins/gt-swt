

            seekf (2) --- position a file to a designated word       01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function seekf (pos, fd[, xra])
                 file_mark pos
                 file_des fd
                 integer xra

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Seekf' is used to position the file pointer to a designated
                 word.    The  first  argument  is  an  integer  value  which
                 specifies the relative or absolute positioning value (depen-
                 ding on the value of the third argument,  'xra');  if  'xra'
                 equals  ABS  then  positioning  is from the beginning of the
                 file, or if 'xra' equals REL then positioning  is  from  the
                 current  position.  The second argument is the file descrip-
                 tor of the file whose file  pointer  is  being  manipulated.
                 The  third  argument is optional.  If omitted, the value ABS
                 is assumed.  The function return is OK if the positioning is
                 successful, EOF if the end-of-the-file is reached, or ERR if
                 'fd' is an invalid file descriptor, if the  error  flag  for
                 the  file  is set, if the file device type is disk and 'xra'
                 is ABS and 'pos' is negative, if the device type is terminal
                 and 'xra' is ABS, or if the  device  type  is  terminal  and
                 'pos' is negative.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Seekf'  first  calls  'mapsu'  to  map  any  standard  port
                 descriptor it may have been passed into  a  file  descriptor
                 for further processing.  The Primos routine MISSIN is called
                 to  determine  if the 'xra' argument is missing; if so, then
                 absolute positioning is assumed.  Depending  on  the  device
                 type  associated with the file, a device dependent driver is
                 called:  'dseek$' (for disk)  or  'tseek$'  (for  terminal).
                 The   device   dependent  drivers  do  the  actual  work  of
                 positioning.


            _C_a_l_l_s

                 mapsu, dseek$, tseek$, flush$, Primos missin


            _B_u_g_s

                 EOF is returned if any error occurs when reading  from  disk
                 (in  dseek$); the user is not informed of the true nature of
                 the error.

                 Do not seek to end-of-file on a terminal file;  all  further
                 input from the terminal will be ignored.


            seekf (2)                     - 1 -                     seekf (2)




            seekf (2) --- position a file to a designated word       01/07/83


            _S_e_e _A_l_s_o

                 dseek$ (6), tseek$ (6), flush$ (6), mapsu (2)























































            seekf (2)                     - 2 -                     seekf (2)


