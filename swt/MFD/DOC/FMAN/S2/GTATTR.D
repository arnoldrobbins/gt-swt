

            gtattr (2) --- get a user's terminal attributes          02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function gtattr (attr)
                 integer attr

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Gtattr'  returns the value of the attribute 'attr' that the
                 user desires.  Currently, the following attribute types  are
                 accepted :

                 TA_SE_USEABLE -  indicates  whether the terminal can use the
                      screen editor ('se').  The returned value is either YES
                      or NO.

                 TA_VTH_USEABLE -  indicates whether  the  terminal  is  sup-
                      ported  by  the Virtual Terminal Handler package (VTH).
                      The returned value is either YES or NO.

                 TA_UPPER_ONLY -  indicates  whether  the  terminal  supports
                      only  the upper case character set.  The returned value
                      is either YES or NO.

                 The value of each of the above attributes is set upon  entry
                 into  the  Subsystem,  but  can  be changed by executing the
                 'term' command.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Gtattr' first verifies that the given attribute is a  legal
                 one;  if it isn't, then NO is returned.  If the attribute is
                 legal, its value is obtained from the Subsystem common  area
                 and returned as the function value.


            _S_e_e _A_l_s_o

                 term (1), term_type (1), VTH routines (vt?*) (2)
















            gtattr (2)                    - 1 -                    gtattr (2)


