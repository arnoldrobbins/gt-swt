

            os (1) --- convert backspaces to line printer overstrikes  10/17/82


            _U_s_a_g_e

                 os { -l <page length> | -x }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Os'  is  a  filter  that  may be used to convert backspaces
                 (such as those produced by the formatter for underlining and
                 boldfacing) into  standard  Fortran  line  printer  carriage
                 control codes.

                 If  the output of 'os' is spooled, the Fortran forms control
                 mode must be in effect.  Use of the "f" option on  the  'sp'
                 command  or  the  "f"  option in a "/dev/lps" pathname (e.g.
                 "/dev/lps/f") will enable Fortran forms control.

                 If the  "-x"  option  is  included,  'os'  will  attempt  to
                 generate  output for a Printronix printer.  We are told that
                 these printers can overprint only a  single  line,  and  the
                 characters  on  that  line  can  only be underscores.  Under
                 "-x", 'os' emits only the overstriking that can be performed
                 on these printers.

                 'Os' will generate a page-eject at the bottom of  each  page
                 (to  keep  the  pages  correct in case of a paper jam).  The
                 <page_length> is the number of lines per  output  page.   If
                 <page_length> is omitted, 'os' assumes 66 (standard paper).


            _E_x_a_m_p_l_e_s

                 fmt report | os | sp / f
                 junk> os >/dev/lps/f/bjunk


            _M_e_s_s_a_g_e_s

                 "Usage:  os ..."  for invalid argument syntax.


            _S_e_e _A_l_s_o

                 sp (1), fos (1)














            os (1)                        - 1 -                        os (1)


