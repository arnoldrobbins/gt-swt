

            phist (1) --- print Subsystem history                    12/26/80


            _U_s_a_g_e

                 phist { -b <author> | -f <date> | -s <subject> | -q }
                       [-i <input file>]
                 <date> ::= <day> | <month>/<day> | <month>/<day>/<year>


            _D_e_s_c_r_i_p_t_i_o_n

                 The  purpose  of  'phist' is to print selected portions of a
          |      history  file.   The  history  file   chosen   by   default,
          |      "=doc=/hist/history", chronicles the ongoing development and
                 maintenance   of   the   Software  Tools  Subsystem  by  its
                 implementors at Ga.  Tech.  It consists of a series of dated
                 entries, each of which contains the name of  the  author,  a
                 list of commands or files affected, and a description of the
                 modification.

                 When  invoked  without  arguments, 'phist' simply prints out
                 the entire  history  file;  but  several  optional  argument
                 sequences  can  be  employed  to  sift  out  the interesting
                 entries.   The  "-b  <author>"  argument  sequence  may   be
                 specified  to  restrict the entries printed to those written
                 by a given author.  The syntax of <author> is  the  same  as
                 that  defined  for  patterns in the Software Tools Subsystem
                 text editors (see the _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s
                 _T_e_x_t _E_d_i_t_o_r for details).

                 The "-s <subject>" argument sequence tells 'phist' that only
                 those  entries  concerning  the  specified subject should be
                 printed.  <Subject> may also be an arbitrary pattern.

                 The "-f <date>" sequence allows the  user  to  tell  'phist'
                 that  he  only  wants  to  see entries written on or after a
                 specific date.  The format of <date> has three options:   if
                 a  single  integer  is specified, it designates a day of the
                 current month; if two integers  separated  by  a  slash  are
                 specified,  they  designate  a  month and day of the current
                 year; finally, if three integers separated  by  slashes  are
                 specified, they designate a specific month, day and year.

                 If the "-q" option is specified, 'phist' will only print the
                 heading  of  each selected entry (i.e., the date, author and
                 subject of the entry) and omit the explanatory text.  Other-
                 wise, the entire entry is printed.

                 If the "-i <input file>" is  specified,  'phist'  takes  its
                 input     from    <input    file>,    rather    than    from
                 "=doc=/hist/history".


            _E_x_a_m_p_l_e_s

                 phist
                 phist -s %se
                 phist -f 12/19


            phist (1)                     - 1 -                     phist (1)




            phist (1) --- print Subsystem history                    12/26/80


                 phist -f 1/31/79 -s stacc -b allen


            _F_i_l_e_s

                 =doc=/hist/history for the history  of  the  Software  Tools
                      Subsystem.


            _M_e_s_s_a_g_e_s

                 "history  file not available" if =doc=/hist/history does not
                      exist or is not readable.
                 "history  file  contains  apocryphal  information"  if   the
                      history file is incorrectly formatted.
                 "<author>:  bad author pattern" if the string following "-b"
                      is not a legal pattern.
                 "<subject>:   bad  subject  pattern" if the string following
                      "-s" is not a legal pattern.
                 "<date>:  bad date" if the  string  following  "-f"  is  not
                      recognizable as a date.
                 "Usage:  phist ..."  for incorrect argument syntax.


            _S_e_e _A_l_s_o

                 history (1), _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _U_s_e_r_'_s _G_u_i_d_e































            phist (1)                     - 2 -                     phist (1)


