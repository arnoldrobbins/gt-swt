

            rf (3) --- original Ratfor preprocessor                  03/24/82


            _U_s_a_g_e

                 rf [-t | -p | -c]
                    [ [-o <output file>] <input file> { <input file> } ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rf'  is  an  extended  version  of  the Ratfor preprocessor
                 described in _S_o_f_t_w_a_r_e _T_o_o_l_s.  For a complete description  of
                 'rf', see the book.  For a summary of Ratfor constructs, see
                 _S_o_f_t_w_a_r_e _T_o_o_l_s or the _R_a_t_f_o_r _P_r_o_g_r_a_m_m_e_r_'_s _G_u_i_d_e.

                 Note  that 'rf' has been superseded by 'rp', and will not be
                 supported beyond Version 7 of the Subsystem.

                 The following is a summary of the differences between  stan-
                 dard Ratfor and the language accepted by 'rf':

                 1.   When  supplied  with no <file> arguments, 'rf' operates
                      as a filter, taking its input from standard  input  and
                      writing its output on standard output.

                      When  any  <input file> arguments are given, 'rf' takes
                      its   input   from    the    specified    files.     If
                      "-o <output file>"  is specified as the first argument,
                      output is directed to <output file>.   Otherwise,  ".f"
                      will  be appended to (or will replace a ".r" at the end
                      of) the first <input file> name to construct  the  name
                      of the output file.

                      The  table  of  definitions  is not cleared between the
                      input files, so definition files can be invoked without
                      being added to the source file(s).

                 2.   Include statements are of the following format:

                           include '<filename>'
                           include "<filename>"
                           include <filename>

                      where <filename> may be any valid  Subsystem  pathname.
                      If,   however,   the   <filename>   contains  any  non-
                      alphanumeric characters, one of the quoted  forms  mmmuuusssttt
                      be used.

                 3.   'Rf'  will  accept  upper or lower case input, and will
                      map lower case input to upper case,  except  in  quoted
                      strings.   Definitions  are  case sensitive, however; a
                      lower case token appearing in the left-hand side  of  a
                      'define'  statement will be replaced only if it appears
                      as a lower case token in the text.

                 4.   'Rf' uses the tilde (~) for "not".  Thus,  .ne.   would
                      be represented as ~=.  An exclamation point may be used
                      instead of the tilde for the benefit of Teletype users.


            rf (3)                        - 1 -                        rf (3)




            rf (3) --- original Ratfor preprocessor                  03/24/82


                 5.   'Rf'  will  accept  and  discard an underline appearing
                      within an identifier.  For example, 'get_arg'  will  be
                      interpreted  as  'getarg'.  The underline may not begin
                      the identifier.

                 6.   'Rf' allows arbitrarily long identifiers  and  replaces
                      them  with unique six-character names acceptable to the
                      Fortran compiler.  The generated names retain the first
                      character so as not to disturb implicit typing.

                 7.   The 'andif' and  'orif'  constructs  suggested  in  the
                      exercises  in  Software  Tools  have  been  added.  Two
                      syntactic  forms  are   available   to   invoke   these
                      constructs:

                           The  '||'  and  '&&'  operators may be used in the
                           condition part of an if statement to specify  orif
                           and  andif, respectively.  If this syntax is used,
                           the condition mmmaaayyy nnnooottt contain nested parentheses.

                           The  keywords  'orif'  and  'andif'  may  be  used
                           explicitly.   With  this  syntax, an orif or andif
                           statement may be preceded only by an if  statement
                           or another orif or andif statement.

                 8.   Multilevel   break   and   next  statements  have  been
                      implemented.  Syntax is:

                           break [ <integer> ]
                           next  [ <integer> ]

                      The integer, if specified, determines how many surroun-
                      ding loops will be  terminated  or  continued,  respec-
                      tively.  If omitted, 1 is assumed.

                 9.   A  case  statement  has been implemented.  Syntax is as
                      follows:

                           case <variable> <compound statement>
                           [ else <statement> ]

                      <Variable> is an integer variable whose  value  selects
                      which  of the statements in the <compound statement> is
                      to be executed:  if the  variable's  value  is  1,  the
                      first  statement  is selected, etc.  At most one of the
                      statements is performed.   If  there  is  no  statement
                      corresponding   to  the  value  of  the  variable,  the
                      <statement> after "else" is executed if the  "else"  is
                      present;   otherwise,   execution   resumes  after  the
                      <compound statement>.

                      Currently, case statements may be nested to a depth  of
                      10 and may contain as many as 392 alternatives each.

                 10.  The string declaration has been implemented.  Syntax is



            rf (3)                        - 2 -                        rf (3)




            rf (3) --- original Ratfor preprocessor                  03/24/82


                           string <variable> <quoted string>

                      String   declarations  must  appear  before  the  first
                      executable statement of a program unit.

                 11.  The "-p" option may be used to permit profiling studies
                      to be performed on Ratfor programs.  The option  causes
                      insertion  of  code  that,  at  run  time,  will record
                      statistical   information   on   program   performance.
                      Profiled  programs  will behave in exactly the same way
                      as they would normally, except that they will run  VVVEEERRRYYY
                      SSSLLLOOOWWWLLLYYY...   The  utility command 'profile' may be used to
                      print up a neat report of  a  profiled  program's  per-
                      formance.   The files "timer_dictionary" and "_profile"
                      are generated by 'rf' and the profiled program, respec-
                      tively.

                 12.  The "-t" option may be used to cause an  execution-time
                      trace  of the Ratfor program.  The trace consists of an
                      indented listing which indicates the point of call  and
                      return for each subprogram.

                 13.  The  "-c" option may be used to perform statement-level
                      profiling  studies  on  Ratfor  programs.   The  option
                      causes  insertion  of  code  that  counts the number of
                      times each statement is executed and  then  writes  the
                      totals  to  the  file  "_st_profile", where they may be
                      read   and   summarized   by   the   utility    program
                      'st_profile'.   The statement count statistics gathered
                      by  this  option  are  inherently  more  reliable  (and
                      probably   more  useful)  than  the  time  measurements
                      gathered by the "-p" option.



            _E_x_a_m_p_l_e_s

                 command line format:
                      rf -p prog.r
                      rf -o prog prog.r
                      prog.r> rf -t >prog.f

                 orif and andif:
                      if (c1 || c2 && c3 || c4)   statement1
                      else   statement2

                      if (c1) andif (c2) orif(c3)   statement1
                      else    statement2

                 break and next:
                      repeat {
                         while (condition)
                            if (c1)  break 2    # terminate repeat
                            else     next 2     # continue repeat
                        } until (c2)



            rf (3)                        - 3 -                        rf (3)




            rf (3) --- original Ratfor preprocessor                  03/24/82


                 case:
                      case i {                      goto L4
                         stmt1       is       L1    stmt1; goto L5
                         stmt2   equivalent   L2    stmt2; goto L5
                         stmt3       to       L3    stmt3; goto L5
                         }                    L4    goto(L1,L2,L3),i
                      else                          stmt4
                         stmt4                L5    continue

                 profiling:
                      rf -p prog.r; fc prog.f; ld prog.b -o prog
                      prog
                      profile | sp
                 
                      rf -c prog.r; fc prog.f; ld prog.b -o prog
                      prog
                      st_profile prog.r | sp


            _F_i_l_e_s

                 "timer_dictionary" for programs compiled with "-p" option.


            _M_e_s_s_a_g_e_s

                 Extensive.  Most are self-explanatory.  See  _S_o_f_t_w_a_r_e  _T_o_o_l_s
                 for a complete list.


            _B_u_g_s

                 <integer>  must  be followed by a NEWLINE in the multi-level
                 break and next statements.

                 'andif' and 'orif' constructs may  not  appear  in  'while',
                 'for' or 'repeat' statements.

                 When  the statement-level profile option ("-c") is used, the
                 count displayed for each line is the total number  of  times
                 all  statements  on that line were executed; thus, for exam-
                 ple, the line
                       repeat c = c + 1; until (prime (c) == YES)
                 will have a displayed count equal to three times the  actual
                 number  of  loops  (once  for  the  'repeat',  once  for the
                 assignment, and once for the test).  In addition, note  that
                 only the statements in the uppermost level file are counted;
                 any   code  compiled  as  a  result  of  an  'include'  will
                 contribute to the total for that 'include'.


            _S_e_e _A_l_s_o

                 profile (1), st_profile (1), rp (1), _S_o_f_t_w_a_r_e _T_o_o_l_s




            rf (3)                        - 4 -                        rf (3)


