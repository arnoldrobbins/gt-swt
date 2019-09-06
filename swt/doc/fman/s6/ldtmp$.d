

            ldtmp$ (6) --- load the per-user template area           01/22/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine ldtmp$

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 Using the public template "=utemplate=" to locate the user's
                 private  template  file,  'ldtmp$' reloads the hash table in
                 the Subsystem common area that  contains  the  private  tem-
                 plates.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Ldtmp$'  first  zeroes  the  private  template area, so the
                 reference to "=utemplate=" will be to the  public  template.
                 It  then  opens "=utemplate=", parses the lines with 'gtemp'
                 and fills in the hash table.


            _C_a_l_l_s

                 close, getlin, gtemp, open, Primos  break$,  length,  print,
                 seterr, scopy


            _S_e_e _A_l_s_o

                 expand (2)


























            ldtmp$ (6)                    - 1 -                    ldtmp$ (6)


