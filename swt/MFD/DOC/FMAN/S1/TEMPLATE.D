

            template (1) --- manipulate and display templates        03/25/82


            _U_s_a_g_e

                 template [-a | -r] [-l{usv}]  { <string> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Template'  allows  the  user  to expand templates, list the
                 contents of the system template file or his own private tem-
                 plate file, or edit the contents  of  his  private  template
                 file.   The operation of 'template' is controlled by command
                 line options as follows:

                 -a   add or change templates.  Any <string>s that appear  on
                      the command line are taken in pairs of the form

                           <name> <definition>

                      If  any template in the user's template file has a name
                      corresponding to <name>, its definition is replaced  by
                      <definition>;  otherwise,  the new template is added to
                      the file.

                 -r   remove templates.  Each <string> on the command line is
                      taken as the name of a template to be removed from  the
                      user's template file.

                 -l   list templates.  The contents of either the system tem-
                      plate  file  or  the  user's  private template file, or
                      both, are listed on standard output.  The "-l"  may  be
                      followed  by  one  or  more of the following options to
                      control the listing:

                      u    list the contents of the user's  private  template
                           file.

                      s    list the contents of the system template file.

                      v    print  a  label  before  listing  each set of tem-
                           plates.

                      If neither the "s" nor the "u" option is specified, "u"
                      is assumed by default.

                 Note that the "-l" option may be used with either  the  "-a"
                 or the "-r" option to list the modified templates.

                 In  the  absence  of  any  of  the above options, 'template'
                 expands each <string> argument  and  prints  the  result  on
                 standard  output.   In  order  to  allow  arbitrary  strings
                 containing templates to be  expanded,  it  is  necessary  to
                 enclose the template name in "equals" symbols (=) just as it
                 would  appear  in  a  pathname.  This is the _o_n_l_y context in
                 which 'template' requires or allows the name of  a  template
                 to be so enclosed.



            template (1)                  - 1 -                  template (1)




            template (1) --- manipulate and display templates        03/25/82


            _E_x_a_m_p_l_e_s

                 template =date= =time= =doc=/man
                 template -al mybin //mydir/bin.ufd
                 template -r oldtemp
                 template -lusv


            _F_i_l_e_s

                 =utemplate= for storage of personal templates


            _M_e_s_s_a_g_e_s

                 "Usage:  template ..."  for improper options
                 "<string>:   duplicate  name"  if two or more templates with
                      the same name are specified with "-a"
                 "<string>:  missing definition" if a template  name  is  not
                      followed by a definition string with "-a"
                 "<string>:   may  not  contain '='" if an attempt is made to
                      add a template name containing an equals sign
                 "file not altered" if either of the previous two messages is
                      issued
                 "<string>:  not in template file" if an attempt is  made  to
                      delete a non-existent template
                 "can't  open  user  template file" if "=utemplate=" can't be
                      opened for reading and writing
                 "can't open temporary file" if a  temporary  file  can't  be
                      created for the "-a" and "-r" options


            _S_e_e _A_l_s_o

                 expand (2), lutemp (6)
                 For  more  information on templates, see _U_s_e_r_'_s _G_u_i_d_e _t_o _t_h_e
                 _P_r_i_m_o_s _F_i_l_e _S_y_s_t_e_m in the _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _U_s_e_r_'_s
                 _G_u_i_d_e.




















            template (1)                  - 2 -                  template (1)


