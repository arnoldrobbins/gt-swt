

            last (3) --- print last n lines of a file                01/13/83


            _U_s_a_g_e

                 last [-t ] [ -c] [-v] [-l<#>] [-n | -n<#> | {<pathname>}]


            _D_e_s_c_r_i_p_t_i_o_n

                 This  program  allows  the user to print the last (or first)
                 "n" lines of a file, or of standard input.  In addition,  it
                 does  a  high speed count of the number of lines in the file
                 and can be used simply to size the file.  A  combination  of
                 text printing and counting may be chosen.

                    "-t" -- prints the lines of text requested (last or first
                    "n" lines).

                    "-c"  --  prints the number of lines in the file followed
                    by a blank line.

                    "-v" -- print the pathname of the file.  The pathname  is
                    printed  after  the count (if the count is requested) and
                    is followed by a blank line.

                    "-l<#>" -- <#> is any number between -32767  and  +32767.
                    If  the  number  is positive, then the last <#> lines are
                    printed as text.  Otherwise (<#> is negative), the  first
                    abs(<#>)  lines  are printed as the text.  Therefore, the
                    top 10 lines could be printed with "-l-10".

                    "-n or -n<#>" -- standard  format  to  input  a  list  of
                    filenames to be used as arguments.

                 All  output, except error messages, goes to STDOUT.  Default
                 options are:  last -l20 -t


            _E_x_a_m_p_l_e_s

                 =userlist=> last
                 last -t -l50 [lf -c] | sort | uniq >ends
                 echo [last -c [file]]" lines in "[file]


            _F_i_l_e_s

                 If input is from STDIN and is from  the  terminal  then  the
                 input  is  copied  into  a  file opened with 'mktemp' before
                 positioning  is  done  (since   the   terminal   cannot   be
                 "positioned").


            _M_e_s_s_a_g_e_s

                 "<name>:  Cannot open" for files that cannot be opened.
                 "Usage:  last ..."  for incorrect argument usage.



            last (3)                      - 1 -                      last (3)




            last (3) --- print last n lines of a file                01/13/83


            _B_u_g_s

                 Very  peculiar  behavior  will  occur  if  'last' is used on
                 something other than text (as in binary  image  files).   It
                 also  will not work correctly on files which do not have the
                 character parity bits set on (Prime and SWT standard).

                 Locally supported.


            _S_e_e _A_l_s_o

                 tail (1), tc (1), slice (1)













































            last (3)                      - 2 -                      last (3)


