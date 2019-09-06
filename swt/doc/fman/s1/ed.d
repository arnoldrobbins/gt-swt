

            ed (1) --- Software Tools text editor (extended)         09/10/84


          | _U_s_a_g_e

                 ed [ <pathname> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Ed'  is  the  Subsystem  version of the _S_o_f_t_w_a_r_e _T_o_o_l_s text
                 editor 'edit'.  This entry contains a short summary  of  the
                 editor's commands and allowable pattern elements; for a full
          |      description,  along with a tutorial, see the _I_n_t_r_o_d_u_c_t_i_o_n _t_o
          |      _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r.

                 Note that the commands accepted by 'ed' are also accepted by
                 the Subsystem screen editor 'se'.

                 Commands to 'ed'  consist  of  zero  or  more  "line  number
                 expressions"  followed  by a single-character mnemonic, pos-
                 sibly followed  by  additional  parameters.   The  following
                 table outlines the allowable line number expression syntax:

                           EEEllleeemmmeeennntttsss ooofff LLLiiinnneee NNNuuummmbbbeeerrr EEExxxppprrreeessssssiiiooonnnsss

                 _F_o_r_m           _V_a_l_u_e


                 integer        value of the integer (e.g., 44).

                 .              number of the current line in the buffer.

                 $              number of the last line in the buffer.

                 ^              number  of  the  previous  line in the buffer
          |                     (same as .-1).

          |      -              number of the previous  line  in  the  buffer
          |                     (same as ^).

          |      /pattern[/]    number  of  the  next line in the buffer that
                                matches the given pattern (e.g., /February/);
                                the search proceeds to the end of the buffer,
                                then wraps around to the beginning  and  back
          |                     to  the  current  line.   The trailing "/" is
          |                     optional.

          |      \pattern[\]    number of the previous  line  in  the  buffer
                                that   matches   the   given  pattern  (e.g.,
                                \January\); search proceeds in reverse,  from
                                the  current  line  to  line 1, then from the
          |                     last line back  to  the  current  line.   The
          |                     trailing "\" is optional.

                 >name          number  of  the  next  line  having the given
                                markname (search wraps around, like //).




            ed (1)                        - 1 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


                 <name          number of the previous line having the  given
                                markname  (search  proceeds  in reverse, like
                                \\).

                 expression     any of the above  operands  may  be  combined
                                with  plus  or  minus signs to produce a line
                                number expression.  Plus signs may be omitted
                                if  desired  (e.g.,  /parse/-5,  /lexical/+2,
                                /lexical/2, $-5, .+6, .6).

                 The  text  patterns  used in line number expressions (and in
                 global commands and the substitute command, discussed below)
                 take the form of limited  regular  expressions.   Each  such
                 regular  expression  is  composed  of a sequence of ordinary
                 characters  and  special  metacharacters,  called   "pattern
                 elements."   The following table outlines the allowable pat-
                 tern elements.









































            ed (1)                        - 2 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


                               SSSuuummmmmmaaarrryyy ooofff PPPaaatttttteeerrrnnn EEEllleeemmmeeennntttsss

                 _E_l_e_m_e_n_t        _M_e_a_n_i_n_g


                 %              Matches the null string at the beginning of a
                                line.  However, if not the _f_i_r_s_t element of a
                                pattern, is  treated  as  a  literal  percent
                                sign.

                 ?              Matches   any  single  character  other  than
                                newline.

                 $              Matches the newline character at the end of a
                                line.  However, if not the _l_a_s_t element of  a
                                pattern, is treated as a literal dollar sign.

                 [<ccl>]        Matches any single character that is a member
                                of  the set specified by <ccl>.  <Ccl> may be
                                composed of single characters or of character
                                ranges of the form <c1>-<c2>.   If  character
                                ranges  are  used,  <c1>  and  <c2> must both
                                belong to the digits, the upper case alphabet
                                or the lower case alphabet.

                 [~<ccl>]       Matches any single character that  is  _n_o_t  a
                                member of the set specified by <ccl>.

          |      *              In combination with the immediately preceding
          |                     pattern element, matches zero or more charac-
                                ters that are matched by that element.

                 @              Turns   off   the   special  meaning  of  the
                                immediately  following  character.   If  that
                                character  has  no  special  meaning, this is
                                treated as a literal "@".

                 {<pattern>}    Tags the text actually matched  by  the  sub-
          |                     pattern specified by <pattern> for use in the
          |                     replacement part of a substitute command.

                 &              Appearing  in  the replacement part of a sub-
                                stitute command, represents the text actually
                                matched by the pattern part of  the  command.
                                If   "&"   is   the  only  character  in  the
                                replacement part, however, then it represents
                                the replacement part used in a previous  sub-
                                stitute command.

                 @<digit>       Appearing  in  the replacement part of a sub-
                                stitute command, represents the text actually
                                matched by the tagged  sub-pattern  specified
                                by <digit>.

                 Finally,  the following table lists the commands that may be
                 used for the actual creation and modification of text:


            ed (1)                        - 3 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


                                 EEEdddiiitttooorrr CCCooommmmmmaaannnddd SSSuuummmmmmaaarrryyy

                 _R_a_n_g_e  _S_y_n_t_a_x           _F_u_n_c_t_i_o_n

                 .      a[:text]         Append
                                         Inserts  text  after  the  specified
                                         line.  Text is inserted until a line
                                         containing   only  a  period  and  a
                                         newline is encountered.  In 'se', if
                                         the command is followed  immediately
                                         by  a colon, then whatever text fol-
                                         lows the colon is  inserted  without
                                         entering "append" mode.  The current
                                         line  pointer  is  left  at the last
                                         line inserted.

                 .,.    c[:text]         Change
                                         Deletes  the  lines  specified   and
                                         inserts  text to replace them.  Text
                                         is inserted until a line  containing
                                         only  a  period  and  a  newline  is
                                         encountered.  In 'se', if  the  com-
                                         mand  is  followed  immediately by a
                                         colon, then  whatever  text  follows
                                         the colon is inserted without enter-
                                         ing "append" mode.  The current line
                                         pointer  is  left  at  the last line
                                         inserted.

                 .,.    d[p]             Delete
                                         Deletes  all   lines   between   the
          |                              specified   lines,  inclusive.   The
          |                              current line pointer is left at  the
          |                              line after the last one deleted.  If
                                         the "p" is included, the new current
                                         line is printed.

                 none   e[!] [filename]  Enter
                                         Loads  the  specified  file into the
                                         buffer  and  prepares  for  editing.
                                         Automatically  invoked if a filename
                                         is specified as an argument  on  the
                                         command  line  used  to  invoke  the
                                         editor.  The current line pointer is
                                         positioned at the first line in  the
                                         buffer.    An   error   message   is
                                         generated  if  the  editing   buffer
                                         contains  text  that  has  not  been
                                         saved.  The  enter  command  may  be
                                         resubmitted after the error message,
                                         in  which  case  it  will be obeyed.
                                         The "enter now" command "e!"  may be
                                         used to avoid the error message.





            ed (1)                        - 4 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


                 none   f [filename]     File
                                         Print or change the remembered  file
                                         name.   If  a  name  is  given,  the
                                         remembered file name is set to  that
                                         value;   otherwise,  the  remembered
                                         file name is printed.

                 .,$    g/pat/command    Global on pattern
                                         Performs the given  command  on  all
                                         lines  in  the  specified range that
                                         match a certain pattern.

                 none   h[stuff]         Help
                                         In 'se', provides access  to  online
                                         documentation  on the screen editor.
                                         "Stuff" may be used to select  which
                                         information is displayed.

                 .      i[:text]         Insert
                                         Inserts  text  before  the specified
                                         line.  Text is inserted until a line
                                         containing  only  a  period  and   a
                                         newline is encountered.  In 'se', if
                                         the  command is immediately followed
                                         by a colon, then whatever text  fol-
                                         lows  is  inserted  without entering
                                         "append"  mode.   The  current  line
                                         pointer  is  left  at  the last line
          |                              inserted.

          |      ^,.    j[/stuff[/]][p]  Join
          |                              The specified lines are joined  into
          |                              a  single  line.  You may specify in
          |                              "stuff"  what  is  to  replace   the
          |                              newlines  that  previously separated
          |                              the lines.  The default is a  single
          |                              blank.  If you use the default, 'ed'
          |                              automatically prints out the result.
                                         If  the  "p"  option  is  used,  the
                                         resulting line  (which  becomes  the
          |                              new  current line) is printed.  Thus
          |                              "j"  and  "jp"  are  equivalent   to
          |                              "j/ /p".   In general, 'ed' and 'se'
          |                              will supply trailing delimiters  for
          |                              you.   So "j/" is the same as "j//",
          |                              i.e.  replace  the  newline(s)  with
          |                              nothing (delete them).

                 .,.    km               marK
                                         The  specified lines are marked with
                                         'm' which may be any single  charac-
                                         ter other than a newline.  If 'm' is
                                         not  present,  the  lines are marked
                                         with the default name of blank.  The
                                         current  line   pointer   is   never
          |                              changed.


            ed (1)                        - 5 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


          |      none   l                Locate
          |                              "l" will print the first line of the
          |                              file  =installation=.   This  is  so
          |                              that one can tell what machine he is
          |                              using from within the editor.   This
          |                              is  particularly  useful for instal-
          |                              lations with many machines that  can
          |                              run  the  editor, where the user can
          |                              switch back and forth between  them,
          |                              and  become  confused as to where he
          |                              is at a given moment.

                 .,.    m<line>[p]       Move
                                         Moves the specified block  of  lines
                                         after  <line>.   <Line>  may  not be
                                         omitted.  The current  line  pointer
                                         is  left at the last line moved.  If
                                         the  "p"  is  specified,   the   new
                                         current line is also printed.

                 .,.    n[m]             Name
                                         If  'm' is present, the last line in
                                         the specified range is  marked  with
                                         it  and  all other lines having that
                                         mark name are given the default mark
                                         name of blank.  In 'ed', if  'm'  is
                                         not  present,  the mark name of each
                                         line in the  range  is  printed;  in
                                         'se'  the  names of all lines in the
                                         range are cleared.

                 none   o[stuff]         Option
                                         Editing options may  be  queried  or
                                         set.    "Stuff"   determines   which
          |                              options  are  affected.   In   'ed',
          |                              options  "d",  "g", "k", and "p" are
          |                              available.  See  below  for  a  full
          |                              discussion of what the options do.

                 .,.    p                Print
                                         Prints  all  the  lines in the given
                                         range.  In 'se', as much as possible
                                         of the range  is  displayed,  always
                                         including the last line; if no range
                                         is   given,  the  previous  page  is
                                         displayed.  The current line pointer
                                         is left at the last line printed.

                 none   q[!]             Quit
                                         Exit from the editor.  An error mes-
                                         sage is  generated  if  the  editing
                                         buffer  contains  text  that has not
                                         been saved.  The quit command may be
                                         resubmitted after the error message,
                                         in which case  it  will  be  obeyed.
                                         The  "quit now" command "q!"  may be


            ed (1)                        - 6 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


                                         used to avoid the error message.

                 .      r [filename]     Read
                                         Insert the  contents  of  the  given
                                         file  after the specified line.  The
                                         current line pointer is left at  the
          |                              last line read.

          |      .,.    s[/pat/sub[/][g][p]] Substitute
                                         Substitutes     "sub"    for    each
                                         occurrence of the pattern "pat".  If
                                         the optional "g" is  specified,  all
                                         occurrences   in   each   line   are
                                         changed; otherwise, only  the  first
                                         occurrence  is changed.  The current
                                         line pointer is  left  at  the  last
                                         line  in  the  range in which a sub-
                                         stitution was made.   This  line  is
          |                              also printed if the "p" is used.  In
          |                              'ed',  if you leave off the trailing
          |                              slash, the result of the  substitute
          |                              will be printed automatically.  Thus
          |                              "s/junk/stuff"      is      entirely
          |                              equivalent to "s/junk/stuff/p".   If
          |                              you type an "s" by itself, without a
          |                              pattern and replacement string, 'ed'
          |                              will  behave as though you had typed
          |                              "s//&/p",   i.e.    substitute   the
          |                              previous replacement pattern for the
          |                              previous search pattern, and print.

          |      .,.    t[/from/to[/][p]] Transliterate
                                         The range of characters specified by
                                         'from'  is  transliterated  into the
                                         range  of  characters  specified  by
                                         'to'.    The   last  line  on  which
                                         something  was   transliterated   is
                                         printed  if  the "p" option is used.
                                         The last line in the  range  becomes
          |                              the new current line.  Again, if you
          |                              leave  off  the  trailing delimiter,
          |                              'ed' will print the  result  of  the
          |                              transliteration.   In addition, like
          |                              the "s" command, both the 'from' and
          |                              'to' parts are saved;  "t//&/"  will
          |                              perform  the same transliteration as
          |                              the last one, and "t" is the same as
          |                              "t//&/".  The "&" is special  if  it
          |                              is  the  only  character in the 'to'
          |                              part, otherwise it is treated  as  a
          |                              literal "&".  In Unix mode (for 'se'
          |                              only),  use "%" instead of "&".  See
          |                              _S_o_f_t_w_a_r_e  _T_o_o_l_s  and  the  help   on
          |                              'tlit'  for some examples of charac-
          |                              ter transliterations.



            ed (1)                        - 7 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


                 .      u[d][p]          Undo
                                         The  specified  range  of  lines  is
                                         replaced  by the last range of lines
                                         deleted.  If the "d"  is  used,  the
                                         restored  text is inserted after the
                                         last line in  the  specified  range.
                                         The  current  line pointer is set at
                                         the last  line  that  was  restored;
                                         this line is also printed if the "p"
                                         is specified.

                 .,.    v                oVerlay
                                         In  'ed',  each  line  in  the given
                                         range   is   printed   without   its
                                         terminating  newline  and  a line of
                                         input is read and added to  the  end
                                         of  the line.  If the first and only
                                         character on the  input  line  is  a
                                         period,   no   further   lines   are
                                         printed.  In 'se', "overlay mode" is
                                         entered and the  control  characters
                                         may  be used to modify text anywhere
                                         in the buffer.  A control-v  may  be
                                         used   to   quit  overlay  mode.   A
                                         control-f may be used to restore the
                                         current line to its  original  state
                                         and terminate the command.

                 1,$    w['+'|'!'] [filename] Write
                                         Writes  the  portion  of  the buffer
                                         specified to the  named  file.   The
                                         current line pointer is not changed.
                                         If  "+" is given, the portion of the
                                         buffer  is  appended  to  the  file;
                                         otherwise  the portion of the buffer
                                         replaces the file.  In 'se' only, if
                                         "!"  is present,  an  existing  file
                                         specified  in  the  command is over-
                                         written   without    comment.     If
                                         "filename"   is   not  present,  the
                                         specified lines will be  written  to
                                         the  current  file name specified on
                                         the status line.

                 1,$    x/pat/command    eXclude on pattern
                                         Performs the command on all lines in
                                         the given range that  do  not  match
                                         the specified pattern.

                 .,.    y<line>[p]       copY
                                         Makes a copy of all the lines in the
                                         given  range, and inserts the copies
                                         after <line>.  As with the "m"  com-
                                         mand,  <line>  may  not  be omitted.
                                         The current line pointer is  set  to
                                         the new copy of the last line in the


            ed (1)                        - 8 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


                                         range;  this  line is printed if the
                                         "p" is present.

                 .,.    zb<left>[,<right>][<char>]      draw Box
                                         In 'se' only, a box is  drawn  using
                                         the  given <char> (blank by default,
                                         allowing erasure  of  a  previously-
                                         drawn  box).   Line numbers are used
                                         to  specify  top  and   bottom   row
                                         positions  of  the  box.  <Left> and
                                         <right>  specify  left   and   right
                                         column  positions  of  the  box.  If
                                         second line number is  omitted,  the
                                         box   degenerates  to  a  horizontal
                                         line.  If right-hand column is omit-
                                         ted,  the  box  degenerates   to   a
                                         vertical line.

                 .      =[p]             Equals
                                         The  number of the specified line is
                                         printed.  The line  itself  is  also
                                         printed  if  the "p" option is used.
                                         The  current  line  pointer  is  not
                                         changed.

                 none   ?                Query
                                         In  'ed' only, a verbose description
                                         of the  last  error  encountered  is
                                         printed.

                 1,$    !mcommand        Exclude on markname
                                         Similar  to  the  'x'  prefix except
                                         that 'command' is performed for  all
                                         lines  in the range that do not have
                                         the mark name 'm'.

                 1,$    'mcommand        Global on markname
                                         Similar to  the  'g'  prefix  except
                                         that  'command' is performed for all
                                         lines in the  range  that  have  the
                                         mark name 'm'.

                 .      :                Print next page
                                         In 'ed', 23 lines beginning with the
                                         current line are printed (equivalent
                                         to  ".,.+23p").   In  'se', the next
                                         page of the buffer is displayed  and
                                         the  current  line pointer is placed
          |                              at the top of the window.

          |      .      ~[<Software Tools Command>] Escape to the shell
          |                              If  present,  the  <Software   Tools
          |                              Command>  is  passed to the shell to
          |                              be executed.  Otherwise, an interac-
          |                              tive shell is created.  After either
          |                              the command or the shell exits, 'ed'


            ed (1)                        - 9 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


          |                              prints a "~" to  indicate  that  the
          |                              shell  escape has completed.  If the
          |                              first  character  of  the  <Software
          |                              Tools  Command>  is  a "!", then the
          |                              "!"  is replaced with  the  text  of
          |                              the   previous  shell  command.   An
          |                              unescaped "%" in the <Software Tools
          |                              Command> will be replaced  with  the
          |                              current  saved  file  name.   If the
          |                              shell command is expanded, both 'ed'
          |                              and 'se' will  echo  it  first,  and
          |                              then execute it.

          |                              Until EPFs are supported, when using
          |                              'ed',   do  not  use  the  shell  to
          |                              execute external commands.  Internal
          |                              commands (like 'cd') are  OK.   This
          |                              does not apply to 'se'.

          |                              For a deeper discussion of using the
          |                              shell from within a program, see the
          |                              help on the 'shell' subroutine.

          |      The values associated with editor options should immediately
          |      follow  their  respective  key  letters, without intervening
          |      blanks between the option letter and the option value.   The
          |      options are as follows:

          |      _O_p_t_i_o_n    _A_c_t_i_o_n


          |      d[<dir>]  selects  the placement of the current line pointer
          |                following a "d" (delete) command.  <dir>  must  be
          |                either  ">"  or  "<".   If  ">"  is specified, the
          |                default behavior is selected:  the line  following
          |                the  deleted  lines  becomes the new current line.
          |                If "<" is specified, the line immediately  preced-
          |                ing  the  deleted  lines  becomes  the new current
          |                line.  If neither is specified, the current  value
          |                of <dir> is displayed.

          |      g         controls the behavior of the "s" (substitute) com-
          |                mand  when  it  is  under  the  control  of  a "g"
          |                (global) command.  By  default,  if  a  substitute
          |                inside  a  global  command  fails,  'ed'  will not
          |                continue with the rest of the  lines  which  might
          |                succeed.   If  "og" is given, then the global sub-
          |                stitute will continue, and lines which failed will
          |                not be affected.  Successive  "og"  commands  will
          |                toggle  this  behavior.  An explanatory message is
          |                written to the terminal.

          |      k         Indicates whether the  current  contents  of  your
          |                edit  buffer  has  been  saved  or not by printing
          |                either a "saved" or "not saved"  message  on  your
          |                terminal.


            ed (1)                       - 10 -                        ed (1)




            ed (1) --- Software Tools text editor (extended)         09/10/84


          |      p[/string[/]] sets  the  prompt  to  be used (useful for the
          |                user who is disturbed by  'ed's  quiet  behavior).
          |                The   prompt   can   be   set   by   the   command
          |                "op/string[/]", which sets the prompt to "string".
          |                The trailing delimiter is optional.  If no  string
          |                is  given,  the  prompt  is set to "* ".  An empty
          |                string  ("op//")  restores  'ed's   no   prompting
          |                behavior.   Successive  "op"  commands will toggle
          |                prompting mode.  The "op" option has  an  entirely
          |                different  meaning  in  'se'; see the help on 'se'
          |                for details.


            _E_x_a_m_p_l_e_s

                 ed
                 ed file
                 ed_input> ed file


            _F_i_l_e_s

                 =temp=/ed?* for scratch file
          |      =temp=/script?* for checkpoint file
          |      =home=/ed.logout for saving the buffer on a  LOGOUT$  condi-
          |      tion


            _M_e_s_s_a_g_e_s

                 "fatal scratch file read error"
                 "fatal scratch file write error"
                 "fatal scratch file seek error"
                 "can't open scratch file"
                 "?"  for miscellaneous errors


            _S_e_e _A_l_s_o

                 se  (1),  _S_o_f_t_w_a_r_e _T_o_o_l_s, _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s
                 _T_e_x_t _E_d_i_t_o_r

















            ed (1)                       - 11 -                        ed (1)


