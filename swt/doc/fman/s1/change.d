

            change (1) --- look for a pattern and change it          02/01/81


            _U_s_a_g_e

                 change <pattern> [ <substitution> { <string> } ]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Change'  searches  text strings for a pattern, changes each
                 occurrence of that pattern  to  the  specified  substitution
                 string,  and  writes the result on the standard output.  The
                 first argument specifies the  pattern  to  be  matched;  the
                 second (optional) argument specifies the substitution string
                 to  replace  the matched string.  If the substitution string
                 is missing, it is assumed to  be  null  (i.e.,  the  matched
                 string  is  deleted).  Any additional arguments are taken as
                 strings to be changed.  Each is interpreted  as  a  newline-
                 terminated  string;  thus, lacking specific instances of the
                 newline  character  in  the  <pattern>   or   <substitution>
                 strings,  each  additional  argument  will cause one line of
                 output to be produced.  If no <string>  arguments  are  sup-
                 plied,  lines  of text to be changed are read from the stan-
                 dard input.

                 Patterns and substitution strings recognized by 'change' may
                 take any form allowed in the text editor's  substitute  com-
                 mand.   For  a  discussion  of  this  syntax,  refer  to the
                 documentation for the Subsystem text editor, 'ed', found  in
                 the  _I_n_t_r_o_d_u_c_t_i_o_n  _t_o  _t_h_e  _S_o_f_t_w_a_r_e  _T_o_o_l_s  _S_u_b_s_y_s_t_e_m  _T_e_x_t
                 _E_d_i_t_o_r.


            _E_x_a_m_p_l_e_s

                 lf -c | sort | change "?*" "/mfd/&" >files
                 file.f> change "%C" "#" >file.r
                 change  ".pl1$"  ".l"  [source_file]


            _M_e_s_s_a_g_e_s

                 "Usage:  change ..."  if no arguments are supplied.
                 "illegal pattern string" for bad pattern.
                 "illegal substitution string" for bad substitution string.


            _S_e_e _A_l_s_o

                 ed (1), find (1), tlit (1), makpat (2),  maksub  (2),  match
                 (2), catsub (2)









            change (1)                    - 1 -                    change (1)


