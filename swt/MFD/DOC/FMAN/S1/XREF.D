

            xref (1) --- Ratfor cross reference generator            08/27/84


          | _U_s_a_g_e

                 xref { -{b | i | l | p | u} } { <pathname> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Xref'  produces  a  cross  referenced  listing  of a Ratfor
                 program.  The listing consists of  the  program  text,  with
                 consecutively  numbered  lines,  and an alphabetical concor-
                 dance of the identifiers that occur in the program text.

                 The program text is read from the concatenation of  all  the
                 files specified as <pathname> arguments.  If there are none,
                 standard input is used.

                 Several  command  line  options are available to control the
                 operation of 'xref':

          |        -b highlight  keywords  by  boldfacing.   Any  Ratfor   or
                      Fortran  keywords contained in the program text will be
                      boldfaced (by overstriking) in  the  listing.   If  the
                      listing  is to be printed on a line printer, the output
                      should be filtered through 'os' to  convert  the  over-
                      strikes into multiple lines with Fortran forms control.

          |        -i process 'include' statements.  Any 'include' statements
                      encountered  in  the  program text will be expanded in-
                      line.    The   included   lines   will   be    numbered
                      consecutively  as if they appeared in the primary input
                      file.

          |        -l include  literals  in  the  concordance.   Any  numeric
                      literals  that  appear  in  the  program  text  will be
                      included with the identifiers in the concordance.

          |        -p format  listing  for  printing.   A  formfeed  will  be
                      generated  following  the  listing  of each input file.
                      Output under this option is suitable  for  piping  into
                      'pr'.

          |        -u highlight  keywords  by  underlining.   Any  Ratfor  or
                      Fortran keywords contained in the program text will  be
                      underlined  (by  overstriking)  in the listing.  If the
                      listing is to be printed on a line printer, the  output
                      should  be  filtered  through 'os' to convert the over-
                      strikes into multiple lines with Fortran forms control.


            _E_x_a_m_p_l_e_s

                 rfprog.r> xref
                 xref -pu prog1 prog2 prog3 | print | os >/dev/lps/f





            xref (1)                      - 1 -                      xref (1)




            xref (1) --- Ratfor cross reference generator            08/27/84


            _S_e_e _A_l_s_o

                 os (1), pr (1), rp (1)























































            xref (1)                      - 2 -                      xref (1)


