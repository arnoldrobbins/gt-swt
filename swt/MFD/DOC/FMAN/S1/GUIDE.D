

            guide (1) --- Software Tools Subsystem User's Guides     08/27/84


          | _U_s_a_g_e

                 guide  { <option> | <item> }
                    <option> ::=  -p
                    <item> ::= <guide_name>


            _D_e_s_c_r_i_p_t_i_o_n

          |      Several of the more complicated or more frequently used Sub-
          |      system  commands and libraries have additional documentation
          |      beyond that which is available from  the  reference  manual.
          |      This  documentation  is  in  the form of a separate paper on
          |      each command or library, but these papers may be combined to
          |      form the _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _U_s_e_r_'_s _G_u_i_d_e.

                 The command

                      guide <guide name>

                 prints the named guide in a format suitable for reading on a
                 fast CRT terminal.

                 The command

                      guide -p <guide name>

                 prints the named guide in a format  suitable  for  the  line
                 printer.

                 Copies  of individual documents may be printed on one of the
                 on-site line printers by giving the following command:

                      guide -p <guide name> | os >/dev/lps/f

                 where "<guide name>" is one of the following guide names:


          |      cc

          |           A copy of the _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _G_e_o_r_g_i_a  _T_e_c_h  _C
          |           _C_o_m_p_i_l_e_r.    This   guide   describes   the   necessary
          |           requirements for compiling programs written in  C  from
          |           the  Subsystem.  Refer to _T_h_e _C _P_r_o_g_r_a_m_m_i_n_g _L_a_n_g_u_a_g_e by
          |           Brian Kernighan and Dennis Ritchie for specific details
          |           about the C programming language.  TTThhhiiisss ggguuuiiidddeee  iiisss  ooonnnlllyyy
          |           aaavvvaaaiiilllaaabbbllleee  tttooo  cccuuussstttooommmeeerrrsss  wwwhhhooo  hhhaaavvveee aaalllsssooo llliiiccceeennnssseeeddd ttthhheee CCC
          |           lllaaannnggguuuaaagggeee cccooommmpppiiillleeerrr pppaaaccckkkaaagggeee...


          |      ed

          |           A copy of  _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _T_e_x_t
          |           _E_d_i_t_o_r  is  printed.  This paper includes a tutorial on
          |           the Subsystem's text editor that is highly  recommended
          |           for beginning users, as well as a command summary and a


            guide (1)                     - 1 -                     guide (1)




            guide (1) --- Software Tools Subsystem User's Guides     08/27/84


          |           special section on the Subsystem screen editor.


          |      fmt

          |           A  copy  of the _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _T_e_x_t _F_o_r_m_a_t_t_e_r
          |           _U_s_e_r_'_s  _G_u_i_d_e  is  printed.   This  includes  tutorial,
          |           reference,  and  applications  information.   One  very
          |           useful appendix contains all text formatting  commands,
          |           arranged alphabetically.


          |      fs

          |           A  copy  of  _U_s_e_r_'_s  _G_u_i_d_e _t_o _t_h_e _P_r_i_m_o_s _F_i_l_e _S_y_s_t_e_m is
          |           printed.  This paper gives a brief introduction to  the
          |           Primos file system as it applies to the use of the Sub-
          |           system.   It explains the structure of the file system,
          |           provisions for security, and how users access files  by
          |           name.


          |      math

          |           A copy of the _S_W_T _M_a_t_h _L_i_b_r_a_r_y _U_s_e_r_'_s _G_u_i_d_e is printed.
          |           This  includes descriptions of the Prime floating point
          |           hardware, the SWT math library, and the tests  used  to
          |           validate  the  SWT  library.  Appendices contain useful
          |           programs  to  help  determine  where  the  exponent  is
          |           located  on  your  particular  machine,  determine  the
          |           amount of loss of bits in  a  multiply  operation,  and
          |           calculate hexadecimal constants for use in mathematical
          |           routines.   The  addendum  documents the routines which
          |           used to be in the old, locally supported, math  library
          |           "vswtml."


          |      mgr

          |           A  copy of the _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _M_a_n_a_g_e_r_'_s _G_u_i_d_e
          |           is printed.  This guide is  useful  for  all  Subsystem
          |           managers  and  anyone  else  interested  in the instal-
          |           lation, maintenance, and daily operation  of  the  Sub-
          |           system.


          |      ring

          |           A  copy of _R_i_n_g _-_- _T_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _N_e_t_w_o_r_k
          |           _U_t_i_l_i_t_y is printed.  This paper documents the structure
          |           and use of 'ring', a utility which makes it easier  for
          |           the end user to deal with Primenet.






            guide (1)                     - 2 -                     guide (1)




            guide (1) --- Software Tools Subsystem User's Guides     08/27/84


          |      rp

          |           Prints  the  _R_a_t_f_o_r  _P_r_o_g_r_a_m_m_e_r_'_s _G_u_i_d_e.  This document
          |           includes a detailed description of the Ratfor  program-
          |           ming language as well as instructions for its use under
          |           the Subsystem.  It is essential for anyone hoping to do
          |           any   significant   amount  of  programming  using  the
          |           capabilities supplied by the Subsystem.


          |      sh

          |           A copy of _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m
          |           _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r is printed.  This  paper  discusses
          |           the features of the Subsystem command interpreter, cal-
          |           led the 'shell', on three levels:  a tutorial introduc-
          |           tion,  a  syntax  and semantics reference, and a set of
          |           applications notes.


          |      tutorial

          |           A copy of _T_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _T_u_t_o_r_i_a_l  is
          |           printed.   This  tutorial is intended as a user's first
          |           introduction  to  the   Subsystem   and   covers   such
          |           essentials  as logging in and out, features of the com-
          |           mand language, editing,  online  documentation  and  so
          |           forth.  NEW USERS SHOULD READ THIS DOCUMENT FIRST.


          |      v8.1

          |           A  copy  of  the  _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _V_e_r_s_i_o_n _8 _t_o
          |           _V_e_r_s_i_o_n _8._1 _C_o_n_v_e_r_s_i_o_n _G_u_i_d_e is  printed.   This  guide
          |           summarizes all user-visible changes that have been made
          |           between the Version 8 and Version 8.1 Subsystems.


          |      v9

          |           A  copy  of the _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _V_e_r_s_i_o_n _8._1 _t_o
          |           _V_e_r_s_i_o_n _9 _C_o_n_v_e_r_s_i_o_n _G_u_i_d_e is printed.  This guide sum-
          |           marizes all user-visible changes that  have  been  made
          |           between the Version 8.1 and Version 9 Subsystems.


                 vcg

                      A  copy  of  _A  _R_e_-_U_s_a_b_l_e  _C_o_d_e _G_e_n_e_r_a_t_o_r _f_o_r _P_r_i_m_e _5_0_-
                      _S_e_r_i_e_s _C_o_m_p_u_t_e_r_s _U_s_e_r_'_s _G_u_i_d_e.   'Vcg'  is  a  reusable
          |           general-purpose   code   generator   that   accepts  an
          |           "intermediate form" and produces  64V-mode  relocatable
          |           object  code,  or  optionally,  PMA.   The  V-mode code
                      generator is the back-end for the Georgia Tech  C  Com-
          |           piler.   TTThhhiiisss  ggguuuiiidddeee iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo cccuuussstttooommmeeerrrsss wwwhhhooo
          |           hhhaaavvveee aaalllsssooo llliiiccceeennnssseeeddd ttthhheee CCC lllaaannnggguuuaaagggeee cccooommmpppiiillleeerrr pppaaaccckkkaaagggeee...


            guide (1)                     - 3 -                     guide (1)




            guide (1) --- Software Tools Subsystem User's Guides     08/27/84


            _E_x_a_m_p_l_e_s

                 guide tutorial
                 guide -p rp | os >/dev/lps/f


            _F_i_l_e_s

                 Most of those contained in =doc=/fguide.


            _S_e_e _A_l_s_o

                 _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _R_e_f_e_r_e_n_c_e _M_a_n_u_a_l












































            guide (1)                     - 4 -                     guide (1)


