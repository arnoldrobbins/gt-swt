

            ssr (1) --- set search rule                              08/27/84


          | _U_s_a_g_e

                 ssr [ <new search rule> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 The  'ssr'  command  allows  users of the Subsystem shell to
                 specify which directories and command  libraries  should  be
                 searched  in  the  process  of  invoking  a  command.  If an
                 argument is specified, it becomes the new  search  rule;  if
                 not, the search rule remains unchanged.  In either case, the
                 resulting search rule is printed.

                 The search rule consists of a string of 'elements' separated
                 by commas.  Each element is a template that specifies either
                 a special command library or a directory to be searched.  In
                 the  process  of invoking a command, the shell examines each
                 element in the search rule from  left  to  right.   In  each
                 element,  it  replaces all ampersands ("&") with the command
                 name specified by the user.  It then searches for a  command
                 by  that  name.   The  shell keeps examining elements of the
                 search rule until a command is located or  the  end  of  the
                 search rule is reached.

                 For example, the default search rule,

                      '^int,^var,&,=lbin=/&,=bin=/&'

                 specifies the following directories and libraries:

                      ^int      Internal commands - those commands recognized
                                and executed by the shell itself.

                      ^var      Shell variables - the effect of 'executing' a
                                variable   is  to  print  the  value  of  the
                                variable on standard output 1.

                      &         A  single  ampersand  specifies  the  current
                                working directory.

                      =lbin=/&  The   directory   '//lbin',   where  locally-
                                supported commands are stored.

                      =bin=/&   The directory '//bin',  where  standard  Sub-
                                system commands reside.  Note that the trail-
                                ing  slash  and ampersand MUST be included in
                                the search rule.



          | _E_x_a_m_p_l_e_s

                 ssr
                 ssr "^var,^int,&,//newshbin/&,//newbin/&"
                 ssr "^var,//project_lib/&"


            ssr (1)                       - 1 -                       ssr (1)




            ssr (1) --- set search rule                              08/27/84


            _S_e_e _A_l_s_o

                 set (1), declare (1), forget (1), vars (1), _U_s_e_r_'_s _G_u_i_d_e _f_o_r
                 _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r






















































            ssr (1)                       - 2 -                       ssr (1)


