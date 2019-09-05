

            mktr$ (6) --- convert a pathname into a treename         03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function mktr$ (path, tree)
                 character path (ARB), tree (MAXPATH)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Mktr$'  is  used  to  convert  a Subsystem pathname into an
                 equivalent Primos treename.  The argument 'path' is an  EOS-
                 terminated  string  containing the pathname to be converted.
                 The argument 'tree'  is  a  string  that  will  receive  the
                 equivalent  Primos  treename.   The  function  return is the
                 length of the treename returned in 'tree'.

                 The pathname may begin with a series of  backslashes  ("\"),
                 each  of which indicates a one-level ascension in the direc-
                 tory hierarchy.  For example, the  pathname  "\"  means  the
                 directory  which is the parent of the current directory, and
                 "\\file2" means the file named "file2" in the grandparent of
                 the current directory.

                 Slashes in the input pathname that are preceded  by  an  at-
                 sign  ("@")  are  passed  through to the treename unchanged;
                 they are not interpreted as separator characters.

                 Multiple slashes (except at the beginning of the  path)  are
                 ignored.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  first  characters in the pathname determine the initial
                 portion of the treename.  If there are two leading  slashes,
                 then  the  treename begins with "mfd".  If there is only one
                 leading  slash,  then  a  packname  was  specified  and  the
                 treename  begins with "<packname>mfd".  If there are leading
                 backslashes, then the Primos routine GPATH$ is called to get
                 the name of the current directory, and the appropriate  por-
                 tion  becomes  the  start of the treename.  The remainder of
                 the conversion consists mostly of substituting  slashes  for
                 greater-than signs and handling escape sequences.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 tree


            _C_a_l_l_s

                 scopy, Primos gpath$, ptoc, mapstr




            mktr$ (6)                     - 1 -                     mktr$ (6)




            mktr$ (6) --- convert a pathname into a treename         03/25/82


            _S_e_e _A_l_s_o

                 mkpa$ (6), follow (2), getto (2)























































            mktr$ (6)                     - 2 -                     mktr$ (6)


