

            print (1) --- print files                                03/23/82


            _U_s_a_g_e

                 print {<option>} {-h <heading>|<file_spec>}
                 <option> ::= -i <indent> | -j | -l <length> |
                              -m <margin> | -p

                 <file_spec> ::= <filename> | -[<stdin_number>] |
                                 -n[<stdin_number> | <filename>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Print'  is  an  enhanced version of Kernighan and Plauger's
                 'print' program from _S_o_f_t_w_a_r_e _T_o_o_l_s.  It produces  paginated
                 listings  with  page  headings on its standard output and is
                 well suited for printing text files on a hard-copy  terminal
                 or a line printer.

                 Options  are  available to control the format of the listing
                 as follows:

                      -i   A "-i" followed by an integer  causes  'print'  to
                           prepend  the  specified  number  of blanks to each
                           output line, indenting the listing from  the  left
                           margin.

                      -j   The  "-j" option causes 'print' to put out a form-
                           feed character (FF)  at  the  end  of  each  page.
                           Normally,  'print'  puts out blank lines to get to
                           the top of the next page.

                      -l   A "-l" followed by an integer  causes  'print'  to
                           change  its  idea of how many lines there are on a
                           page to the  specified  number.   By  default,  66
                           lines per page are assumed.

                      -m   A  "-m"  followed by an integer may be used to set
                           the number of blank lines that are left at the top
                           and bottom of each page.  The default setting is 6
                           lines (one inch).  The heading produced at the top
                           of each page is centered in this group of lines.

                      -p   Selecting the "-p" option is equivalent to select-
                           ing "-j" and "-i 5".  This option is designed  for
                           use when the output is directed to a line printer.

                 If  no  <file_spec>  arguments are specified, 'print' prints
                 standard input.  Otherwise, 'print' prints the files  selec-
                 ted  by  each  <file_spec>.   For further information on the
                 options available in  the  <file_spec>  construct,  see  the
                 Reference Manual entry for 'cat'.

                 'Print'  produces a header for each page of output, consist-
                 ing of the name of the file being printed, the time and date
                 of printing, and the current page number in the  file.   The
                 "file  name"  field  of  the  header  may  be  changed to an


            print (1)                     - 1 -                     print (1)




            print (1) --- print files                                03/23/82


                 arbitrary string by using the "-h" option  followed  by  the
                 desired header text.  A "-h" affects all <file_spec>s to its
                 right,  up  until  the  next "-h".  If a "-h" followed by an
                 empty string ("") is specified, 'print' reverts to using the
                 name of the file in the header.


            _E_x_a_m_p_l_e_s

                 file> print
                 print file >neat
                 files .r$ | print -p -n >/dev/lps
                 eight_lines_per_inch> print -l 88 -i10


            _M_e_s_s_a_g_e_s

                 "<file-name>:  can't print" if file could not be read
                 "Usage:  print ..."  for improper argument syntax


            _S_e_e _A_l_s_o

                 pr (1), sp (1), cat (1)


































            print (1)                     - 2 -                     print (1)


