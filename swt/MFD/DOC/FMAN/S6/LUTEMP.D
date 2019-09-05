

            lutemp (6) --- look up a template in the template directory  09/15/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function lutemp (temp, str, strlen)
                 integer strlen
                 character temp (ARB), str (strlen)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

          |      'Lutemp'  converts  a  single  template  into its equivalent
                 string representation.  The argument 'temp' is the  template
          |      to be expanded; 'str' is the string to receive the expansion
          |      of  at  most  'strlen' characters.  The function returns the
          |      length of the expanded string contained in 'str' if the tem-
                 plate was found, EOF otherwise.

                 Normally, the routine 'expand' would be called to  expand  a
                 template,  since it rescans the text returned by 'lutemp' to
                 evaluate any nested templates.

          |      The following dynamic templates are available:

                      date      the current date, in form MMDDYY

                      time      the current time, in form HHMMSS

                      user      the login name of the user calling 'expand'

                      pid       the  process  id  of  the   process   calling
                                'expand'

                      passwd    the  Subsystem  password  of the user calling
                                'expand'

                      day       the name of the current day of the week (e.g.
                                tuesday)

          |           home      the  login  directory  of  the  user  calling
          |                     'expand'

                 The   statically-defined   templates   reside  in  the  file
                 "=template=", and may be changed at the  discretion  of  the
                 Subsystem  manager.   For  a complete list of templates, see
                 the _U_s_e_r_'_s _G_u_i_d_e _t_o _t_h_e _P_r_i_m_o_s _F_i_l_e _S_y_s_t_e_m.

                 Users may create their own  personal  templates  by  placing
                 template   names   and   replacement   text   in   the  file
                 "=utemplate="   (nominally   "=varsdir=/.template").     The
                 template   file  is  a  standard  text  file  which  may  be
                 manipulated by any of the usual text processing tools.  Each
                 template appears on a line by itself, followed by blanks and
                 its  replacement  text.   Blank  lines  and  comment   lines
                 (beginning  with  "#")  may be added to the template file to
                 improve readability.  For an example of a template file, see


            lutemp (6)                    - 1 -                    lutemp (6)




            lutemp (6) --- look up a template in the template directory  09/15/83


                 =template=.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Lutemp' first looks up the requested template in  a  hashed
          |      symbol  table,  which  contains  the  values of all "static"
          |      (determined at Subsystem initialization time) templates  and
          |      resides  in  the  shared  Subsystem  data area, checking the
          |      user's personal templates and then the  system-defined  tem-
          |      plates.  If the search succeeds, 'lutemp' returns the string
          |      value  associated  with  the  template.  Otherwise, 'lutemp'
          |      assumes that the template is dynamic and searches  a  second
          |      shared hash table containing the values of dynamic template.
          |      If  it  finds  the  template in this table, 'lutemp' uses an
          |      associated function code value to direct  appropriate  calls
          |      to 'date' (for time, date, day, pid, user) or to file system
          |      routines (for home), or to read values from Subsystem common
          |      areas (for passwd).


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

          |      equal,  date,  gcdir$, length, mapstr, scopy, Primos at$hom,
          |      Primos at$or


            _B_u_g_s

                 There is no protection against setting static values for the
                 dynamic templates.  The user can possibly cause problems for
                 both himself and other Subsystem users by  setting  his  own
                 values for the dynamic template names.


            _S_e_e _A_l_s_o

                 expand (2), open (2), getto (2), follow (2), _U_s_e_r_'_s _G_u_i_d_e _t_o
                 _t_h_e _P_r_i_m_o_s _F_i_l_e _S_y_s_t_e_m














            lutemp (6)                    - 2 -                    lutemp (6)


