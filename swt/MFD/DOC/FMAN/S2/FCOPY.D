

            fcopy (2) --- copy one file to another                   01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine fcopy (in, out)
                 file_des in, out

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Fcopy' is a routine that copies the contents of one file to
                 another.   The two arguments specify the file descriptors of
                 the source and destination files, respectively.  Both  files
                 must  be  open  with  the proper access modes (i.e., READ or
                 READWRITE access for the  source,  and  WRITE  or  READWRITE
                 access  for  the  destination); neither is rewound before or
                 after the copy.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Fcopy's  strategy  depends  on   the   types   of   devices
                 represented by the source and destination files; if both are
                 disk  files,  the  routines  'readf' and 'writef' are called
                 repeatedly to transfer large blocks of data.  For all  other
                 combinations  of  source and destination device types, 'get-
                 lin' and 'putlin' are called repeatedly to transfer one line
                 at a time.  Even for disk files, 'getlin' may be called,  to
                 insure that the buffer state is consistent.


            _C_a_l_l_s

                 getlin, mapsu, putlin, readf, writef


            _B_u_g_s

                 There  is  no  provision for an error return of any sort; no
                 status is passed back to the  calling  program  to  indicate
                 success or failure of the copy.


            _S_e_e _A_l_s_o

                 getlin (2), putlin (2), readf (2), writef (2)












            fcopy (2)                     - 1 -                     fcopy (2)


