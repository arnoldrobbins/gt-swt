

            print (2) --- easy to use semi-formatted print routine   01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine print (fd, fmt, a1, a2, ...)
                 file_des fd
                 character fmt (ARB)
                 untyped a1, a2, ...

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Print'  is  an output routine designed for ease of use.  It
                 allows the user to specify a  file  on  which  to  write,  a
                 format  to  control  output  to  the file, and any number of
                 items to  be  printed.   The  first  argument  is  the  file
                 descriptor  of  the  file to be used for output.  The second
                 argument is a format string (discussed below).  The  remain-
                 ing  arguments (zero or more) are items to be output accord-
                 ing to format control.

                 The format string is a EOS-terminated character string.   It
                 contains  literal  characters  to  be  printed,  as  well as
                 formatting control structures.   Formatting  control  struc-
                 tures consist of an asterisk (*) followed by a single lower-
                 case  letter  describing  the  action to be performed on the
                 next argument in the argument list.  For a complete list  of
                 the   available  formats,  see  the  documentation  for  the
                 subroutine 'encode'.

                 Characters in the format string that are not associated with
                 a format control construct are output to  the  file  without
                 change.

                 A  few examples may clarify the use of 'print'.  The follow-
                 ing call will print two real numbers along  with  some  text
                 for  identification, followed by a NEWLINE, on standard out-
                 put:

                    call print (STDOUT, "x = *r, y = *r*n"s, xcoord, ycoord)

                 This example shows how a line of output may be built  up  by
                 successive calls:

                      call print (STDOUT, "absolute value = "s)
                      if (x < 0)
                         call print (STDOUT, "*i*n"s, -i)
                      else
                         call print (STDOUT, "*i*n"s, i)

                 Further  examples  of formats may be found in the documenta-
                 tion for 'encode'.

                 For compatibility with earlier versions  of  the  Subsystem,
                 packed  strings  will  still  be  accepted, but all new code
                 should use standard EOS-terminated strings.


            print (2)                     - 1 -                     print (2)




            print (2) --- easy to use semi-formatted print routine   01/07/83


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Since Fortran passes arguments to subroutines by  reference,
                 'print'  does  not  need  to  know  the  actual  type of its
                 printable arguments.  A local character buffer  is  declared
                 and  passed along with the arguments to 'encode', which does
                 the actual work of conversion.   A  call  to  'putlin'  then
                 writes the result to the specified file.


            _C_a_l_l_s

                 encode, ptoc, putlin


            _B_u_g_s

                 At most ten items may be printed.


            _S_e_e _A_l_s_o

                 encode (2), input (2), putlin (2), other conversion routines
                 ('?*toc' and 'cto?*') (2)


































            print (2)                     - 2 -                     print (2)


