

            getarg (2) --- fetch command line arguments              03/23/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function getarg (n, arg, arg_len)
                 integer n, arg_len
                 character arg (arg_len)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Getarg'  is  used to retrieve the arguments supplied on the
                 command line that invoked a program.  The first argument  is
                 the  ordinal  of  the command argument to be fetched:  1 for
                 the first, 2 for the second, etc.  The second argument is  a
                 string  to  receive  the command argument being fetched; the
                 third argument is the maximum length  of  the  string.   The
                 function  return  from 'getarg' is the length of the command
                 argument fetched, if the fetch was successful;  EOF  if  the
                 argument  could  not  be fetched.  Argument 0 is the name of
                 the command calling 'getarg'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 The Subsystem command interpreter maintains the list of com-
                 mand arguments in its linked-string storage area.   'Getarg'
                 uses  the  array  of pointers into this area supplied by the
                 command interpreter to locate  the  desired  argument,  then
                 copies the characters to the user's buffer one-by-one.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 arg


            _B_u_g_s

                 A  program can have at most 256 arguments.  There is no con-
                 venient way to find out how many arguments  have  been  sup-
                 plied  on an invocation without searching through the entire
                 list with calls to 'getarg'.


            _S_e_e _A_l_s_o

                 chkarg (2), getkwd (2)










            getarg (2)                    - 1 -                    getarg (2)


