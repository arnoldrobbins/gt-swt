

            error (2) --- print fatal error message, then die        02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine error (message)
                 character message (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Error'  is a Kernighan/Plauger routine used to report fatal
                 errors.  The message passed to it is printed on ERROUT,  and
                 the  program  then  terminates.   An error status of 1000 is
                 passed back to the command interpreter, which  then  decides
                 whether or not shell program execution will proceed.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Error'  calls  'remark'  to print the error message on file
                 ERROUT.  Error status is set by a call to 'seterr',  then  a
                 'stop' statement is executed to make a normal return back to
                 the  Subsystem  command interpreter.  (Note that Ratfor con-
                 verts 'stop' statements into calls to the subroutine 'swt'.)


            _C_a_l_l_s

                 remark, swt, seterr


            _S_e_e _A_l_s_o

                 remark (2), swt (2)
























            error (2)                     - 1 -                     error (2)


