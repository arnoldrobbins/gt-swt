

            col (1) --- convert input to multi-column output         07/31/80


            _U_s_a_g_e

                 col { -c <columns> | -g <gutter width> | -i <indent> |
                       -l <page length> | -w <column width> | -t }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Col'  is  a filter that reads lines from standard input and
                 writes multi-column pages on standard output.  The arguments
                 control what assumptions are made about such things  as  the
                 size  of the input lines, the length of the output page, the
                 number of columns per page, and so on;  any  combination  of
                 the following may be used:

                 -c   may  be used to control the number of columns per page;
                      it must be followed by a positive integer.  The current
                      implementation of 'col' restricts the maximum number of
                      columns per page to 8.  If "-c" is omitted, two columns
                      per page is assumed.

                 -g   may be used to set the  width  of  the  "gutters"  that
                      separate  the  columns from each other; it must be fol-
                      lowed by a non-negative integer.  If "-g"  is  omitted,
                      five blanks are placed between columns.

                 -i   may  be  used  to set a running indentation of the left
                      margin and must also  be  followed  by  a  non-negative
                      integer.   If  no "-i" is given an indentation value of
                      zero is assumed.

                 -l   may be used to specify the number of lines on each page
                      of output and must be followed by a  positive  integer.
                      If  it  is  omitted,  'col' assumes a page length of 54
                      lines, which incidentally is the number lines placed on
                      each page by the 'print' command.

                 -w   may be used to set the width of each column and  should
                      also be followed by a positive integer.  To allow lines
                      containing  backspaces  and overstruck characters whose
                      length  exceed  their  printed   width,   'col'   never
                      truncates input lines; consequently, best results occur
                      when  all  the  input  lines  have  a  printed width no
                      greater than the specified value.  If "-w" is  omitted,
                      three  inch wide columns are produced (i.e., 30 charac-
                      ters per column, printed at 10 characters per inch).

                 -t   may be used to select  parameter  values  suitable  for
                      generating  output on a CRT screen.  Specifically, this
                      option selects five columns of 14 characters  each  per
                      22   line  page  with  two  character  gutters  and  no
                      indentation.   The   output   generated   under   these
                      parameters  is  suitable to be piped into the 'pg' com-
                      mand.  If additional options are  used,  the  parameter
                      values so specified override those selected by "-t".



            col (1)                       - 1 -                       col (1)




            col (1) --- convert input to multi-column output         07/31/80


            _E_x_a_m_p_l_e_s

                 file> col | print
                 files .r$ | col -t | pg
                 paper> col -c 2 -w 60 -l 66 >/dev/lps


            _M_e_s_s_a_g_e_s

                 "Usage:  col ..."  for improper arguments.
                 "too many columns" if more that 8 columns are requested.
                 "too many lines" if there is inadequate buffer space to hold
                      an entire page.


            _B_u_g_s

                 The default parameter values are probably wrong.  Misbehaves
                 when  input  lines  contain  more  backspaces than printable
                 characters.


            _S_e_e _A_l_s_o

                 pg (1), print (1)

































            col (1)                       - 2 -                       col (1)


