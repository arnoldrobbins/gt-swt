

            fmt (1) --- text formatter                               08/27/84


          | _U_s_a_g_e

                 fmt [ -s | -p<start_page>[-<end_page>]] { <filename> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Fmt'  is  an  extended  version  of Kernighan and Plauger's
                 'format' text formatter.

                 Input to 'fmt' consists of text intermixed  with  formatting
                 requests   and  function  calls.   Formatting  requests  are
                 identified by  a  special  character  (called  the  "control
                 character", normally a period) appearing in the first column
                 of  a  line of input.  Such requests are used to change mar-
                 gins, text justification, underlining and  boldfacing,  etc.
                 Function  calls  appear within square brackets, and are used
                 to change number registers,  query  the  status  of  certain
                 internal  formatter variables, and effect partial word bold-
                 facing and underlining.

                 For a complete description of 'fmt', along with  a  tutorial
                 and  numerous  examples,  the  reader  is  referred  to  the
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _F_o_r_m_a_t_t_e_r _U_s_e_r_'_s _G_u_i_d_e.

                 If the "-s" option is specified, 'fmt' will pause at the top
                 of each page of output, to allow the user  to  insert  paper
                 manually.   To  continue  output,  the  user  should  type a
                 control-c.

                 The "-p" option may be used to limit  the  pages  output  by
                 'fmt'.   Only  the given range of pages will be printed.  If
                 the ending page number is omitted, all remaining  text  will
                 be printed.

                 The  files  named on the command line are used as sources of
                 input.  The effect is the same as if the contents of all the
                 named files had been concatenated before processing.   Note:
                 the  filename "-" may be used to indicate the first standard
                 input.

                 The following tables summarize currently-implemented format-
                 ting requests and function calls (and their variants).

                                   SSSuuummmmmmaaarrryyy ooofff CCCooommmmmmaaannndddsss

                 CCCooommmmmmaaannnddd      IIInnniiitttiiiaaalll   IIIfff nnnooo     CCCaaauuussseee
                 SSSyyynnntttaaaxxx       VVVaaallluuueee     PPPaaarrraaammmeeettteeerrr BBBrrreeeaaakkk  EEExxxppplllaaannnaaatttiiiooonnn

                 .#           -         -         no     Introduce a comment.

                 .ad c        both      both      no     Set  margin  adjust-
          |                                              ment mode.

          |      .am xx       -         -         no     Add  additional text
          |                                              to  the  body  of  a


            fmt (1)                       - 1 -                       fmt (1)




            fmt (1) --- text formatter                               08/27/84


          |                                              previously   defined
          |                                              macro.

                 .bf N        N=0       N=1       no     Boldface   N   input
                                                         text lines.

                 .bp _+N       N=1       next      yes    Begin a new page.

                 .br          -         -         yes    Force a break.

                 .c2 c        `         `         no     Set no-break control
                                                         character.

                 .cc c        .         .         no     Set   basic  control
                                                         character.

                 .ce N        N=0       N=1       yes    Center N input  text
                                                         lines.

                 .de xx       -         ignored   no     Begin  definition or
                                                         redefinition  of   a
                                                         macro.

                 .dv <stream> -         end '.dv' no     Temporarily   divert
                                                         the output stream to
                                                         a "filename" or to a
                                                         temporary       file
                                                         designated   by   an
          |                                              integer "N"  (to  be
          |                                              later read by a ".so
          |                                              N"  command) until a
          |                                              'dv' command with no
                                                         arguments is seen.

                 .ef /l/c/r/  blank     blank     no     Set    even-numbered
                                                         page footing.

                 .eh /l/c/r/  blank     blank     no     Set    even-numbered
                                                         page heading.

                 .en xx       -         ignored   no     End            macro
                                                         definition.

                 .eo _+N       N=0       N=0       yes    Set  even  page off-
                                                         set.

                 .er text     -         ignored   no     Write a  message  to
                                                         the terminal.

                 .ex          -         -         yes    Exit  immediately to
                                                         the Subsystem.

                 .fi          on        -         no     Turn on fill mode.

                 .fo /l/c/r/  blank     blank     no     Set   running   page
                                                         footing.


            fmt (1)                       - 2 -                       fmt (1)




            fmt (1) --- text formatter                               08/27/84


                 .he /l/c/r/  blank     blank     no     Set   running   page
                                                         heading.

                 .hy          on        -         no     Turn  on   automatic
          |                                              hyphenation.

          |      .if <args>   -         ignored   maybe  Conditional   execu-
          |                                              tion  of  an   input
          |                                              line.

                 .in _+N       N=0       N=0       yes    Indent left margin.

                 .lm _+N       N=1       N=1       yes    Set left margin.

                 .ls N        N=1       N=1       no     Set line spacing.

                 .lt _+N       N=60      N=60      no     Set     length    of
                                                         header,  footer  and
                                                         titles.

                 .m1 _+N       N=3       N=3       no     Set    top    margin
                                                         before and including
                                                         page heading.

                 .m2 _+N       N=2       N=2       no     Set top margin after
                                                         page heading.

                 .m3 _+N       N=2       N=2       no     Set  bottom   margin
                                                         before page footing.

                 .m4 _+N       N=3       N=3       no     Set   bottom  margin
                                                         including and  after
                                                         page footing.

                 .mc <char>   BLANK     BLANK     no     Set  margin  charac-
                                                         ter.

                 .mo _+N       N=0       N=0       no     Set margin offset.

                 .na          -         -         no     Turn   off    margin
                                                         adjustment.

                 .ne N        -         N=1       yes    Express a need for N
                                                         contiguous lines.

                 .nf          -         -         yes    Turn  off fill mode.
                                                         (Also       inhibits
                                                         adjustment.)

                 .nh          -         -         no     Turn  off  automatic
                                                         hyphenation.

                 .ns          on        -         no     Turn  on  'no-space'
                                                         mode.




            fmt (1)                       - 3 -                       fmt (1)




            fmt (1) --- text formatter                               08/27/84


                 .nx file     -         next arg  no     Move  on to the next
                                                         input file.

                 .of /l/c/r/  blank     blank     no     Set     odd-numbered
                                                         page footing.

                 .oh /l/c/r/  blank     blank     no     Set     odd-numbered
                                                         page heading.

                 .oo _+N       N=0       N=0       yes    Set odd page offset.

                 .pl _+N       N=66      N=66      no     Set page length.

                 .pn _+N       N=1       ignored   no     Set page number.

          |      .po _+N       N=0       N=0       yes    Set page offset.

          |      .ps N M      N=M=0     N=M=0     yes    Skip   pages   while
          |                                              (page  number mod M)
          |                                              is less than N.

                 .rc c        BLANK     BLANK     no     Set tab  replacement
                                                         character.

                 .rm _+N       N=60      N=60      yes    Set right margin.

                 .rs          -         -         no     Turn  off 'no-space'
                                                         mode.

                 .sb          off       -         no     Single  blank  after
                                                         end of sentence.

          |      .so <stream> -         ignored   no     Temporarily    alter
          |                                              the  input   source.
          |                                              "Stream can be a "-"
          |                                              to indicate standard
          |                                              input, a "filename,"
          |                                              or  an  integer  "N"
          |                                              corresponding  to  a
          |                                              temporary       file
          |                                              created     by     a
          |                                              previous   '.dv   N'
          |                                              command.

                 .sp N        -         N=1       yes    Put  out   N   blank
                                                         lines.

                 .ta N ...    9 17 ...  all       no     Set tab stops.

                 .tc c        TAB       TAB       no     Set tab character.

                 .ti _+N       N=0       N=0       yes    Temporarily   indent
                                                         left margin.

                 .tl 'l'c'r'  blank     blank     yes    Generate   a   three
                                                         part title.


            fmt (1)                       - 4 -                       fmt (1)




            fmt (1) --- text formatter                               08/27/84


                 .ul N        N=0       N=1       no     Underline   N  input
                                                         text lines.

                 .xb          on        -         no     Extra  blank   after
                                                         end of sentence.



          |                             FFFuuunnnccctttiiiooonnnsss

          |      add            Add   constant   to   number   register  (add
          |                     <reg_number> <constant>)
          |      bf             Boldface arguments on output
          |      cu             Output arguments with a continuous underline
          |      date           Current date; e.g., 11/27/84
          |      day            Current day of the week; e.g., Tuesday
          |      ldate          Current date:  e.g., November 27, 1984
          |      num            Evaluate   number   register    (num    <pre-
          |                     inc/dec><reg_number><post-inc/dec>)
          |      rn             Convert   argument   to  a  lower-case  Roman
          |                     numeral
          |      RN             Convert  argument  to  an  upper-case   Roman
          |                     numeral
          |      set            Set    number    register   to   value   (set
          |                     <reg_number> <constant>)
          |      sub            Output the arguments as a subscript
          |      sup            Output the arguments as a superscript
          |      time           Current time of day; e.g., 02:16:12
          |      ul             Underline the arguments on output
          |      letter         Convert a number to its lower case equivalent
          |      LETTER         Convert a number to its upper case equivalent
          |      vertspace      Change the vertical spacing on NEC Spinwriter
          |      even           Test if number is even
          |      odd            Test if number is odd
          |      cap            Capitalize text
          |      small          Map all characters of text to lower case
          |      plus           Add two numbers
          |      minus          Subtract two numbers
          |      header         Return the page header
          |      evenheader     Return the even page header
          |      oddheader      Return the odd page header
          |      footer         Return the page footer
          |      evenfooter     Return the even page footer
          |      oddfooter      Return the odd page footer
          |      cmp            Perform string comparison
          |      icmp           Perform integer comparison
          |      bottom         Return the number of the last printed line
          |      top            Return the number of the first printed line

          |                             VVVaaarrriiiaaabbbllleeesss

                 cc        Current basic control character
                 c2        Current no-break control character
                 in        Current indentation value
                 lm        Current left margin value
                 ln        Current line number on the page


            fmt (1)                       - 5 -                       fmt (1)




            fmt (1) --- text formatter                               08/27/84


                 ls        Current line-spacing value
          |      lt        Length of titles
                 ml        Current macro invocation level
                 m1        Current margin 1 value
                 m2        Current margin 2 value
                 m3        Current margin 3 value
                 m4        Current margin 4 value
          |      ns        True or false if no-space is in effect.
                 pl        Current page length value
                 pn        Current page number
                 po        Current page offset value
                 rm        Current right margin value
                 tc        Current tab character
                 ti        Current temporary indentation value
                 tcpn      Current page number, right justified in 4  charac-
                           ter field

                                   SSSpppeeeccciiiaaalll CCChhhaaarrraaacccttteeerrrsss

          |        bl            Phantom blank
          |        bs            Backspace
          |        alpha         lower-case Greek alpha
          |      * ALPHA         upper-case Greek alpha
          |        beta          lower-case Greek beta
          |      * BETA          upper-case Greek beta
          |      * chi           lower-case Greek chi
          |      * CHI           upper-case Greek chi
          |        delta         lower-case Greek delta
          |      * DELTA         upper-case Greek delta
          |        epsilon       lower-case Greek epsilon
          |      * EPSILON       upper-case Greek epsilon
          |        eta           lower-case Greek eta
          |      * ETA           upper-case Greek eta
          |        gamma         lower-case Greek gamma
          |        GAMMA         upper-case Greek gamma
          |        infinity      infinity symbol
          |        integral      integration symbol
          |      * INTEGRAL      large integration sign
          |      * iota          lower-case Greek iota
          |      * IOTA          upper-case Greek iota
          |      * kappa         lower-case Greek kappa
          |      * KAPPA         upper-case Greek kappa
          |        lambda        lower-case Greek lambda
          |        LAMBDA        upper-case Greek lambda
          |        mu            lower-case Greek mu
          |      * MU            upper-case Greek mu
          |        nabla         inverted delta (APL del)
          |        not           EBCDIC-style not symbol
          |      * nu            lower-case Greek nu
          |      * NU            upper-case Greek nu
          |        omega         lower-case Greek omega
          |        OMEGA         upper-case Greek omega
          |      * omicron       lower-case Greek omicron
          |      * OMICRON       upper-case Greek omicron
          |        partial       partial differential symbol
          |        phi           lower-case Greek phi


            fmt (1)                       - 6 -                       fmt (1)




            fmt (1) --- text formatter                               08/27/84


          |        PHI           upper-case Greek phi
          |        psi           lower-case Greek psi
          |        PSI           upper-case Greek psi
          |        pi            lower-case Greek pi
          |        PI            upper-case Greek pi
          |        rho           lower-case Greek rho
          |      * RHO           upper-case Greek rho
          |        sigma         lower-case Greek sigma
          |        SIGMA         upper-case Greek sigma
          |        tau           lower-case Greek tau
          |      * TAU           upper-case Greek tau
          |        theta         lower-case Greek theta
          |        THETA         upper-case Greek theta
          |      * upsilon       lower-case Greek upsilon
          |      * UPSILON       upper-case Greek upsilon
          |        xi            lower-case Greek xi
          |      * XI            upper-case Greek xi
          |        zeta          lower-case Greek zeta
          |      * ZETA          upper-case Greek zeta
          |      * downarrow     arrow pointing down
          |      * uparrow       arrow pointing up
          |      * backslash     back slash symbol
          |      * tilde         tilde symbol
          |      * largerbrace   large square right brace
          |      * largelbrace   large square left brace
          |      * proportional  proportional symbol
          |      * apeq          approximately equal to
          |      * ge            greater than or equal to
          |      * imp           implies
          |      * exist         there exists
          |      * AND           logical and
          |      * ne            not equal to
          |      * psset         proper subset
          |      * sset          subset
          |      * le            less than or equal to
          |      * nexist        there does not exist
          |      * univ          for every
          |      * OR            logical or
          |      * iso           congruence
          |      * lfloor        left floor
          |      * rfloor        right floor
          |      * lceil         left ceiling
          |      * rceil         right ceiling
          |      * small0        a small 0
          |      * small1        a small 1
          |      * small2        a small 2
          |      * small3        a small 3
          |      * small4        a small 4
          |      * small5        a small 5
          |      * small6        a small 6
          |      * small7        a small 7
          |      * small8        a small 8
          |      * small9        a small 9
          |      * scolon        semicolon
          |      * dquote        double quote
          |      * dollar        dollar sign


            fmt (1)                       - 7 -                       fmt (1)




            fmt (1) --- text formatter                               08/27/84


          |      The  special characters marked with an asterisk (*) are only
          |      available on the NEC SSSpppiiinnnwwwrrriiittteeerrr, and so the output of  'fmt'
          |      _m_u_s_t be post-processed with 'sprint'.

          |      In  particular,  these  characters  require that the special
          |      Times-Roman/Mathematics type wheel  be  in  the  SSSpppiiinnnwwwrrriiittteeerrr.
          |      This  wheel,  in order to accomodate the special characters,
          |      lacks certain of the regular ASCII graphics.  These are sub-
          |      stituted for by special functions.  For example, [scolon] is
          |      used to produce a semi-colon.


            _E_x_a_m_p_l_e_s

                 fmt -p3-10 report | dprint
                 fmt report | os >/dev/lps/f
                 fmt -s contents tutorial index


            _B_u_g_s

                 There should be some way to specify multiple ranges of pages
                 to be printed.


            _S_e_e _A_l_s_o

          |      os  (1),  dprint  (3),  sprint  (3),  _S_o_f_t_w_a_r_e  _T_o_o_l_s   _T_e_x_t
                 _F_o_r_m_a_t_t_e_r _U_s_e_r_'_s _G_u_i_d_e





























            fmt (1)                       - 8 -                       fmt (1)


