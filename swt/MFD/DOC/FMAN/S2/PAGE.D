

            page (2) --- display file in paginated form              06/21/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function page (fdin, prompt, eprompt, lines, fdout, options)
                 file_des fdin, fdout
                 character prompt (ARB), eprompt (ARB)
          |      integer lines, options

                 Library:  vswtlb (Standard Subsystem Library)


            _F_u_n_c_t_i_o_n

          |      'Page'  displays  the  contents  of a disk file in paginated
          |      form.  It also allows skipping pages forward and backward as
          |      well as searching for patterns within the file.   'Page'  is
          |      primarily  intended  for viewing a file on a high speed CRT,
          |      but it may be used from any terminal.

          |      'Page' accepts six arguments, of which the last is optional.
          |      'Fdin' is the swt file descriptor of a file to be displayed.
          |      'Prompt' specifies a format string (cf.  'print',  'encode')
          |      to  be used for prompting the user after each screen of text
          |      except the final page.  If this  format  string  contains  a
          |      format code for an integer (e.g.  "*i") then 'page' replaces
          |      it  with  the  current  page  number  in  the actual prompt.
          |      'Eprompt' specifies a format string to be used for prompting
          |      the user when the final page of the file is reached; it  may
          |      also  contain  a  format  code  for the current page number.
          |      'Lines' gives the number of lines in a page.  'Fdout' is the
          |      swt file descriptor  of  the  file  to  receive  the  output
          |      display;  'page'  only  pages output when the output file is
          |      connected to a terminal (i.e.  if  the  output  file  is  on
          |      disk,  'page'  simply copies the file to be displayed).  The
          |      final (optional) argument consists of flags that control the
          |      operation of the 'page' subroutine.  The following flags may
          |      be used singly or in combination (e.g.  PG_END + PG_VTH):

          |          PG_END     Do not prompt following the final page of the
          |                     file.  The default action is to prompt.
          |          PG_VTH     Use 'vth' to manage the screen.   By  default
          |                     'page' displays the file without using 'vth'.

          |      If  the  'options' argument is not specified, it defaults to
          |      0; 'page' displays the file using standard I/O  and  prompts
          |      after the last page of the file.

          |      If  'vth'  is  used  to  display  the paginated file, 'page'
          |      ignores the 'lines' argument and fixes the number  of  lines
          |      per page at the maximum number that can fit on the screen.

          |      'Page'  prompts  the  user  after  each  page of output, and
          |      awaits one of the following commands (note  that  alphabetic
          |      commands may be entered in upper or lower case):

          |           D<pages>  Display  given  number  of pages (default 1),
          |                     prompting only after the end of the range.


            page (2)                      - 1 -                      page (2)




            page (2) --- display file in paginated form              06/21/84


          |           E<path>   Examine the file whose pathname is <path>.
          |           E         Examine the original file.
          |           H or ?    Print a command summary.
          |           M<margin> Set column of left margin to be displayed.
          |           N or Q    Exit with OK status.
          |           P or ^    Redisplay previous page.
          |           S<lines>  Set page size to specified number of lines.
          |                     Display starts over on page 1.
          |           W <path>  Write a copy of the file being  displayed  to
          |                     <path>.   The  file  named  <path>  must  not
          |                     already exist.
          |           W+<path>  Append a copy of the file being displayed  to
          |                     <path>.
          |           W!<path>  Write  a  copy of the file being displayed to
          |                     <path>.   If the file already exists, it will
          |                     be overwritten.
          |           X         Exit with EOF status.
          |           Y or :    Advance to the next page.
          |           <ctrl-c>  Exit with EOF status (does not work in  'vth'
          |                     mode).
          |           <newline> Advance to the next page.
          |           <page>    Display specified page number.
          |           -<pages>  Back up given number of pages (default 1).
          |           .         Redisplay current page.
          |           +<pages>  Advance given number of pages (default 1).
          |           $         Display the last page.
          |           /<pat>[/] Display the next page containing <pat>.
          |           \<pat>[\] Display the previous page containing <pat>.

                 The  pattern <pat> is a regular expression with the full set
          |      of options found in the editor.  'Page' searches  circularly
          |      from  the  current  file  position  for  the  next page that
          |      contains the specified  pattern.   As  in  the  editor,  the
          |      trailing  delimiter  is  optional.  (See _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e
                 _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r in the _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m
          *      _U_s_e_r_'_s _G_u_i_d_e for details.)


            _C_a_l_l_s

          |      close,  ctoc,  ctoi,  encode, fcopy, getlin, isatty, makpat,
          |      markf, match, open,print, putch, seekf, scopy, strim, vtclr,
          |      vtenb,  vtgetl,  vtinfo,  vtinit,  vtprt,  vtputl,   vtread,
          |      vtstop, vtupd, Primos break$, missin, mklb$f, mkon$f, pl1$nl


            _B_u_g_s

          |      Large amounts of stack space are used.

          |      If  any  format  code  other  than  "*i" is used in a format
          |      string, erroneous values will be displayed.

          |      If more than one format code is  specified,  'page'  gets  a
          |      pointer fault error.



            page (2)                      - 2 -                      page (2)




            page (2) --- display file in paginated form              06/21/84


          |      There is no way to change the page alignment.

          |      The "H" command output is not paged.


            _S_e_e _A_l_s_o

                 pg (1), _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r


















































            page (2)                      - 3 -                      page (2)


