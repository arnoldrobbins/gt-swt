

            filtst (2) --- perform existence and size tests on a file  09/10/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function filtst (path, zero, permissions, exists,
                    type, readable, writeable, dumped)
                 character path (MAXPATH)
                 integer zero, permissions, exists, type
                 integer readable, writeable, dumped

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Filtst' may be used to perform a number of tests on a named
                 file.   The  arguments  specify  which  tests are to be per-
                 formed, in a way described below.  The  function  return  is
                 YES  if all tests succeeded, NO if any one failed, or ERR if
                 a test could not be made.

                 'Path' is an EOS-terminated string containing  the  pathname
                 of the file to be tested.  'Zero' is -1 if the file is to be
                 tested  for  non-zero length, 1 if for zero length, and 0 if
                 it is not to be tested for length.  'Permissions' is  a  bit
          |      mask  of protection keys, as returned by the Primos routines
          |      DIR$RD and ENT$RD.  or  0  if  protections  are  not  to  be
                 tested.   'Exists'  is  -1  if  the file is to be tested for
                 nonexistence, 1 if for existence, and 0 if it is not  to  be
                 tested for existence.  'Type' is 0 if the file's type is not
                 to  be  tested;  otherwise,  it is the same as the file type
          |      returned by Primos ENT$RD logically or'ed with octal 100 (to
          |      distinguish between the SAM file  type  and  the  "no  test"
                 value).   'Readable'  is  -1 if the file is to be tested for
                 non-readability, 1 if for readability, and 0 if no  test  is
                 to  be  performed.   'Writeable'  is -1 if the file is to be
                 tested for non-writeability, 1 if for writeability, and 0 if
                 writeability is not to be tested.  'Dumped'  is  -1  if  the
                 file  is  to  be tested for not being dumped, 1 if for being
                 dumped, and 0 if the dumped bit is not to be tested.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      Various calls to the  Primos  routines  SRCH$$,  ENT$RD  and
          |      PRWF$$  are  made  to  check the attributes specified by the
                 arguments.  The function return is YES if and  only  if  the
                 results  of  all  tests were true, ERR if Primos detected an
                 error during any test, NO otherwise.


            _C_a_l_l_s

          |      getto, Primos srch$$, open,  close,  Primos  prwf$$,  Primos
          |      ent$rd, Primos at$hom





            filtst (2)                    - 1 -                    filtst (2)




            filtst (2) --- perform existence and size tests on a file  09/10/84


            _S_e_e _A_l_s_o

                 file (1), finfo$ (6)























































            filtst (2)                    - 2 -                    filtst (2)


