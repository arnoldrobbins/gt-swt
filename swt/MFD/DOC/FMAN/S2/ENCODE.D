

            encode (2) --- formatted memory-to-memory conversion routine  01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function encode (str, max, fmt, a1, a2, ..., a10)
                 integer max
                 character str (max), fmt (ARB)
                 untyped a1, a2, ..., a10

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Encode'   is  a  memory-to-memory  data  format  conversion
                 routine, patterned after the Fortran statement of  the  same
                 name.   It  takes  a  number of data items, converts them to
                 character form under the control of a format, and places the
                 results in a designated character string.

                 The first argument to 'encode' is the string to receive  the
                 converted  data,  and  the  second  argument  is the maximum
                 length of that string.  The third  argument  is  the  format
                 which  controls conversion (discussed below).  The remaining
                 arguments are data items  to  be  converted.   The  function
                 return  is  the number of characters actually transferred to
                 the receiving string.

                 The format consists of a number of literal characters (to be
                 inserted into the receiving string  without  interpretation)
                 and  format  codes (which control conversion of data items).
                 Format  codes  are  paired  left-to-right  with   successive
                 arguments  that  are  to  be  converted,  just as in Fortran
                 formatted I/O.  Format  codes  have  the  following  general
                 form:

                           * [width] [, [base] [, [fill] ] ] form

                 'Width'  is  a  decimal  integer whose absolute value is the
                 minimum number  of  character  positions  in  the  receiving
                 string  that will be used to store the result of the conver-
          |      sion.  If the value is  zero,  or  insufficiently  large  to
          |      accommodate  the  representation  of  the data item, as many
                 character positions as necessary, and no more, will be used.
                 If 'width' has a positive value,  the  converted  string  is
                 given  default  justification  within  the  specified  field
                 width:  numeric items are right justified, and string  items
                 are   left  justified.   If  'width'  is  negative,  reverse
                 justification is used.

                 'Fill' is a single character (blank by default) to  be  used
                 to pad the converted string to the desired width.  Depending
                 on  the  justification  mode,  enough  instances of the fill
                 character are either prepended or appended to the  converted
                 string  to  make up the difference between its width and the
                 specified field width.

                 'Base' is a decimal integer that is interpreted  differently


            encode (2)                    - 1 -                    encode (2)




            encode (2) --- formatted memory-to-memory conversion routine  01/07/83


                 according  to whether the item being converted is an integer
                 or a string:  for integers, the  absolute  value  of  'base'
                 indicates  the  conversion radix (in the range 2 to 16), and
                 its sign indicates whether the item being converted is to be
                 treated as signed or unsigned  (negative  values  of  'base'
                 yield  unsigned  conversions); for character strings, 'base'
                 indicates the maximum number  of  characters  that  will  be
                 extracted from the string item and placed into the receiving
                 string.

                 'Form'  is  a  single-letter  format code that indicates the
                 type of conversion to be performed.  Since  the  interpreta-
                 tion  of  the  other  fields depends critically on the form,
                 each form will be discussed individually.

                 All three of the parameters 'width', 'base' and  'fill'  may
                 be represented either explicitly in the format string, or by
                 the  character  "#", which indicates that the value is to be
                 taken from the current item  in  the  argument  list.   This
                 allows for a limited form of run-time format specification.


                    _F_o_r_m   _F_u_n_c_t_i_o_n

                      a    Interpret the corresponding argument as an address
                           pointer with the following format:

                                fr.ssss.wwwwww.bb

                           where  'f'  is  present  if the pointer is invalid
                           (i.e.,  would  generate  a  fault  if   referenced
                           through),   'r'   is  the  protection  ring  (0-3)
                           associated with the address, 'ssss' is the segment
                           number (0-7777 octal) of the address, 'wwwwww'  is
                           the  word  number (0-177777 octal) of the address,
                           and 'bb', if present,  is  the  bit  offset  (0-17
                           octal)  of  the  address.  For more information on
                           the significance  of  the  various  fields  of  an
                           address  pointer,  see Prime publication FDR-3059:
                           _'_A_s_s_e_m_b_l_y _L_a_n_g_u_a_g_e _P_r_o_g_r_a_m_m_e_r_'_s _G_u_i_d_e_'.

                      b    Interpret the corresponding argument as a  Boolean
                           (Fortran LOGICAL) value.  The possible results are
                           the  strings  "TRUE" and "FALSE", where the number
                           of characters transferred from the result  to  the
                           receiving  string  is  determined  by  'base'.  If
                           'base' is less than 1, only the "T" or the "F"  is
                           transferred.

                      c    The  argument  to be converted is an ASCII charac-
                           ter, right-justified and zero-filled in its  word.
                           The  'base' specifier does not apply.  "*<width>c"
                           is equivalent to "*<width>,1s".

                      d    Interpret the corresponding argument as a  double-
                           precision   floating-point   number.   The  'base'


            encode (2)                    - 2 -                    encode (2)




            encode (2) --- formatted memory-to-memory conversion routine  01/07/83


                           specifier controls the output format.   If  'base'
                           is greater than 14, the converted text will resem-
                           ble  BASIC  output:   up to six significant digits
                           and no trailing zeros.  This is the  default.   If
                           'base'  is  between  14 and 0, inclusive, the text
                           will resemble Fortran "F"-format  output:   'base'
                           digits  to  the  right  of  the decimal point.  If
                           'base' is negative, the text will resemble Fortran
                           "E"-format  output:   scientific   notation   with
                           "-'base'"  digits  to  the  right  of  the decimal
                           point.  (See the  conversion  routine  'dtoc'  for
                           further  information  on real-to-character conver-
                           sion.)

                      g    Change  the  current  argument  list  pointer   to
                           'width'.   This form allows argument list elements
                           to be reused for interpretation by multiple format
                           codes.  It is particularly useful when 'width'  is
                           specified as "#", allowing the binding of argument
                           list elements to format codes to be deferred until
                           run-time.

                      h    Interpret  the  current argument list element as a
                           Hollerith  character   string   containing   ASCII
                           characters   packed   two-per-word.    The  'base'
                           parameter determines the number of  characters  to
                           be extracted from the Hollerith string.

                      i    Interpret  the corresponding argument as a single-
                           precision integer.   The  absolute  value  of  the
                           'base'  specifier  gives  the radix to be used for
                           conversion:  2 for binary, 3 for ternary,  16  for
                           hexadecimal,  etc.   If  'base'  is  positive, the
                           integer is treated as a  signed,  two's-complement
                           number with 15 bits of precision, plus a sign bit,
                           with  possible  values  in  the  range  -32768  to
                           +32767.  If 'base' is  negative,  the  integer  is
                           treated  as an unsigned binary number with 16 bits
                           of precision with possible values in the  range  0
                           to 65535.

                      l    The  corresponding  argument is a double-precision
                           (long) integer.  See the comments under "i" for an
                           explanation of the action of the 'base' specifier.

                      n    Insert 'width' NEWLINEs into the receiving string.
                           None of the arguments  in  the  argument  list  is
                           referenced.   If  'width' is less than 1, a single
                           NEWLINE is inserted.

                      p    Interpret the corresponding argument as a  period-
                           terminated  packed  character string (such as that
                           generated by the Ratfor "string"p construct).  The
                           'base' specifier is used as the maximum number  of
                           characters to be copied.



            encode (2)                    - 3 -                    encode (2)




            encode (2) --- formatted memory-to-memory conversion routine  01/07/83


                      r    Interpret  the corresponding argument as a single-
                           precision  floating-point  number.   The  comments
                           under "d" above also apply to this form.

                      s    Interpret  the corresponding argument as an unpac-
                           ked  EOS-terminated  character  string  (such   as
                           generated  by  "string"s in Ratfor, or as returned
                           by 'getlin').   The  'base'  specifier  gives  the
                           maximum number of characters to be transferred.

                      t    Tab  to  the  character  position in the receiving
                           string specified by 'width'.  If the  position  is
                           beyond  the  current  end  of  the string, pad the
                           string to that  position  with  instances  of  the
                           'fill'  character.   The  'base'  parameter is not
                           used.

                      u    Set default values for  the  'width',  'base'  and
                           'fill'  parameters.   Subsequent  formatting codes
                           that  do  not  specify  these   values   will   be
                           interpreted  as  if  the values specified here had
                           been used.

                      v    Interpret the corresponding argument  as  a  PL/I-
                           style   varying   character  string.   The  'base'
                           specifier once again gives the maximum  number  of
                           characters that will be transferred to the receiv-
                           ing string.

                      x    Transfer an entire field of fill characters to the
                           receiving string.  The 'base' specifier is unused.
                           The  'fill'  specifier  gives  the character to be
                           used for filling  the  field;  the  default  is  a
                           blank.

                      y    Interpret  the  corresponding argument as a YES/NO
                           value such as those used frequently throughout the
                           Subsystem.  The possible results are  the  strings
                           "YES"  and "NO".  The interpretation of the 'base'
                           parameter is similar to that  used  with  the  "b"
                           form.


                 The  following forms are supported for compatibility with an
                 earlier version of the 'print' subroutine.  They should  not
                 be used in new code.


                      f    Treat the argument as a double-precision floating-
                           point  number.   "F" is equivalent to "d" in every
                           way.

                      j    The corresponding argument is  a  single-precision
                           integer.    "*<width>,<base>j"  is  equivalent  to
                           "*<width>,-<base>i".



            encode (2)                    - 4 -                    encode (2)




            encode (2) --- formatted memory-to-memory conversion routine  01/07/83


                      m    The corresponding  argument  is  a  long  integer.
                           "*<width>,<base>m"  is  equivalent  to "*<width>,-
                           <base>l".


                 Since 'encode' is a complex routine, a few  samples  may  be
                 helpful  in  getting  the hang of its use.  For example, the
                 following call will convert two integers  to  decimal  free-
                 form, with a comma and space between them:

                      len = encode (str, MAXLINE, "*i, *i"s, xcoord, ycoord)

                 These  calls will print an "address" and the contents of the
                 array 'memory' at that address, in base 16 with zero fill:

                      len = encode (str, MAXLINE, "(*4,-16,0i) *4,-16,0i*n"s,
                         address, memory (address))
                      call putlin (str, STDOUT)

                 A typical line of output from the above might be

                      (A000) 0002

                 A filename for use by 'open' might be composed like this:

                      call encode (name, MAXPATH, "=temp=/*s*2,,0i"s,
                         username, sequence_number)

                 If  'username'  was  a  string   containing   "SYSTEM"   and
                 'sequence_number' contained the integer 1, the previous call
                 would set 'name' to the string "=temp=/SYSTEM01".


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Since  Fortran passes arguments to subroutines by reference,
                 'encode' does not need to declare the  actual  type  of  its
                 arguments.   The  type  is determined by scanning the format
                 string and associating arguments with forms,  left-to-right.
                 'Encode'  calls  various "something-to-character" conversion
                 routines to translate data from internal form  to  character
                 string,  which it then simply places in the receiving string
                 (checking to make sure the length of  the  receiver  is  not
                 exceeded).   'Encode'  is  not  simple, and a reading of the
                 code is necessary if full understanding of  its  implementa-
                 tion is required.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 atoc,  ctoc,  ctoi,  ptoc,  vtoc,  gitoc, gltoc, rtoc, dtoc,


            encode (2)                    - 5 -                    encode (2)




            encode (2) --- formatted memory-to-memory conversion routine  01/07/83


                 remark


            _B_u_g_s

                 No more than ten items may  be  encoded.   This  routine  is
                 highly dependent on the ability of Prime's Fortran to handle
                 calls with varying numbers of arguments.


            _S_e_e _A_l_s_o

                 input  (2),  print  (2),  conversion  routines  ('cto?*' and
                 '?*toc') (2)












































            encode (2)                    - 6 -                    encode (2)


