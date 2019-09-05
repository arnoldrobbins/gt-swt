

            term (1) --- select individual terminal parameters       03/23/82


            _U_s_a_g_e

                 term { ? | <type> | <option> }
                    <option> ::=  -erase <echar>     |  -kill <kchar>
                               |  -retype <rchar>    |  -escape <escchar>
                               |  -newline <nlchar>  |  -eof <eofchar>
                               |  -[no]break         |  -[no]echo
                               |  -[no]lcase         |  -[no]lf
                               |  -[no]xon           |  -[no]xoff
                               |  -[no]vth           |  -[no]se
                               |  -[no]inh


            _D_e_s_c_r_i_p_t_i_o_n

                 'Term' sets or displays the parameters that control terminal
                 input and output.  At present, these parameters are:

                      - erase character
                      - kill character
                      - retype character
                      - escape character
                      - end-of-file character
                      - newline character
                      - recognition of terminal interrupts
                      - full/half duplex selection
                      - inhibition of terminal output
                      - automatic mapping of lower case input
                      - line feed suppression
                      - interpretation of DC1 and DC3 control characters
                      - support by the screen editor 'se'
                      - support by the virtual terminal handler

                 Arguments  to  'term'  consist of either a terminal type, in
                 which case parameters applicable to that particular terminal
                 are set, or of keywords  that  set  specific  parameters  to
                 specific values.  A list of available terminal types will be
                 displayed if the "?"  option is requested.

                 Keywords   that  may  be  specified,  and  their  respective
                 meanings, are as follows:

                 -erase    set erase character.  The next argument must be  a
                           single  character  or  an  ASCII  mnemonic for the
                           character  which  is  to  become  the  new   erase
                           (character delete) character.

                 -kill     set  kill  character.  The next argument must be a
                           single character or  an  ASCII  mnemonic  for  the
                           character  which  is  to become the new kill (line
                           delete) character.

                 -retype   set retype character.  The next argument must be a
                           single character or  an  ASCII  mnemonic  for  the
                           character  which  is  to  become  the  new  retype
                           (repeat line) character.


            term (1)                      - 1 -                      term (1)




            term (1) --- select individual terminal parameters       03/23/82


                 -escape   set escape character.  The next argument must be a
                           single character or  an  ASCII  mnemonic  for  the
                           character  which  is  to  become  the  new  escape
                           character.  (The escape character is used to enter
                           special character codes that could  not  otherwise
                           be entered from a standard keyboard.)

                 -newline  set  newline character.  The next argument must be
                           a single character or an ASCII  mnemonic  for  the
                           character  which  is  to  become  the  new newline
                           character.  The new character must then be used to
                           terminate all subsequent input lines.

                 -eof      set end-of-file character.  The next argument must
                           be a single character or an ASCII mnemonic for the
                           character which is to become the  new  end-of-file
                           character.

                 -break    enable   terminal   interrupts.    When   terminal
                           interrupts are enabled, hitting the BREAK  key  or
                           control-p  has the effect of halting the currently
                           executing program.

                 -nobreak  disable  terminal   interrupts.    When   terminal
                           interrupts  are  disabled, the currently executing
                           program may not be interrupted by the BREAK key or
                           control-p.  If, however, either of these  keys  is
                           hit,  a flag is set indicating a pending interrupt
                           that  will  take  effect  as  soon   as   terminal
                           interrupts are re-enabled.

                 -echo     full duplex, each character typed is echoed by the
                           computer.    When   this  mode  is  selected,  the
                           terminal should be set  to  fffuuullllll  ddduuupppllleeexxx  mode  to
                           disable self echo.

                 -noecho   half duplex, characters are not echoed by the com-
                           puter;  they must rather be echoed by the terminal
                           if they are to be printed.  When this mode  is  in
                           effect,  the terminal should be set to hhhaaalllfff ddduuupppllleeexxx
                           mode to enable self echo.

                 -inh      inhibit output.  The effect is the same  as  if  a
                           DC3  character had been received while "-xon" mode
                           was enabled.

                 -noinh    enable output.  The effect is the same as if a DC1
                           character had been received while "-xon" mode  was
                           enabled.   Any  buffered  output  is  sent  to the
                           terminal.

                 -lcase    lower case.  This option specifies that the user's
                           terminal can send and receive lower  case  charac-
                           ters.

                 -nolcase  upper  case only.  This option is intended for use


            term (1)                      - 2 -                      term (1)




            term (1) --- select individual terminal parameters       03/23/82


                           with upper-case-only terminals such as  Teletypes.
                           All  input  is forced to lower case and all output
                           is forced to upper case.  Upper case  letters  may
                           be entered by preceding the letter with the escape
                           character  (nominally "@").  On output, upper case
                           letters are printed as an  escape  character  fol-
                           lowed by the letter.

                 -lf       echo  line  feed when carriage return is received.
                           The  computer  echoes  a  line  feed  whenever  it
                           receives  a  carriage return.  This is independent
                           of whether or not echo is on.  However, if echo is
                           on, the line feed is  echoed  after  the  carriage
                           return.

                 -nolf     do  not  echo  line  feed  when carriage return is
                           received.  The terminal should have  an  automatic
                           line   feed  feature  for  this  mode  to  produce
                           desirable results.

                 -xon      the computer recognizes the control characters DC1
                           and DC3 (Control-Q  and  Control-S)  as  X-ON  and
                           X-OFF   signals,   respectively.   When  X-OFF  is
                           received,  output  is  inhibited  until  X-ON   is
                           received.   Characters  output  by  a program when
                           output is inhibited are not lost, but are buffered
                           until  an  X-ON  signal  is  next  received.   The
                           options  "-xon" and "-xoff" are synonymous, as are
                           "-noxon" and "-noxoff".

                 -noxon    the computer does not  recognize  X-ON  and  X-OFF
                           signals.

                 -se       the  terminal  is  supported by the screen editor.
                           User modification of this option  is  allowed  for
                           completeness.   Setting  it  does  not necessarily
                           mean that 'se' will  operate  correctly  with  the
                           terminal.

                 -nose     the  terminal  is  not  supported  by  the  screen
                           editor.   User  modification  of  this  option  is
                           allowed for completeness.

                 -vth      the  terminal is supported by the virtual terminal
                           handler.  User  modification  of  this  option  is
                           allowed  for  completeness.   Setting  it does not
                           necessarily mean  that  the  'vth'  routines  will
                           operate correctly with the terminal.

                 -novth    the  terminal  is  not  supported  by  the virtual
                           terminal  handler.   User  modification  of   this
                           option is allowed for completeness.

                 If no arguments are specified, term prints the values of the
                 various terminal parameters on standard output one.



            term (1)                      - 3 -                      term (1)




            term (1) --- select individual terminal parameters       03/23/82


            _E_x_a_m_p_l_e_s

                 term tty
                 term -lcase -noecho -nolf
                 term


            _M_e_s_s_a_g_e_s

                 "Usage:  term ..."  for incorrect arguments.


            _S_e_e _A_l_s_o

                 ek  (1),  Primos duplx$, gttype (2), gtattr (2) _U_s_e_r_'_s _G_u_i_d_e
                 _f_o_r _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r










































            term (1)                      - 4 -                      term (1)


