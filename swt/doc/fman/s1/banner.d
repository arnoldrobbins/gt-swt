

            banner (1) --- convert text to banner size               01/16/83


            _U_s_a_g_e

                 banner { - | -c <char> } <string>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Banner'  converts  the  text  in the <string> argument into
                 large characters  for  printing  on  a  suitable  hard  copy
                 printer.   The  printer should be able to handle 132 charac-
                 ters per line.

                 Output is produced on standard output  1  and  may  thus  be
                 piped to some other program or redirected to a file.

                 The  dash  argument,  if  present,  causes  the banner to be
                 white-on-black; if absent, the banner is black-on-white.

                 The character used for printing the banner  is  the  rubout,
                 which  appears on the line printer as a small rectangle com-
                 posed of three vertical lines.  This may be changed  to  any
                 arbitrary  ASCII character by using the "-c <char>" argument
                 sequence.

                 The type font produced is Fortune Light, by the  Bauer  Type
                 Foundry.

                 'Banner'  is capable of producing all of the printable ASCII
                 characters except for the following:

                           ~ ^ \ ` { } [ ] _

                 Of these characters, three may  be  used  to  specify  other
                 special  symbols:   the  caret  ("^")  is interpreted as the
                 "degrees" symbol (superscript zero), the grave accent  ("`")
                 is  interpreted  as  the  'cent'  symbol, and the underscore
                 ("_") is interpreted as the superscript 'th' symbol.


            _E_x_a_m_p_l_e_s

                 banner "Happy Birthday!" >saved_banner
                 banner - "Hi Mom"
                 banner "School of I. C. S." >/dev/lps


            _M_e_s_s_a_g_e_s

                 "Usage:  banner ..."  for improper arguments.


            _S_e_e _A_l_s_o

                 block (3)




            banner (1)                    - 1 -                    banner (1)


