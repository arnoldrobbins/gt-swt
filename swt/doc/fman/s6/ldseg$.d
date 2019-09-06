

            ldseg$ (6) --- load a SEG runfile into memory            01/06/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine ldseg$ (rvec, name, len, code)
                 integer rvec (9), name (ARB), len, code

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Ldseg$'  first  attempts  to  open  the  file 'name' in the
                 current directory, using 'len' as the length  of  the  name.
                 If the open is successful, and the file is a SEG run file of
                 recent  (Primos revision 17 or later) origin, 'ldseg$' loads
                 the private segments of the file into memory and sets 'rvec'
                 to the initial save vector of the program.  If the  load  is
                 successful,  'ldseg$'  returns  a  code of 0; otherwise, the
                 Primos error code E$BPAR is returned.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ldseg$' first opens the segment directory and file 0 in the
                 directory.   Using  calls  to  the  Primos  routine  PRWF$$,
                 'ldseg$'  reads  and  checks the revision flag, segment map,
                 segment bit map, save vector, time vector, and symbol table.
                 Using this information, 'ldseg$' traverses the symbol table,
                 loading  initialized  chunks  of  segments  with  calls   to
                 'chunk$'  and  zeroing  uninitialized segments with calls to
                 'zmem$'.    Completely   uninitialized    segments    remain
                 unmodified.   After  loading  is complete, 'ldseg$' sets the
                 values in 'rvec' and returns with a code of 0.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 rvec, code


            _C_a_l_l_s

                 chunk$, print, zmem$, Primos errpr$, Primos  srch$$,  Primos
                 prwf$$


            _S_e_e _A_l_s_o

                 call$$ (6)










            ldseg$ (6)                    - 1 -                    ldseg$ (6)


