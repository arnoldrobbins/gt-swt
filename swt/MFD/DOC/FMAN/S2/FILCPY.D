

            filcpy (2) --- copy a file and its attributes            03/06/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function filcpy (from, to)
                 character from (ARB), to (ARB)

                 Library:  vswtlb  (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Filcpy'  is  used to copy a file from one place to another,
                 insuring  that  the  copy  possesses  the  same   attributes
                 (protection  keys,  time  of  last  modification, read/write
                 lock, and dumped/modified bits) as the original.

                 The 'from' argument is the pathname of the source file;  the
                 'to' argument is the pathname of the destination.  The func-
                 tion return is OK if the copy succeeded, ERR otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Filcpy'  obtains the 'from' files attributes with a call to
          |      the Primos routine ENT$RD and then opens it with a  call  to
          |      the  Primos routine SRCH$$.  An attempt is then made to open
                 the 'to' file with the same type.  If the attempt fails, the
                 'to' file is removed and  an  error  exit  occurs.   If  the
                 destination  file  is  a  non-empty segment directory, it is
                 then cleaned out with 'rmseg$'.

                 The file is copied by 'cpfil$' or  'cpseg$',  if  it  is  an
                 ordinary  file  or a segment directory, respectively.  If it
                 is ordinary, it is truncated after the copy to  insure  that
                 no old data remains.

                 Several  calls to the Primos routine SATR$$ are then made to
                 set the destination file's attributes.


            _C_a_l_l_s

          |      getto, Primos srch$$, Primos ent$rd, ptoc,  remove,  rmseg$,
                 cpseg$, cpfil$, Primos prwf$$, Primos satr$$


            _S_e_e _A_l_s_o

                 fcopy (2), cp (1)










            filcpy (2)                    - 1 -                    filcpy (2)


