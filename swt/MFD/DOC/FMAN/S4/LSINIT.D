

            lsinit (4) --- initialize linked string space            02/23/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine lsinit

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 'Lsinit'   initializes   the  string  space  and  associated
                 variables.  It _m_u_s_t be called before using any other  linked
                 string routines.

                 The  routines  in  the linked string library are intended to
                 overcome several disadvantages of  the  contiguously  stored
                 character  strings  used  throughout the Software Tools Sub-
                 system.  They facilitate operations such as insertion, dele-
                 tion and concatenation with a minimum of wasted storage  and
                 time.   These  routines also free the programmer from having
                 to explicitly manage the string storage.   However,  use  of
                 the  linked string routines is costly in that for operations
                 such as copying or replacing  single  characters,  they  are
                 slower   and   require  more  subprogram  calls  than  their
                 equivalent contiguous string  routines.   Therefore,  linked
                 strings  are  not  intended  to  replace contiguously stored
                 strings, but to provide an extension that  facilitates  com-
                 plex string manipulation.

                 All  linked  strings are allocated in the named common block
                 'ls$buf'.  Normally, the user does  not  directly  reference
                 this  block;  rather,  references  are made through pointers
                 returned from and passed  to  the  linked  string  routines.
                 Pointers are single-precision integer variables that contain
                 an  index of the starting location of the string in the com-
                 mon block.  The user has no need  to  examine  the  pointers
                 other  than  to  pass them as arguments to the linked string
                 routines.

                 Linked strings are stored  one  ASCII  character  per  word,
                 right-justified  with  zero  fill  and  terminated by an EOS
                 character.   Any  word  having  a  value  greater  than  300
                 (decimal)  is  interpreted  to  be  a pointer whose value is
                 obtained by subtracting 300 from the word.  This allows  for
                 the  non-contiguity  of  characters in the string, hence the
                 name "linked".

                 Space  for  new  strings  is  obtained  either  directly  or
                 indirectly through the 'lsallo' function.  'Lsallo' attempts
                 to allocate the string contiguously at the end of the common
                 block.  If this fails, the available space list is examined;
                 if  no space is found here, the garbage collector is invoked
                 and the searches are repeated.  Upon  a  second  failure  to
                 find sufficient space, an error diagnostic is issued and the
                 program terminated.

                 Old  strings  are deallocated using the 'lsfree' subroutine.


            lsinit (4)                    - 1 -                    lsinit (4)




            lsinit (4) --- initialize linked string space            02/23/82


                 Deallocated strings are marked with a special value and  are
                 not available for use until after garbage collection.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The  pointers  in the common block 'ls$buf' are set to their
                 proper values.  A call to 'lsinit' has the effect  of  deal-
                 locating all strings.


            _B_u_g_s

                 'Lsinit' must be called to initialize the string space.

                 No  provision  is made for specifying the size of the string
                 space.

                 Locally supported.







































            lsinit (4)                    - 2 -                    lsinit (4)


