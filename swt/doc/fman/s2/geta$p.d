

            geta$p (2) --- fetch arguments for a Pascal program      02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 type string128 = array [1..128] of char;
                 function geta$p (    ap:  integer;
                                 var str: string128;
                                     len: integer) : integer;

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Geta$p' fetches an argument from the Subsystem command line
                 in  a format useable by a Pascal program.  The arguments are
                 analogous to those used by 'getarg'.  'Ap' is the number  of
                 the  argument  to be fetched:  0 for the command name, 1 for
                 the first argument, 2 for  the  second,  etc.   'Str'  is  a
                 string to receive the argument, while 'len' is the number of
                 characters allocated to 'str'.  The function return value is
                 either  the length of the argument string actually returned,
                 or EOF (-1) if there is no argument in that position.
                 
                 To use 'geta$p', it must be declared as a level 1  procedure
                 in the Pascal program:
                 
                 function geta$p (    ap:  integer;
                                 var str: string128;
                                     len: integer) : integer; extern;
                 
                 It may then be called as a function wherever desired.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Geta$p'  simply  calls  'getarg' with the argument pointer,
                 and then calls 'ctop' to convert the result into the  proper
                 Pascal format, after it has blank-filled 'str'.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 ctop (2), getarg (2)


            _B_u_g_s

                 If  'len'  is  an  odd number, 'geta$p' will at most, return
                 'len - 1' characters of the argument.





            geta$p (2)                    - 1 -                    geta$p (2)




            geta$p (2) --- fetch arguments for a Pascal program      02/24/82


            _S_e_e _A_l_s_o

                 getarg (2), geta$f (2), geta$plg (2)























































            geta$p (2)                    - 2 -                    geta$p (2)


