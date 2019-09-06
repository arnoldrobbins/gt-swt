

            se (1) --- screen-oriented text editor                   07/02/84


          | _U_s_a_g_e

          |      Usage: se [ -t <term> ] { <pathname> | -<option> }
          |         <term> ::= adm31  | adm3a  | adm42  | adm5   | anp    |
          |                    b150   | b200   | bantam | bee2   | cg     |
          |                    consul | forsys | fox    | gt40   | h19    |
          |                    hp2621 | hp2626 | hp2648 | hp9845 | hz1420 |
          |                    hz1421 | hz1510 | ibm    | info   | isc    |
          |                    microb | nby    | netron | pst100 | pt45   |
          |                    regent | sbee   | sol    | terak  | trs80  |
          |                    ts1    | tvi    | tvt    | vc4404 | vi200  |
          |                    viewpt | view90 | vt100  | z19
                 
          |         <opt>  ::= a | c | d[<dir>] | f | g | h[<speed>] |
          |                    i[a | <indent>] | k | l[<lop>] | lm[<col>] |
          |                    m[<opts>] | p[<s | u>] | s<lang> | t[<tabs>] |
          |                    u[<chr>] | v[<col>]  | w[<col>] | -[<row>]


            _D_e_s_c_r_i_p_t_i_o_n

                 In order to understand 'se', you should be familiar with the
                 line editor 'ed'.

                 'Se'  works much like 'ed', accepting the same commands with
                 a few differences.  Rather than  displaying  only  a  single
                 line  from the file being edited (as 'ed' does), 'se' always
                 displays a "window" onto the file.  In  order  to  do  this,
                 'se'  must  be run from a CRT terminal and must be told what
                 sort of terminal  it  is.   If  the  user  entered  a  valid
                 terminal  type  when  requested to do so upon entry into the
                 Subsystem and that terminal type is recognized by 'se',  the
                 "-t <term>"  option  may  be  omitted from the 'se' command.
                 Otherwise, either the "-t <term>" terminal type option  must
                 be  specified, or 'se' will prompt the user for the terminal
                 type.  Trying out 'se' will make the screen format  evident,
                 so details are not given here.

                 'Se'  is  capable  of being used from a variety of different
                 terminals.  New terminal types are easily  added  by  making
                 small additions to the source code.  In general, all that is
                 required  of  a terminal is that it have the ability to home
                 the cursor (position it to the upper left hand corner of the
                 screen) without erasing the screen's contents, although bac-
                 kspacing, a screen  clear  function,  and  arbitrary  cursor
                 positioning are tremendously helpful.

          |      The terminals currently supported are the following:

          |           adm31     Lear-Siegler ADM-31.

          |           adm3a     Lear-Siegler ADM-3A.

          |           adm42     Lear-Siegler ADM-42.

          |           adm5      Lear-Siegler ADM-5.


            se (1)                        - 1 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


          |           anp       Allen and Paul model 1A.

          |           b150      Beehive International B150.

          |           b200      Beehive International B200.

          |           bantam    Perkin-Elmer 550.

          |           bee2      Beehive International Model 2.

          |           cg        Chromatics Color Graphics Terminal.

          |           consul    ADDS Consul 980.

          |           forsys    Fortunes Systems Terminal.

          |           fox       Perkin-Elmer 1100.

          |           gt40      DEC   GT-40   Graphics  Terminal  with  Waugh
          |                     terminal software

          |           h19       Heath H19  using  Heath-mode  cursor  control
          |                     (supposedly   compatible   with  DEC  VT52's,
          |                     although this has not been verified)

          |           hp2621    Hewlett-Packard model 2621.

          |           hp2626    Hewlett-Packard model 2626.

          |           hp2648    Hewlett-Packard model 2648.

          |           hp9845    Hewlett-Packard model  9845C  color  computer
          |                     with Ray Robinson's terminal software.

          |           hz1420    Hazeltine 1420.

          |           hz1421    Hazeltine 1421.

          |           hz1510    Hazeltine 1510.

          |           ibm       IBM 3101.

          |           info      Infoton 100.

          |           isc       Intelligent  Systems  Corporation  8001 Color
          |                     Terminal.

          |           microb    Beehive Microb/DM1A.

          |           nby       Newbury 7009.

          |           netron    Netronics series.

          |           pst100    Prime VT100 look-alike.

          |           pt45      Prime PT45.


            se (1)                        - 2 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


          |           regent    ADDS Regent 100 and Regent 40.

          |           sbee      Beehive International Superbee.

          |           sol       Processor  Technology   Sol   computer   with
          |                     software to emulate a Beehive B200.

          |           terak     Terak Microcomputer.

          |           trs80     Radio Shack TRS-80 with Brad Isley's terminal
          |                     program.

          |           ts1       Falco TS-1.

          |           tvi       Televideo 912/920.

          |           tvt       Southwest Technical Products TV Typewriter II
          |                     with  computer  cursor  control board and the
                                following cursor controls:  right:   control-
                                I,  left:   control-H,  up:  control-K, home:
                                control-L, erase  screen:   control-O,  down-
          |                     and-erase-line:  control-J.

          |           vc4404    Volker-Craig 4404.

          |           vi200     Visual 200.

          |           viewpt    ADDS Viewpoint 3+.

          |           view90    ADDS Viewpoint 90.

          |           vt100     DEC VT100.

          |           z19       Zenith Z19 (same as Heathkit H19).

                 The  values  associated  with  screen  editor options should
                 immediately follow their  respective  key  letters,  without
                 intervening  blanks between the option letter and the option
                 value.  The options that may be  specified  on  the  command
                 line  correspond  to  options controlled by the "option" (o)
                 command and are as follows:

                 _O_p_t_i_o_n    _A_c_t_i_o_n


                 a         causes absolute line numbers to  be  displayed  in
                           the  line  number area of the screen.  The default
                           behavior is to display upper-case letters with the
                           letter "A" corresponding to the first line in  the
                           window.

                 c         inverts  the  case  of all letters you type (i.e.,
                           converts upper-case to lower-case and vice versa).
                           This option causes commands to be recognized  only
                           in  upper-case  and  alphabetic line numbers to be
                           displayed and recognized only in lower-case.


            se (1)                        - 3 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


                 d[<dir>]  selects the placement of the current line  pointer
                           following  a  "d" (delete) command.  <dir> must be
                           either ">" or  "<".   If  ">"  is  specified,  the
                           default  behavior is selected:  the line following
                           the deleted lines becomes the  new  current  line.
                           If  "<" is specified, the line immediately preced-
                           ing the deleted  lines  becomes  the  new  current
                           line.   If neither is specified, the current value
                           of <dir> is displayed in the status line.

                 f         selects  Fortran  oriented   options.    This   is
                           equivalent  to specifying both the "c" and "t7 +3"
          |                (see below) options.

          |      g         controls the behavior of the "s" (substitute) com-
          |                mand when  it  is  under  the  control  of  a  "g"
          |                (global)  command.   By  default,  if a substitute
          |                inside a  global  command  fails,  'se'  will  not
          |                continue  with  the  rest of the lines which might
          |                succeed.  If "og" is given, then the  global  sub-
          |                stitute will continue, and lines which failed will
          |                not  be  affected.   Successive "og" commands will
          |                toggle this behavior.  An explanatory  message  is
          |                placed in the status line.

                 h[<baud>] lets  the  editor  know  at what baud rate you are
                           receiving characters.  Baud rates can  range  from
                           50  to  19200;  the  default is 9600.  This option
                           allows the editor to determine how many,  if  any,
                           delay  characters  (nulls) will be output when the
                           hardware  line  insert/delete  functions  of   the
                           terminal  are  being  used (if available).  Use of
                           the    built-in    terminal    capabilities     to
                           insert/delete  lines  speeds up editing over slow-
                           speed  lines  (i.e.,  dialups).    Entering   'oh'
                           without  an  argument will cause your current baud
          |                rate to appear on the status line.

          |      i[a | <indent>] selects indent value for lines inserted with
          |                "a", "c" and  "i"  commands  (initially  1).   "a"
          |                selects  auto-indent  which sets the indent to the
          |                value which equals  the  indent  of  the  previous
          |                line.   If <indent> is an integer, then the indent
          |                value will be set to that number.  If neither  "a"
          |                nor  <indent>  are specified, the current value of
          |                indent is displayed.

          |      k         Indicates whether the  current  contents  of  your
          |                edit  buffer  has  been  saved  or not by printing
          |                either a "saved" or "not saved"  message  on  your
          |                status line.

          |      l[<lop>]  sets   the  line  number  display  option.   Under
          |                control of this option, 'se' continuously displays
          |                the value of one of three symbolic line numbers in
          |                the status line.  <lop> may be  any  of  the  fol-


            se (1)                        - 4 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


          |                lowing:

          |                .    display the current line number

          |                #    display  the  number  of  the top line on the
          |                     screen

          |                $    display the number of the last  line  in  the
          |                     buffer

          |                If  <lop>  is  omitted, the line number display is
          |                disabled.

                 lm[<col>] sets the left margin to  <col>  which  must  be  a
                           positive  integer.   This  option  will shift your
                           entire screen to the left,  enabling  you  to  see
                           characters  at  the  end  of  the  line  that were
                           previously  off  the  screen;  the  characters  in
                           columns  1  through <col> - 1 will not be visible.
                           You may continue editing in  the  normal  fashion.
                           To  reset  your  screen enter the command 'olm 1'.
                           If <col>  is  omitted,  the  current  left  margin
                           column is displayed in the status line.

                 m[d] [<user>] displays  messages  sent to you by other users
                           (via the 'to'  command)  while  you  are  editing.
                           When  a message arrives while you are editing, the
                           word "message" appears on your  status  line.   To
                           send  other  users  messages  while  inside of the
                           editor, you can insert the text  of  your  message
                           into  the  edit buffer, and then issue the command
                           "line1,line2om <user>", where "line1" and  "line2"
                           are  the  first  and  last lines, respectively, of
                           where you appended your message in the edit buffer
                           and "<user>" is the login name  or  process id  of
                           the  person  to  whom  you want to send a message.
                           The given lines are sent and deleted from the edit
                           buffer.  To prevent the lines from  being  deleted
                           after   they   are  sent,  use  the  command  line
          |                "line1,line2omd <user>"

          |      p[s | u]  converts to or from UNIX (tm) compatibility  mode.
          |                The  "op"  command, by itself, will toggle between
          |                normal (Software Tools mode) and UNIX  mode.   The
          |                command  "opu"  will  force 'se' to use UNIX mode,
          |                while the command "ops" will  force  'se'  to  use
          |                Software Tools mode.

          |                When in UNIX mode, 'se' uses the following for its
          |                patterns and commands:

          |                ?pattern[?]  searches backwards for a pattern.






            se (1)                        - 5 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


          |                ^    matches the beginning of a line.

          |                .    matches any character.

          |                ^    is used to negate character classes.

          |                %    used  by  itself in the replacement part of a
          |                     substitute command represents the replacement
          |                     part of the previous substitute command.

          |                \(<regular expression>\) tags pieces of a pattern.

          |                \<digit> represents the text matched by the tagged
          |                     sub-pattern specified by <digit>.

          |                \    is the escape character, instead of @.

          |                t    copies lines.

          |                y    transliterates lines.

          |                ~    does the global exclude on markname (see  the
          |                     "!"  command, in the help on 'ed').

          |                ![<Software Tools Command>] will   create   a  new
          |                     instance of  the  Software  Tools  shell,  or
          |                     execute  <Software  Tools  Command>  if it is
          |                     present (see the "~" command, in the help  on
          |                     'ed').

          |                All other characters and commands are the same for
          |                both  UNIX  and normal (Software Tools) mode.  The
          |                help command will  always  call  up  documentation
          |                appropriate  to  the  current  mode.  UNIX mode is
          |                indicated by the  message  "UNIX"  in  the  status
          |                line.

          |                UNIX   mode  is  available  _o_n_l_y  in  'se'.   This
          |                extension is not available in 'ed'.

                 s[pma | ftn | f77 | s | f] sets  other  options  for   case,
                           tabs,  etc.,  for  one  of  the  three programming
                           languages listed.  The option "oss" is the same as
                           "ospma" and the option "osf" is the same thing  as
                           "osftn"  (the  corresponding  command line options
                           are "-ss" and "-sf").  If no argument is specified
                           the options effected by  this  command  revert  to
                           their default value.

                 t[<tabs>] sets   tab  stops  according  to  <tabs>.   <tabs>
                           consists of a series of numbers indicating columns
                           in which tab stops are to be set.  If a number  is
                           preceded  by  a plus sign ("+"), it indicates that
                           the number is  an  increment;  stops  are  set  at
                           regular  intervals separated by that many columns,
                           beginning  with  the   most   recently   specified


            se (1)                        - 6 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


                           absolute   column   number.   If  no  such  number
                           precedes the first  increment  specification,  the
                           stops  are  set relative to column 1.  By default,
                           tab stops are set in every third  column  starting
                           with   column   1,   corresponding   to  a  <tabs>
                           specification of "+3".  If <tabs> is omitted,  the
                           current  tab  spacing  is  displayed in the status
                           line.

                 u[<chr>]  selects the character that 'se' displays in  place
                           of  unprintable  characters.   <chr>  may  be  any
                           printable character; it is initially set to blank.
                           If <chr> is omitted,  'se'  displays  the  current
                           replacement character on the status line.

                 v[<col>]  sets  the  default  "overlay column".  This is the
                           column at which the cursor is initially positioned
                           by the "v" command.   <Col>  must  be  a  positive
                           integer,  or a dollar sign ($) to indicate the end
                           of the line.  If <col>  is  omitted,  the  current
                           overlay column is displayed in the status line.

                 w[<col>]  sets  the  "warning threshold" to <col> which must
                           be a positive integer.   Whenever  the  cursor  is
                           positioned  at  or  beyond this column, the column
                           number is displayed in the  status  line  and  the
                           terminal's  bell is sounded.  If <col> is omitted,
                           the current warning threshold is displayed in  the
                           status line.  The default warning threshold is 74,
                           corresponding to the first column beyond the right
                           edge of the screen on an 80 column crt.

                 -[<lnr>]  splits  the  screen at the line specified by <lnr>
                           which must be a  simple  line  number  within  the
                           current  window.   All  lines  above  <lnr> remain
                           frozen on the screen, the line specified by  <lnr>
                           is  replaced  by  a  row  of dashes, and the space
                           below this row becomes the new window on the file.
                           Further editing commands do not affect  the  lines
                           displayed in the top part of the screen.  If <lnr>
                           is  omitted,  the  screen  is restored to its full
                           size.

                 Since 'se' takes its commands directly from the terminal, it
                 cannot be run from a script by using Subsystem I/O  redirec-
                 tion,  and  Subsystem erase, kill, and escape conventions do
                 not exactly apply.  In fact, 'se' has its own set of control
                 characters for editing and cursor motion; their  meaning  is
                 as follows:

                 _C_h_a_r_a_c_t_e_r _A_c_t_i_o_n







            se (1)                        - 7 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


                 control-a Toggle  insert  mode.  The status of the insertion
                           indicator is inverted.  Insert mode, when enabled,
                           causes characters typed  to  be  inserted  at  the
                           current  cursor  position  in  the line instead of
                           overwriting  the  characters   that   were   there
                           previously.    When  insert  mode  is  in  effect,
                           "INSERT" appears in the status line.

                 control-b Scan right and erase.  The current line is scanned
                           from the current cursor position to the right mar-
                           gin until an  occurrence  of  the  next  character
                           typed  is found.  When the character is found, all
                           characters from the current cursor position up  to
                           (but  not  including)  the  scanned  character are
                           deleted and the remainder of the line is moved  to
                           the  left to close the gap.  The cursor is left in
                           the same column which is now occupied by the scan-
                           ned character.  If the line to the  right  of  the
                           cursor   does  not  contain  the  character  being
                           sought, the  terminal's  bell  is  sounded.   'Se'
                           remembers  the  last  character  that  was scanned
                           using this or any of the other scanning  keys;  if
                           control-b  is  hit twice in a row, this remembered
                           character is used instead of a literal control-b.

                 control-c Insert blank.  The characters at and to the  right
                           of  the  current  cursor position are moved to the
                           right one column and a blank is inserted  to  fill
                           the gap.

                 control-d Cursor  up.   The  effect  of  this key depends on
                           'se's current mode.  When  in  command  mode,  the
                           current line pointer is moved to the previous line
                           without  affecting  the  contents  of  the command
                           line.  If the current line pointer is at  line  1,
                           the  last line in the file becomes the new current
                           line.  In overlay mode (viz.   the  "v"  command),
                           the cursor is moved up one line while remaining in
                           the  same  column.   In  append  mode, this key is
                           ignored.

                 control-e Tab left.  The cursor is moved to the nearest  tab
                           stop to the left of its current position.

                 control-f "Funny" return.  The effect of this key depends on
                           the  editor's  current mode.  In command mode, the
                           current command line is entered as-is, but is  not
                           erased  upon  completion of the command; in append
                           mode, the current line is duplicated;  in  overlay
                           mode  (viz.  the "v" command), the current line is
                           restored to its original state and command mode is
                           reentered (except if under  control  of  a  global
                           prefix).





            se (1)                        - 8 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


                 control-g Cursor  right.   The cursor is moved one column to
                           the right.

                 control-h Cursor left.  The cursor is moved  one  column  to
                           the  left.   Note  that  this  _d_o_e_s  _n_o_t erase any
                           characters; it simply moves the cursor.

                 control-i Tab right.  The cursor is moved to  the  next  tab
                           stop to the right of its current position.

                 control-k Cursor  down.   As  with  the  control-d key, this
                           key's effect depends on the current editing  mode.
                           In command mode, the current line pointer is moved
                           to  the next line without changing the contents of
                           the command line.  If the current line pointer  is
                           at  the  last line in the file, line 1 becomes the
                           new current line.  In overlay mode (viz.  the  "v"
                           command),  the cursor is moved down one line while
                           remaining in the same  column.   In  append  mode,
                           control-K has no effect.

                 control-l Scan  left.  The cursor is positioned according to
                           the character typed immediately after the control-
                           l.  In effect, the current line is scanned, start-
                           ing from the current cursor  position  and  moving
                           left,  for the first occurrence of this character.
                           If none is found before the beginning of the  line
                           is reached, the scan resumes with the last charac-
                           ter in the line.  If the line does not contain the
                           character  being  looked  for,  the  message  "NOT
                           FOUND" is printed in the status line.  'Se' remem-
                           bers the last character that was scanned for using
                           this key; if the control-l is hit twice in a  row,
                           this  remembered character is searched for instead
                           of a literal control-l.  Apart from this, however,
                           the  character  typed  after  control-l  is  taken
                           literally,  so  'se's case conversion feature does
                           not apply.

                 control-m Newline.  This key is identical to the NEWLINE key
                           described below.

                 control-n Scan left and erase.  The current line is  scanned
                           from  the current cursor position to the left mar-
                           gin until an  occurrence  of  the  next  character
                           typed  is  found.   Then  that  character  and all
                           characters to its right up to (but not  including)
                           the  character  under  the cursor are erased.  The
                           remainder of the line, as well as the  cursor  are
                           moved  to  the left to close the gap.  If the line
                           to the left of the cursor  does  not  contain  the
                           character  being  sought,  the  terminal's bell is
                           sounded.  As with the control-b key, if  control-n
                           is  hit twice in a row, the last character scanned
                           for is used instead of a literal control-n.



            se (1)                        - 9 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


                 control-o Skip right.  The cursor  is  moved  to  the  first
                           position beyond the current end of line.

                 control-p Interrupt.   If  executing any command except "a",
                           "c", "i" or  "v",  'se'  aborts  the  command  and
                           reenters  command  mode.   The command line is not
                           erased.

                 control-q Fix screen.   The  screen  is  reconstructed  from
                           'se's internal representation of the screen.

                 control-r Erase  right.  The character at the current cursor
                           position is erased and all characters to its right
                           are moved left one position.

                 control-s Scan  right.   This  key  is  identical   to   the
                           control-l  key  described  above,  except that the
                           scan proceeds to the right from the current cursor
                           position.

                 control-t Kill right.  The character at the  current  cursor
                           position and all those to its right are erased.

                 control-u Erase  left.   The  character  to  the left of the
                           current cursor position is deleted and all charac-
                           ters to its right are moved to the  left  to  fill
                           the  gap.   The  cursor  is  also  moved  left one
                           column, leaving it over the same character.

                 control-v Skip right and terminate.  The cursor is moved  to
                           the   current   end   of  line  and  the  line  is
                           terminated.

                 control-w Skip left.  The cursor is positioned at column 1.

                 control-x Insert tab.  The character  under  the  cursor  is
                           moved  right to the next tab stop; the gap is fil-
                           led with blanks.  The cursor is not moved.

                 control-y Kill left.  All characters to the left of the cur-
                           sor are erased; those at and to the right  of  the
                           cursor  are  moved  to  the left to fill the void.
                           The cursor is left in column 1.

                 control-z Toggle case conversion mode.  The  status  of  the
                           case  conversion  indicator  is  inverted; if case
                           inversion was on,  it  is  turned  off,  and  vice
                           versa.  Case inversion, when in effect, causes all
                           upper  case letters to be converted to lower case,
                           and all lower case  letters  to  be  converted  to
                           upper case.  Note, however, that 'se' continues to
                           recognize  alphabetic  line  numbers in upper case
                           only, in contrast to the "case  inversion"  option
                           (see the description of options above).  When case
                           inversion  is  on,  "CASE"  appears  in the status
                           line.


            se (1)                       - 10 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


                 control-_ Insert newline.  A newline character  is  inserted
                           before the current cursor position, and the cursor
                           is  moved  one position to the right.  The newline
                           is displayed according to the current non-printing
                           replacement character (see the "u" option).

                 control-\ Tab left and erase.  Characters are erased  start-
                           ing  with the character at the nearest tab stop to
                           the left of the cursor up to but not including the
                           character under the cursor.  The rest of the line,
                           including the cursor, is  moved  to  the  left  to
                           close the gap.

                 control-^ Tab right and erase.  Characters are erased start-
                           ing  with the character under the cursor up to but
                           not including the character  at  the  nearest  tab
                           stop  to the right of the cursor.  The rest of the
                           line is then shifted to the left to close the gap.

                 NEWLINE   Kill right and terminate.  The characters  at  and
                           to  the  right  of the current cursor position are
                           deleted, and the line is terminated.

                 DEL       Kill all.  The entire line is erased,  along  with
                           any error message that appears in the status line.

                 ESC       Escape.  The ESC key provides a means for entering
                           'se's  control  characters  literally as text into
                           the file.  In fact,  any  character  that  can  be
                           generated  from  the  keyboard  is taken literally
                           when it immediately follows the ESC key.   If  the
                           character  is  non-printing  (as  are all of 'se's
                           control characters), it appears on the  screen  as
                           the  current  non-printing  replacement  character
                           (normally a blank).

                 The set of control characters defined above can be used  for
                 correcting  mistakes  while typing regular editing commands,
                 for correcting commands that have caused an error message to
                 be displayed, for correcting lines typed in append mode,  or
                 for inline editing using the "v" command described below.

                 There  are  a  few  differences  in  command  interpretation
                 between the regular editor and 'se'.  The only effect of the
                 "p" command in 'se' is to position the  window  so  that  as
                 many  as possible of the "printed" lines are displayed while
                 including the last line in the range.  In fact,  the  window
                 is  always positioned so that the current line is displayed.
                 Typing a "p" command with no line numbers positions the win-
                 dow so that the line previously at the top of the window  is
                 at the bottom.  This can be used to "page" backwards through
                 the  file.   The  ":"  command, (which in the regular editor
                 prints about a screenfull of text starting with a  specified
                 line),  positions  the  window so it begins at the specified
                 line, and leaves the current  line  pointer  at  this  line.
                 Thus, a ":"  can be used to page forward through the file.


            se (1)                       - 11 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


                 The  "overlay"  (v)  command in the regular editor 'ed' only
                 allows the user to add onto the end of  lines,  and  can  be
                 terminated before the stated range of lines has been proces-
                 sed  by entering a period by itself, as in the "append" com-
                 mand.  But in 'se', this command allows arbitrary changes to
                 be made to the lines, and the period has no special meaning.
                 To abort before  all  the  lines  in  the  range  have  been
                 covered,  use  the "funny return" character (ctrl-F).  Doing
                 this restores the line containing the cursor to the state it
                 was in before the "v" command was started.

                 'Se' has a "draw box" command that can be used as an aid for
                 preparing  block  diagrams,  flowcharts,  or  tables.    The
                 general form is

                      top-line,bottom-line zb left-col,right-col character

                 For  example,  "1,10 zb 15,25 *"  would  draw a box 10 lines
                 high and 11 columns across, using asterisks.  The upper left
                 corner of the box would be on line 1,  column  15,  and  the
                 lower  right  corner on line 10, column 25.  The bottom-line
                 may be omitted to draw horizontal lines, and  the  right-col
                 may  be  omitted to draw vertical lines.  If the "character"
                 at the end of the command is omitted, it is assumed to be  a
                 space, thus allowing erasure of a box or line.

                 When the "write" command ("w") is used with a file name that
                 is  different from the name 'se' is remembering, the message
                 "file already exists" will be displayed if the  output  file
                 is  already  present.   If  the command is entered again (by
                 typing a NEWLINE), 'se' will perform the  write,  destroying
                 the  existing  file.   To  circumvent the warning, enter the
                 write command suffixed by "!"  (just like "quit" or "enter")
                 and 'se' will always write to the file.

          |      When  'se'  starts  up,  it   tries   to   open   the   file
          |      "=home=/.serc".   If  that  file  exists, 'se' reads it, one
          |      line at a time, and executes each line as a command.   If  a
          |      line  has  "#" as the _f_i_r_s_t character on the line, or if the
          |      line is empty, the entire line  is  treated  as  a  comment,
          |      otherwise it is executed.  Here is a sample ".serc" file:

          |           # turn on unix mode, tabs every 8 columns, auto indent
          |           opu
          |           ot+8
          |           oia

          |      The  ".serc"  file  is  useful  for  setting up personalized
          |      options, without having to type them  on  the  command  line
          |      every  time,  and without using a special shell file in your
          |      bin.  In particular, it is useful for automagically  turning
          |      on  UNIX mode for Software Tools users who are familiar with
          |      the UNIX system.

          |      Command line options are processed  _a_f_t_e_r  commands  in  the
          |      ".serc"  file,  so,  in  effect, command line options can be


            se (1)                       - 12 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


          |      used to over-ride the defaults in your ".serc" file.

          |      NNNOOOTTTEEE:  Commands in the ".serc" file do _n_o_t go  through  that
          |      part  of 'se' which processes the special control characters
          |      (see above), so _d_o _n_o_t use them in your ".serc" file.

                 For a list of commands accepted by both 'se' and  'ed',  see
                 either  the  Reference  Manual entry for 'ed' ("help ed") or
                 the _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r.

          |      'Se' has  an  extended  line  number  syntax.   In  general,
          |      whatever  appears  in  the  left  margin on the screen is an
                 acceptable line number and refers to the line  displayed  in
                 that  row  on the screen.  In particular, upper case letters
                 are often used.   Also,  the  line  number  element  "#"  is
                 interpreted as being the number of first line of the current
                 screen.


            _E_x_a_m_p_l_e_s

                 se -t b200 -c -w70 -t+6
                 se -t consul textfile


            _F_i_l_e_s

          |      =home=/.serc 'se' start up command file

          |      =temp=/se<line><sequence_number> for scratch file

          |      =doc=/se_h/?* help scripts for the "h" command

          |      =home=/se.logout  for  saving the buffer on a LOGOUT$ condi-
          |      tion


            _M_e_s_s_a_g_e_s

                 Many.  Most are self-explanatory.


            _B_u_g_s

                 Cannot be run from a script.

                 Cannot specify tab stops as the first option if no  terminal
          |      type is specified first on the command line.

          |      The auto-indent feature does not recognize a line consisting
          |      of  just blanks and then a "."  to terminate input, when the
          |      "."  is not in the same  position  as  the  first  non-blank
          |      character of the previous line.

          |      Should  be  changed  to  use  the  'vth' terminal operations
          |      library, instead of  having  code  hard-wired  in  for  each


            se (1)                       - 13 -                        se (1)




            se (1) --- screen-oriented text editor                   07/02/84


          |      terminal type.  Unfortunately, 'vth' isn't quite up to this.


            _S_e_e _A_l_s_o

                 ed (1), _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r




















































            se (1)                       - 14 -                        se (1)


