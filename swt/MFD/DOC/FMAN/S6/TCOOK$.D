

            tcook$ (6) --- read and cook a line from the terminal    09/14/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function tcook$ (ubuf, size, tbuf, tptr)
          |      character ubuf (ARB), tbuf (MAXTERMBUF)
          |      integer size, tptr

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

          |      'Tcook$'  reads  and processes a line from the terminal.  It
          |      handles the processing of escape sequences, case and charac-
          |      ter set mapping, line kills, character deletes,  EOF's,  and
          |      NEWLINE's.   'Ubuf'  is the user's buffer that is to receive
          |      no more than 'size' characters (including the EOS).   'Tbuf'
          |      is a scratch buffer that is used to process the input before
          |      moving  it  to 'ubuf' and 'tptr' is the index of the current
          |      character  being  processed.   Before  the  first  call   to
          |      'tcook$', 'tptr' should contain a 1 and the first element of
          |      'tbuf'  should  contain an EOS.  If these variables are used
          |      in subsequent calls, they will be updated  automatically  to
          |      contain  the  correct  values.  The function return value is
          |      the number of characters returned in 'ubuf',  not  including
          |      the EOS.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Tcook$'  reads  input  from the terminal one character at a
          |      time, interpreting each character as it  is  read.   Special
          |      characters  (the Subsystem escape character, kill character,
          |      retype character, newline character, and EOF character)  are
          |      removed and the appropriate action taken while other charac-
          |      ters  are  echoed  and passed on directly.  When the NEWLINE
          |      character is read or  when  the  end-of-file  is  generated,
          |      reading  terminates and the resulting line is returned after
          |      any required case and character set mapping are performed.

          |      The several special characters used by 'tcook$'  to  provide
          |      extra  functionality  are  explained  below.   Look  at  the
          |      description of the 'escape' character to see  how  to  enter
          |      the  special  characters  without  their  special properties
          |      being interpreted.

          |      eof
          |                The eof character causes the generation of an end-
          |                of-file when read from the terminal.  If there  is
          |                information  already  entered on the current line,
          |                the user's kill response is printed, the  informa-
          |                tion  on  that  line is forgotten, and the end-of-
          |                file is generated.

          |      erase
          |                The erase character  causes  the  removal  of  one
          |                character of previously read input.  The cursor is


            tcook$ (6)                    - 1 -                    tcook$ (6)




            tcook$ (6) --- read and cook a line from the terminal    09/14/84


          |                backed  up  one character position.  If there hap-
          |                pened to be no characters  on  the  line,  nothing
          |                happens.

          |      escape
          |                The escape character is normally used to enter the
          |                Subsystem  special characters and other characters
          |                with special  attributes.   If  any  character  is
          |                preceded  by  the  escape character (including the
          |                escape  character)  it  will  be  passed   without
          |                interpretation  into  the receiving buffer.  If an
          |                escape character is followed by  a  '/'  character
          |                and  then  another  character, that character will
          |                have its parity bit (normally on) turned off.  The
          |                final case is an escape followed by three octal (0
          |                through 7) digits.  The character formed by  those
          |                three digits is the character that is entered.

          |      kill
          |                The  kill character is used to discard all text on
          |                the current input line.  When entered, the  user's
          |                kill  response  is printed, any information on the
          |                current line is forgotten, and the user is allowed
          |                to retype the line.

          |      newline
          |                The newline character is a  signal  to  the  input
          |                routines  that  the  user  is  finished  with  the
          |                current line of text and is ready for the  machine
          |                to  accept it.  If the character is not a linefeed
          |                character (the standard  newline  character)  then
          |                'tcook$' will echo a carriage return linefeed com-
          |                bination and return a NEWLINE character at the end
          |                of the line.

          |      retype
          |                Occasionally,  the user will have a message forced
          |                to his terminal, or will have typed input ahead of
          |                the system, while the system is generating output.
          |                In such a case, the representation of the  current
          |                input line on the user's terminal will become dis-
          |                rupted.   To  see  what has actually been entered,
          |                the user  may  enter  the  retype  character,  and
          |                'tcook$'  will  echo  the current input text.  The
          |                user can then finish entering his commands.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      ubuf, tbuf, tptr


            _C_a_l_l_s

                 Primos c1in, Primos duplx$, Primos tonl, Primos t1ou



            tcook$ (6)                    - 2 -                    tcook$ (6)




            tcook$ (6) --- read and cook a line from the terminal    09/14/84


            _S_e_e _A_l_s_o

                 _U_s_e_r_'_s  _G_u_i_d_e  _f_o_r  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _C_o_m_m_a_n_d
          |      _I_n_t_e_r_p_r_e_t_e_r,  term  (1),  _P_r_i_m_o_s _S_u_b_r_o_u_t_i_n_e_s _R_e_f_e_r_e_n_c_e _G_u_i_d_e
          |      (_D_O_C _3_6_2_1)





















































            tcook$ (6)                    - 3 -                    tcook$ (6)


