

            mkdir$ (6) --- create a directory                        07/04/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function mkdir$ (name, owner, non_owner)
                 character name (ARB), owner (ARB), non_owner (ARB)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mkdir$'  is  used  to create a new directory.  The argument
                 'name' is the pathname of the directory to be  created;  the
                 arguments 'owner' and 'non_owner' specify the owner and non-
                 owner  passwords,  respectively,  of the new directory.  The
                 function return is OK  if  the  directory  was  successfully
                 created, ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Getto'  is  called  to  attach  to the directory which will
                 become the parent of the new directory.  A call to  'findf$'
                 insures that the directory does not already exist.  The pas-
                 sword  strings  are  converted to packed format via calls to
                 'ctop'.  The Primos  routine  CREA$$  actually  creates  the
                 directory  and  sets the passwords.  Then the Primos routine
                 SATR$$ is called to set the protection so that the owner has
                 all rights and non-owner has read access.


            _C_a_l_l_s

          |      ctop, findf$, getto, Primos at$hom,  Primos  crea$$,  Primos
          |      satr$$


            _S_e_e _A_l_s_o

                 follow (2), getto (2), mkdir (1)



















            mkdir$ (6)                    - 1 -                    mkdir$ (6)


