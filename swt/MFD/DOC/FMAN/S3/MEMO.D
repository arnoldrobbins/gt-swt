

            memo (3) --- automated memo and reminder system          01/13/83


            _U_s_a_g_e

                 memo [[[-t] <user>] [-d <display_cond>] [-e <erase_cond>]]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Memo'  allows  a  user to send dated memos to himself or to
                 another user.  'Memo' differs from 'mail' in  that  "display
                 conditions"  and  "erase  conditions"  may  be specified for
                 memos; i.e., the user  has  control  over  when  a  memo  is
                 displayed  and  how  long  it will be displayed before it is
                 deleted.

                 The simplest usage is just "memo".   This  form  checks  the
                 current  user's  memo file, displays any memos whose display
                 conditions yield "true", and deletes any memos  whose  erase
                 conditions  yield  "true".   Normally,  a user would include
                 this form of  the  'memo'  command  in  his  "_hello"  shell
                 variable,  so  it  would  be executed whenever he enters the
                 Subsystem.

                 The other forms of the command are used to send a memo.  The
                 "-t" ("to") option, followed by a  valid  user  login  name,
                 specifies  the intended recipient of the memo.  The "-t" may
                 be omitted if desired.  If no user name is  specified,  then
                 the  memo  is  sent  to oneself.  The "-d" option, if given,
                 must be followed by a boolean display  condition  (discussed
                 below).   When  this  condition  is "true", the memo will be
                 displayed.  The default display condition is "always".   The
                 "-e" option, if given, must be followed by a boolean erasure
                 condition  (also  discussed  below).  When this condition is
                 "true", the memo will be removed from the user's memo  file,
                 regardless  of  whether  or  not it has ever been displayed.
                 The default erasure condition is "always".

                 Display  and  erasure  conditions  are  boolean  expressions
                 involving  variables  concerned  with  the  current time and
                 date.  The allowable syntax is as follows:

                      expression -> secondary { '&' secondary }
                      secondary -> primary { '|' primary }
                      primary -> '~' '(' expression ')'
                               |  '(' expression ')'
                               |  relation
                               |  'always'
                               |  'never'
                      relation -> arithprim relop arithprim
                      relop -> '=' | '==' | '~=' | '<>' | '<' | '>' | '<=' | '>='
                      arithprim -> integer_constant
                               |  symbolic_constant
                               |  time_variable
                      symbolic_constant ->
                                  sunday | sun
                               |  monday | mon
                               |  tuesday | tue


            memo (3)                      - 1 -                      memo (3)




            memo (3) --- automated memo and reminder system          01/13/83


                               |  wednesday | wed
                               |  thursday | thu
                               |  friday | fri
                               |  saturday | sat
                               |  january | jan
                               |  february | feb
                               |  march | mar
                               |  april | apr
                               |  may
                               |  june | jun
                               |  july | jul
                               |  august | aug
                               |  september | sep
                               |  october | oct
                               |  november | nov
                               |  december | dec
                      time_variable ->
                                  month       # the current month, 1-12
                               |  day         # the day of the month, 1-31 (usually)
                               |  year        # the current year, e.g. 80
                               |  dow         # the day of the week, 1-7
                               |  hour        # the hour of the day, 0-23
                               |  minute      # the minute of the hour, 0-59

                 Some examples of conditions might be helpful.

                 The condition "always" is always true.  Thus, if used  as  a
                 display  condition,  the  memo will always be displayed.  If
                 used as an erase condition, the  memo  will  be  immediately
                 deleted  (although  it  may well have been displayed first).
                 The condition "(month=March)&(day>3)" will be true  only  on
                 days  in  March after March third (in any year).  The condi-
                 tion "(dow=Friday)" will be true on any Friday, false other-
                 wise.  The condition "(month=feb)&(day=2)" will be  true  on
                 Groundhog  Day.   The condition "(dow=mon)&(day=13)" will be
                 true on those months in which Friday the 13th falls on  Mon-
                 day.


            _E_x_a_m_p_l_e_s

                 memo

                 memo system
                  See about fixing 'lps'
                  <Control-C>

                 memo -d "(month=mar)&(day<9)" -e "(month>=mar)&(day>=9)"
                  See "In the Name of the Father" at Alliance Studio
                  <Control-C>


            _F_i_l_e_s

                 =extra=/memo/<login_name> for storing memos
                 =userlist= for verifying user names


            memo (3)                      - 2 -                      memo (3)




            memo (3) --- automated memo and reminder system          01/13/83


            _M_e_s_s_a_g_e_s

                 "bogus  character in expression" an unrecognizable character
                      appeared in a display or erasure condition
                 "undefined variable" the parser encountered a variable  that
                      was  not  a  symbolic  constant  or  time  variable, as
                      defined in the lists above
                 "illegal user name" the named user is not in  the  Subsystem
                      user list
                 "illegal  user name or improper argument syntax" the command
                      line could not be parsed properly
                 "can't open memo file" the user's memo  file  could  not  be
                      opened
                 "memo  file  not  available" the addressee's memo file could
                      not be opened
                 "Usage:  memo ..."  command line was undecodable
                 "stack overflow" a condition was  too  complex  to  evaluate
                      fully
                 And  several  self-explanatory  messages from the expression
                      parser.


            _B_u_g_s

                 Needs a more concise syntax for expressing dates.   Is  sub-
                 ject  to  all  the  security  problems of 'mail'.  Lacks the
                 ability to file copies of memos away when they  are  removed
                 from the active memo file.


            _S_e_e _A_l_s_o

                 mail (1), to (1), stacc (1)

























            memo (3)                      - 3 -                      memo (3)


