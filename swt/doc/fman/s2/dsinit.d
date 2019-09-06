

            dsinit (2) --- initialize dynamic storage space          03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine dsinit (w)
                 integer w

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Dsinit'  initializes an area of storage in the common block
                 DS$MEM so that the routines 'dsget' and 'dsfree' can be used
                 for dynamic storage allocation.  The memory  to  be  managed
                 must  be  supplied  by  the user, by two declarations of the
                 form:

                    integer mem (MEMSIZE)
                    common /ds$mem/ mem

                 or  the  "DS_DECL"  system  macro  can  be  used   for   the
                 declarations as follows:

                    DS_DECL (mem, MEMSIZE)

                 The  memory  size (supplied by the user) must then be passed
                 to 'dsinit' as its argument:

                    call dsinit (MEMSIZE)


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Dsinit' sets up an available space list consisting  of  two
                 blocks,  the  first  empty  and  the  second  containing all
                 remaining memory.  The  first  word  of  memory  (below  the
                 available  space  list)  is set to the total size of memory;
                 this information is used only by the dump routines  'dsdump'
                 and 'dsdbiu'.


            _C_a_l_l_s

                 error


            _S_e_e _A_l_s_o

                 dsget (2), dsfree (2), dsdump (2), dsdbiu (6)










            dsinit (2)                    - 1 -                    dsinit (2)


