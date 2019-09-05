

            vt$def (6) --- accept a macro definition from the user   o7/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function vt$def (dummy)
                 integer dummy

          |      Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Vt$def' is used to accept a macro definition from the user.
                 If a status line is enabled, the user is prompted, otherwise
                 he must remember the entry format himself.  The format is

                           <del><seq1><del><seq2><del>

                 where  <del>  is  a  delimiter  not used in either sequence,
                 <seq1> is the macro, and <seq2> is the substitution  string.
                 When  the  macro  sequence  is  entered,  it  is immediately
                 replaced by the substitution string.  If there  is  no  room
                 for  another  definition,  no  room for another substitution
                 sequence, or an illegal sequence is  entered,  the  function
                 return  is  ERR  and  'vt$err'  is  called  to  print  an an
                 appropriate message, otherwise the function return is OK.


            _C_a_l_l_s

                 vt$alc, vt$err, vt$gsq, vt$rdf,  vtmsg,  vtupd,  and  Primos
                 c1in


            _B_u_g_s

                 Not meant to be called by the normal user.


            _S_e_e _A_l_s_o

                 Primos t1in and other vt?* routines (2) and (6)


















            vt$def (6)                    - 1 -                    vt$def (6)


