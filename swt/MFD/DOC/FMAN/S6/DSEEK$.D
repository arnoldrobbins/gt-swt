

            dseek$ (6) --- seek on a disk device                     01/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function dseek$ (pos, f, ra)
                 file_mark pos
                 file_des f
                 integer ra

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dseek$'  is an internal Subsystem routine that performs the
                 function of 'seekf' for disk files only.  The first argument
                 is a long  integer  value  which  specifies  the  amount  of
                 relative  or absolute positioning, depending on the value of
                 the third argument, 'ra'.  If 'ra' equals ABS then position-
                 ing is from the beginning of the file; if  'ra'  equals  REL
                 then  positioning  is from the current position.  The second
                 argument is the file  descriptor  of  the  file  whose  file
                 pointer  is being manipulated.  The function return is OK if
                 the positioning was successful, ERR if 'ra' is ABS and 'pos'
                 is negative, ERR if 'ra' is neither ABS  nor  REL,  and  EOF
                 otherwise.   'Dseek$' is not intended for general use; it is
                 not protected from user error, and may cause termination  of
                 the user's program if used incorrectly.  It should always be
                 referenced through 'seekf'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dseek$'  calls the Primos subroutine PRWF$$ to set the file
                 pointer of a disk file.


            _C_a_l_l_s

                 Primos prwf$$


            _B_u_g_s

                 EOF is returned if any error occurs during  disk  read;  the
                 user is not informed of the actual error that occurs.


            _S_e_e _A_l_s_o

                 seekf (2)









            dseek$ (6)                    - 1 -                    dseek$ (6)


