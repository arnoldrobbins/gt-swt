

            pg (1) --- list a file in paginated form                 06/22/84


          | _U_s_a_g_e

          |      pg [-e] [-v] [-s <screensize>] [-m <message>] {<file_spec>}
                 <file_spec> ::= <filename> | -[<stdin_number>] |
                                 -n(<stdin_number> | <filename>)


            _D_e_s_c_r_i_p_t_i_o_n

          |      'Pg'  is a filter which displays the contents of a disk file
          |      in paginated form.  It allows  skipping  pages  forward  and
          |      backward  as well as searching for patterns within the file.
          |      'Pg' is primarily intended for viewing  a  file  on  a  high
          |      speed CRT, but it may be used from any terminal.

          |      'Pg'  displays  the  named  files  (see  'cat'  for  further
          |      information on <file spec>s) by calling the library  routine
          |      'page', which accepts the following responses:

          |           f <path>  Display the file whose pathname is <path>.
          |           f         Redisplay the original file.
          |           h         Print a command summary.
          |           l<lines>  Set screen size to specified number of lines.
          |                     Display starts over on page 1.
          |           n         Proceed to next file (exit if on last file).
          |           p<pages>  Display  given  number  of pages (default 1),
          |                     prompting only after the end of the range.
          |           q         Proceed to next file (exit if on last file).
          |           x         Exit immediately from 'pg'.
          |           y         Advance to the next  page  (proceed  to  next
          |                     file if on last page).
          |           ctrl-c    Exit immediately from 'pg'.
          |           newline   Advance  to  the  next  page (proceed to next
          |                     file if on last page).
          |           <page>    Display specified page number.
          |           -<pages>  Back up given number of pages (default 1).
          |           ^         Redisplay previous page.
          |           .         Redisplay current page.
          |           +<pages>  Advance given number of pages (default 1).
          |           $         Display the last page.
          |           /<pat>[/] Display the next page containing <pat>.
          |           \<pat>[\] Display the previous page containing <pat>.

                 The pattern <pat> is a regular expression with the full  set
                 of  options  found in the editor.  The file is searched cir-
                 cularly from the current position for  the  next  page  that
          |      contains  the  specified  pattern.   As  in  the editor, the
          |      trailing delimiter is optional.  (See  _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e
                 _S_o_f_t_w_a_r_e  _T_o_o_l_s  _T_e_x_t _E_d_i_t_o_r in the _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m
                 _U_s_e_r_'_s _G_u_i_d_e for details.)

                 By default, 'pg' prompts after each page with  a  string  of
          |      the form

          |           file [n+]?



            pg (1)                        - 1 -                        pg (1)




            pg (1) --- list a file in paginated form                 06/22/84


          |      and after the last page with a string of the form

          |           file [n$]?

          |      if  the '-e' command line argument is not specified.  "File"
          |      is the name of the file being displayed, and "n" is the page
          |      number within the file.  If the '-e' argument is  specified,
          |      'pg' will not issue a prompt after the final page of a file,
          |      but  instead  it  proceeds  to the next file in the argument
          |      list (if any).  The '-m <message>' argument sequence may  be
          |      used  to specify a prompt string different from the default;
          |      this string is used  as  both  the  intermediate  and  final
                 prompt.   For details on how this string is interpreted, see
                 the entry for 'page' in section 2.

          |      'Pg' normally displays each file using the 'vth'  subroutine
          |      package  to manage the screen.  If the current terminal type
          |      is not one of those that 'vth'  supports,  or  if  the  '-v'
          |      argument  is  specified,  then 'pg' displays each file using
          |      ordinary sequential output.

          |      The user can inform 'pg' of  the  number  of  lines  on  his
          |      terminal  screen  with  the  '-s  <screensize>' command line
          |      argument.  If 'vth' output is used, 'pg' takes advantage  of
          |      the  fact  that 'vth' knows the size of the screen, and uses
          |      all available lines to display the file.  In this  case  the
          |      '-s'  argument is ignored.  If 'vth' output is not used, and
          |      the '-s' argument is omitted, 'pg' uses a default  value  of
          |      23 lines.


            _E_x_a_m_p_l_e_s

                 pg -s 5 file
                 fmt english | pg
                 help -i | pg -m "continue or quit? "


            _M_e_s_s_a_g_e_s

          |      "Usage:  pg ..."  for invalid argument syntax.


          | _B_u_g_s

          |      The "h" command output is not paged.


            _S_e_e _A_l_s_o

          |      cat   (1),   copy  (1),  print  (1),  page  (2),  vt?*  (2),
                 _I_n_t_r_o_d_u_c_t_i_o_n _t_o _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _T_e_x_t _E_d_i_t_o_r






            pg (1)                        - 2 -                        pg (1)


