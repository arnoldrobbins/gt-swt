

            lsallo (4) --- allocate space for a linked string        01/03/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 pointer function lsallo (ptr, len)
                 pointer ptr
                 integer len

                 Library:  vlslb


            _F_u_n_c_t_i_o_n

                 A   string  of  length  'len'  (not  counting  the  EOS)  is
                 allocated.  The pointer to the string is returned  in  'ptr'
                 and  as  the  function  value.   If  all  attempts  to  find
                 sufficient space fail, an error diagnostic ("Too many linked
                 strings") is issued and the program is aborted.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 First, a test is made to see if there are  'len'  characters
                 available  between  the highest used location and the top of
                 the string space  to  allocate  the  string.   If  not,  the
                 available  space  list  is  followed to find space.  If both
                 fail, storage is reclaimed by calling 'lsfree' to deallocate
                 the available space  list,  decrementing  the  highest  open
                 pointer  to the first allocated location, and rebuilding the
                 available space  list.   If  a  second  search  then  fails,
                 'error'  is  called  to  print  the diagnostic and abort the
                 program.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 ptr


            _C_a_l_l_s

                 error, lsdump, lsfree, remark


            _B_u_g_s

                 There is no way for the user to intercept  a  'string  space
                 full' condition.

                 If  not  enough  space  is available in either the available
                 space list or highest open list, but enough is available  in
                 both, an error is still signalled.

                 Locally supported.






            lsallo (4)                    - 1 -                    lsallo (4)




            lsallo (4) --- allocate space for a linked string        01/03/83


            _S_e_e _A_l_s_o

                 lsfree (4)























































            lsallo (4)                    - 2 -                    lsallo (4)


