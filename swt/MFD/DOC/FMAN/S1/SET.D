

            set (1) --- assign values to shell variables             09/11/84


          | _U_s_a_g_e

                 set [ <variable> ] = [ <string> ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Set'  can  be  used  to  assign  arbitrary  values to shell
                 variables.  The first argument is the name of  the  variable
                 to  be set; if absent, the value is printed on standard out-
                 put instead of being assigned.  The third  argument  is  the
                 value to be assigned to the variable; if absent, one line is
                 read  from standard input, and the text thus entered becomes
          |      the  string  to  be  assigned.   The  string   may   contain
          |      unprintable characters in a mnemonic form.  This consists of
          |      a '<' sign followed by an ascii mnemonic and terminated by a
          |      '>'  symbol.   To  prevent  a symbol from being interpreted,
          |      simply escape the '<' with and '@' sign.  For example to set
          |      the variable lfcr to a linefeed and a carriage return, use:

          |           set lfcr = "<lf><cr>".

                 If <variable> exists in the current scope or any surrounding
                 scope, then its value is altered by 'set'; otherwise, it  is
                 created  at  the current lexical level and then the value is
                 assigned.


            _E_x_a_m_p_l_e_s

                 set i = 0
                 set i = [eval i + 1]
          |      set lfcr = "<lf><cr>"
          |      set nolfcr = "@<lf>@<cr>"
          |      set atsign = "@"
                 set response =


            _S_e_e _A_l_s_o

                 declare (1), forget (1), vars (1), save  (1),  _U_s_e_r_'_s  _G_u_i_d_e
                 _f_o_r _t_h_e _S_o_f_t_w_a_r_e _T_o_o_l_s _S_u_b_s_y_s_t_e_m _C_o_m_m_a_n_d _I_n_t_e_r_p_r_e_t_e_r
















            set (1)                       - 1 -                       set (1)


