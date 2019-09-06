

            stats (1) --- print statistical measures                 08/27/84


          | _U_s_a_g_e

                 stats  [ -{option} ]

                 option ::= t | a | m | s | v | h | l | r | q | n | %<rank>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Stats'  is  a  filter  that can be used to generate various
                 statistical measures of a set of floating point data.  Input
                 to 'stats' is a list of numbers, appearing one per line  but
                 free-form  within  each  line,  on its first standard input.
                 Output from 'stats' is a list  of  statistics,  preceded  by
                 labels  (unless  the  "-q" option has been specified) on the
                 first standard output.

          |      The options control  the  statistics  to  be  printed.   The
          |      available options are:

          |           -t   Print the sum (total) of all data values.
          |           -a   Print  the  arithmetic  mean (average) of the
          |                data values.
          |           -m   Print the  mode  (most  frequently  occurring
          |                value).
          |           -s   Print  the  standard deviation of the popula-
          |                tion sampled.
          |           -v   Print the variance of the population sampled.
          |           -h   Print the highest value in the sample.
          |           -l   Print the lowest value in the sample.
          |           -r   Print the  range  of  values  in  the  sample
          |                (highest - lowest).
          |           -q   Quiet; turn off the printing of labels on the
          |                output.
          |           -n   Print  the  number of data values in the sam-
          |                ple.
                      %    Print percentile ranks  for  the  data.   The
                           percent sign (%) must be followed by the per-
                           centile increment to be used for the ranking.
                           Note  that "-%50" yields the median value for
                           the sample.

                 The default options are currently "-as%50".


            _E_x_a_m_p_l_e_s

                 grades> stats
                 grades> stats -ahl%25
                 { ([files .r])> tc -l } | stats -tahl
                 lf -cw | field 1-8 | stats -tq


            _M_e_s_s_a_g_e_s

                 "Usage:  stats ..."  for improper options.


            stats (1)                     - 1 -                     stats (1)




            stats (1) --- print statistical measures                 08/27/84


            _B_u_g_s

                 The mode and  percentile  rank  statistics  are  limited  to
                 relatively small data sets because of an internal sort.






















































            stats (1)                     - 2 -                     stats (1)


