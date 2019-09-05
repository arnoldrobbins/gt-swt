

            at$swt (6) --- Subsystem interlude to Primos ATCH$$      08/30/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine at$swt (name, namel, ldisk, passwd, key, code)
                 character name (MAXPATH)
                 packed_char passwd (3)
                 integer namel, ldisk, key, code

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'At$swt'  is  the  Subsystem  interlude to the Primos ATCH$$
                 subroutine.  It allows the  program  to  attach  to  another
                 directory, and takes the same arguments as ATCH$$.  If there
                 is  an  error  in  trying  to  reach the directory, 'at$swt'
                 returns E$BPAS in 'code', instead of  leaving  the  user  in
                 Primos.

                 'Name' is the name of the directory to attach to, 'namel' is
                 the  length  of 'name', 'ldisk' is the number of the logical
                 disk to be searched to find the given directory, 'passwd' is
                 the password of the directory (the characters are packed two
                 per word), 'key' is the composition of the  'REFERENCE'  and
                 'SETHOME'  subkeys  (see  the  _P_r_i_m_o_s  _S_u_b_r_o_u_t_i_n_e_s _R_e_f_e_r_e_n_c_e
                 _G_u_i_d_e, PDR3621), and 'code' is  an  integer  variable  which
                 contains the return code.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'At$swt'  first  sets  up an on-unit for the "BAD_PASSWORD$"
                 condition before it tries to call the Primos ATCH$$ routine.
                 It calls that Primos  routine  with  all  of  its  arguments
                 (which  are  not processed in any way), and returns normally
                 if there was no error in attaching to  the  directory.   Any
                 errors  cause  an  error message to be issued and control is
                 returned to the calling procedure.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 code


            _C_a_l_l_s

          |      Primos atch$$, Primos mkonu$, Primos pl1$nl


          | _B_u_g_s

          |      Should be converted to use the new Primos 'at$?*' routines.





            at$swt (6)                    - 1 -                    at$swt (6)




            at$swt (6) --- Subsystem interlude to Primos ATCH$$      08/30/84


            _S_e_e _A_l_s_o

                 follow (2), getto (2), tscan$ (6), Primos atch$$























































            at$swt (6)                    - 2 -                    at$swt (6)


