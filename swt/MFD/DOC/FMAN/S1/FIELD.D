

            field (1) --- manipulate field-oriented data             03/20/80


            _U_s_a_g_e

                 field  [-f[<width>]]  { <column>          |
                                         <column>-<column> |
                                         c<column>         |
                                         s<string> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Field'  is  designed  for manipulation of data in formatted
                 fields.  It is a  filter  that  selects  data  from  certain
                 fields  of  standard  input,  processes it, and copies it to
                 standard output.

                 To visualize the action of  field,  consider  the  following
                 scenario:  Imagine a blank-filled output line.  Cut out data
                 from  an  input  line  according  to  column specifications.
                 Paste this data onto the output line at the  current  column
                 position.   Move  the  current column position to the end of
                 the data just pasted on.

                 Field provides this "cut and paste" operation  as  its  most
                 basic  function.   The argument forms <column> (meaning data
                 in the single column given) and  <column>-<column>  (meaning
                 all  data  between  the  given  columns, inclusive) transfer
                 fields of data from input line to output line.  The argument
                 form s<string> inserts an arbitrary string (called  a  "pad-
                 ding  string")  at  the current position in the output line.
                 The last argument form (c<column>) resets the current  posi-
                 tion in the output line to any desired column.

                 If  the "-f" (fixed-length output) option is selected, field
                 will blank-fill output lines to a fixed length as  specified
                 by  <width>.   If  <width>  is  omitted,  a  value  of 72 is
                 assumed.  In the default mode (no "-f"), trailing blanks are
                 stripped off.

                 Field was first designed to ease the  problem  of  stripping
                 sequence  numbers  from Cobol programs, and still finds most
                 of its work at the same sort of task.  It is, however,  also
                 useful for arranging multiple key fields before sorting with
                 'sort'.


            _E_x_a_m_p_l_e_s

                 cobol_prog> field 1-72 >prog.cob
                 file> field 5-10 s" " 1-80 | sort | field 8-87 >sorted_file
                 data_file> field -f80 1-80 >padded_data


            _M_e_s_s_a_g_e_s

                 "Usage:  field ..."  for incorrect argument syntax
                 "<arg>:  too many padding strings" for storage area overflow


            field (1)                     - 1 -                     field (1)




            field (1) --- manipulate field-oriented data             03/20/80


                 "<arg>:  column out of range" for bad column number
                 "<arg>:  too many fields" for field storage area overflow
                 "<arg>:  bad column syntax" for non-numeric column


            _S_e_e _A_l_s_o

                 sort (1), lam (1), change (1)


















































            field (1)                     - 2 -                     field (1)


