

            tsort (1) --- topological sort                           04/12/82


            _U_s_a_g_e

                 tsort [-v]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Tsort'  reads pairs of names from its standard input, sorts
                 them topologically, and writes the result  to  its  standard
                 output.  Such a function is useful, for example, in ordering
                 the  subroutines  in a library so that it may be loaded in a
                 single pass.

                 Each input line consists of a pair of  names,  separated  by
                 blanks.  The first name is taken as the predecessor, and the
                 second  as  the  successor.   The names are printed, one per
                 line, such that each name that appeared as  a  successor  on
                 input  follows  all the names that appeared as its predeces-
                 sor.  Normally, only names  that  appeared  somewhere  as  a
                 predecessor  are  printed.   However,  if  the  "-v" flag is
                 specified, all names are printed.


            _E_x_a_m_p_l_e_s

                 brefs library.b | tsort >lib_order
                 precedences> tsort -v


            _M_e_s_s_a_g_e_s

                 "Usage:  tsort ..."  for specifying unknown flag arguments.
                 "input data error" if an input line contains only one name.
                 "cycle (in  reverse  order):   name  ..."   when  a  set  of
                      mutually recursive references is detected.


            _S_e_e _A_l_s_o

                 bmerge (5), bnames (5), brefs (5)


















            tsort (1)                     - 1 -                     tsort (1)


