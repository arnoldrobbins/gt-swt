

            rmseg$ (6) --- remove a segment directory                03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine rmseg$ (funit)
                 integer funit

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Rmseg$' cleans out the segment directory open on the Primos
                 file unit given as its sole argument.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Rmseg$'  deletes  successive entries in the directory using
                 the Primos routine SRCH$$.  When 'rmseg$'  comes  across  an
                 entry that is itself a non-empty segment directory, it opens
                 that  directory  then  calls  itself recursively to clean it
                 out.  When all entries  have  been  removed,  the  directory
                 itself is set to zero length.


            _C_a_l_l_s

                 Primos sgdr$$, Primos srch$$, rmseg$


            _S_e_e _A_l_s_o

                 del (1), remove (2), rmfil$ (6)


























            rmseg$ (6)                    - 1 -                    rmseg$ (6)


