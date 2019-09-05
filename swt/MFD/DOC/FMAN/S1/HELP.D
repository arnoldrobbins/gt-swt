

            help (1) --- provide help for users in need              08/27/84


          | _U_s_a_g_e

                 help  { <item> | <option> }
          |         <option> ::= -c | -d | -s | -f | -g | -i | -p | -u


            _D_e_s_c_r_i_p_t_i_o_n

                 'Help'  can be used to retrieve various types of information
                 concerning Subsystem commands and library subprograms.

                 General information on the Subsystem can be  had  simply  by
                 typing the command "help" with no arguments:

                           help

                 More comprehensive information can be obtained with the form

                           help item item...

                 'Help'  searches  the  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _R_e_f_e_r_e_n_c_e
                 _M_a_n_u_a_l for the named commands and subprograms and,  if  they
                 are  found, prints their manual entries.  Any uniquely-named
                 command or library subprogram may be found in this manner.

                 In the case of commands and subprograms that share a  common
                 name (e.g.  'print' or 'date') the ambiguity may be resolved
                 by  specifying the option "-c" to select the command or "-s"
                 to select the  subprogram.   If  neither  "-s"  or  "-c"  is
                 specified, the default behavior is the same as for "-c".

                 General  information not in the Reference Manual is accessed
                 with the "-g" option; for example,

                           help -g bnf

                 gives a short explanation of the extended  Backus-Naur  Form
                 (BNF)  used  to  describe  command  syntax  in the Reference
                 Manual.

                 An index of all documented commands and library  subprograms
                 can  be  generated with the "-i" option.  (This is an excel-
                 lent way of getting an overview of  what  functionality  the
                 Subsystem  has  to  offer.)  Furthermore, if some particular
                 function is desired, but the names of commands that  perform
                 that  function  are  unknown, the "-f" option may be used to
                 search the index for a  given  pattern.   For  example,  the
                 names  and  short  descriptions  of all commands and library
                 subprograms dealing with character strings will be listed by
                 the following command:

                           help -f string

                 (The "-f" option is an excellent way for a new user to track
                 down commands and subprograms that are germane to the  solu-
                 tion  of  a  particular  problem.)  (An aside to experienced


            help (1)                      - 1 -                      help (1)




            help (1) --- provide help for users in need              08/27/84


                 users:  the patterns following a "-f"  option  are  standard
                 Subsystem  regular  expressions,  identical to those used in
                 the text editors and the 'find' and 'change' commands.)

                 'Help' calls the 'page' subroutine in the Subsystem  library
                 to  print a screenful of information at a time; any response
                 that is acceptable to 'page' can be given as a  response  to
                 'help'.   Please  see  the  Reference  Manual  entry for the
                 'page'  routine  for  more  details  ("help page"  would  be
                 appropriate).   In  particular,  a  carriage  return  may be
                 entered to continue to the next  screenful  of  information.
                 While  the  'help'  processor  is  presenting  the text of a
                 Reference Manual entry, it prompts with the a string of  the
                 form  "<name> [<number>+] more ? ", where <name> is the name
                 of the command or routine for which help is being  provided,
                 and  <number>  is  the  number of the page (screenful) being
                 presented.  When the end of the Reference  Manual  entry  is
                 reached,      'help'     prompts     with     the     string
                 "<name> [<number>$] more ? ", with the dollar sign  indicat-
          |      ing  that  the end of the manual entry has been reached.  By
          |      default, 'help' instructs the 'page' subroutine to  use  any
          |      special  features  your  terminal  may  have,  via the 'vth'
          |      terminal handling library.  If you have a dumb terminal,  or
          |      a  hard-copy  terminal,  use  the "-d" option to tell 'help'
          |      that it is using a "dumb" terminal.

                 For extracting Reference Manual entries to  be  spooled  and
                 printed,  the  "-p"  option  may  be  used  to  turn off the
                 automatic  pagination  described  above.    When   "-p"   is
                 specified, the Reference Manual entries selected are printed
                 exactly  as  they  are  stored,  with underlining/boldfacing
                 intact, and indentation and page size unchanged.  This  out-
                 put  must  be  run  through 'os' before being printed on the
                 line printer.  Example:

                           help -p help rp fmt | os >/dev/lps/f

                 If the user only desires to see the syntax for  the  command
                 and  not  the  description,  then  the  "-u"  option  can be
                 specified.  This causes only  the  "Usage"  section  of  the
                 Manual  entry  to  be  retrieved for the given command.  The
                 'usage' Subsystem command is a shell  file  that  uses  this
                 option;  the  user normally does not need to specify it in a
                 call to 'help'.


            _E_x_a_m_p_l_e_s

                 help
                 help -g bnf
                 help e se date time
                 help -s date -c print
                 help -i
                 help -f file string input output
                 help -p fmt | os >/dev/lps/f
                 help -u se


            help (1)                      - 2 -                      help (1)




            help (1) --- provide help for users in need              08/27/84


            _F_i_l_e_s

                 =doc=/fman/s1/<command>.d for command documentation
                 =doc=/fman/s2/<subprogram>.d for subprogram documentation
                 =doc=/fman/s3/<command>.d for local command documentation
                 =doc=/fman/s4/<subprogram>.d for local subprogram documenta-
                      tion
                 =doc=/fman/s5/<command>.d for low-level  command  documenta-
                      tion
                 =doc=/fman/s6/<subprogram>.d    for   low-level   subprogram
                      documentation
                 =doc=/fman/contents for command and subroutine index
                 =temp=/tm?* for  temporary  files  to  store  the  Reference
                      Manual entry for paging


            _M_e_s_s_a_g_e_s

                 "Sorry,  no help is available for <command>" in case of mis-
                      sing or unreadable documentation file.
                 "Can't open index file =doc=/fman/contents"  in  case  index
                      file is missing or unreadable.
                 "<pattern>:  bad pattern" in case there is a syntax error in
                      a pattern following a "-f" option.
                 "cannot create scratch file for help entry" if a file in the
                      =temp=  directory could not be opened to store the help
                      text for paging.
                 "cannot close scratch file" if the scratch  file  in  =temp=
                      could not be closed.


            _S_e_e _A_l_s_o

          |      guide  (1),  pg  (1),  usage  (1),  page (2), _S_o_f_t_w_a_r_e _T_o_o_l_s
                 _S_u_b_s_y_s_t_e_m _R_e_f_e_r_e_n_c_e _M_a_n_u_a_l























            help (1)                      - 3 -                      help (1)


