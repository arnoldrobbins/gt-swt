

            close (2) --- close out an open file                     03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function close (fd)
                 file_des fd

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Close'  closes  the  file  associated  with  the given file
                 descriptor  (the  value  returned  by  a  call  to   'open',
                 'create',  or  'mktemp')  and releases its buffer areas.  If
                 the file was open for writing, any data  still  buffered  is
                 written  to  the  file.   After  a  file is closed, its file
                 descriptor  becomes  available  for  future  use.    'Close'
                 returns  OK  if  the  attempt  to  close was successful, ERR
                 otherwise.

                 If an attempt is made  to  close  a  standard  port  (STDIN,
                 STDOUT, etc.)  'close' will return OK, but it will _n_o_t close
                 the file associated with the port.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Close'  first checks to see if the given file descriptor is
                 a standard port descriptor.  If so, the attempt to close  is
                 ignored.   If  the file descriptor is illegal or corresponds
                 to an already closed file, ERR  is  returned.   'Flush$'  is
                 then  called  to  force any pending writes on the file to be
                 performed.  The Primos routine SRCH$$ is used to close  disk
                 files;  other  file types are closed simply by updating Sub-
                 system status areas.


            _C_a_l_l_s

                 flush, Primos srch$$


            _B_u_g_s

                 Some consider the behavior on standard  ports  unreasonable,
                 but it definitely seems useful.


            _S_e_e _A_l_s_o

                 open (2), create (2), mktemp (2), flush$ (6)








            close (2)                     - 1 -                     close (2)


