

            create (2) --- create a new file and open it             02/28/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 file_des function create (file_name, mode)
                 character file_name (ARB)
                 integer mode

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Create'  creates a named file.  The parameter 'mode' may be
                 any one of READ, WRITE,  or  READWRITE,  and  specifies  the
                 action(s)  that  may be performed on the newly-created file.
                 If the file name specified already exists, it is opened  and
                 then  truncated  to  zero  length.   'Create' returns a file
                 descriptor if it was successful, ERR  otherwise.   The  file
                 created will have default protection keys of "a/" (owner has
                 all permissions, non-owners have none).

                 By   default,  'create'  returns  a  file  descriptor  to  a
                 sequential access method (SAM) file when referring to a disk
                 file.  If creating a direct  access  method  file  (DAM)  is
                 desired, the 'mode' argument may be ORed with the KNDAM file
                 key  (i.e.,  'mode' can be "READWRITE+KNDAM" to create a DAM
                 file opened for reading or writing).  The constant KNDAM  is
                 contained in the "PRIMOS_KEYS" include file.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Create'  calls  'open'  to  open the named file, then calls
                 'trunc' to set it to zero length.  If an error occurs during
                 truncation, the file is closed  by  calling  'close'.   Note
                 that truncation will not be performed if 'mode' is READ; but
                 then, who would create a new file for reading only, anyway?


            _C_a_l_l_s

                 close, open, trunc


            _S_e_e _A_l_s_o

                 open (2), close (2), mktemp (2), rmtemp (2)












            create (2)                    - 1 -                    create (2)


