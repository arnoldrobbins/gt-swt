

            decode (2) --- perform formatted conversion from character  03/30/80


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function decode (str, sp, fmt, fp, ap, a1, ..., a10)
                 character str (ARB), fmt (ARB)
                 integer sp, fp, ap
                 untyped a1, ..., a10

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Decode'  is  used to convert a character string to a number
                 of items in various internal formats (e.g.  integer,  double
                 precision  floating  point, address, etc.).  Its function is
                 similar to the Fortran statement of the same name.

                 The argument 'str' is the character string  to  be  decoded,
                 and  'sp'  indicates the position in 'str' at which decoding
                 is to begin.  'Fmt' is a string of format control directives
                 (discussed below), and 'fp' indicates the position in  'fmt'
                 of  the  first  format  control  directive  to  be  used for
                 decoding.  'A1' through 'a10' (at  most)  are  variables  to
                 receive  decoded  data; 'a2' through 'a10' are optional, and
                 any or all may be omitted.  'Ap' indicates the next variable
                 in the list of 'a1' through 'a10' to receive decoded data.

                 'Decode' performs the decoding  operation  until  it  either
                 runs  out  of  string  to decode or of format to control the
                 decoding.  The arguments 'sp', 'fp',  and  'ap'  are  always
                 updated  to point to the next unused character in 'str', the
                 next unused character in 'fmt', and the next variable in the
                 variable list, respectively.

                 The function return is OK if not all of  the  format  string
                 was  used,  EOF if all of the format string was used, or ERR
                 if an input string was in error.

                 The format string consists of a series  of  "format  control
                 directives."   Each  directive  controls the conversion of a
                 segment of the character string into some internal form.   A
                 directive consists of the format flag character (an asterisk
                 "*")  followed by up to three comma-separated option fields,
                 and a single character format specifier.  The option  fields
                 are  normally designated the "width", "base", and "delimiter
                 character" fields.  The width  field  controls  the  maximum
                 number  of  characters  in the input string to be converted.
                 The base field controls the radix representation assumed for
                 integer fields  (and  a  few  other  miscellaneous  options,
                 discussed below).  The delimiter character field specifies a
                 character  that  may  be  used  to  terminate the conversion
                 process for a single variable if it is  encountered  in  the
                 string.

                 The following format specifiers are available:



            decode (2)                    - 1 -                    decode (2)




            decode (2) --- perform formatted conversion from character  03/30/80


                 aaa

                      The  input  string  must contain an address of the form
                      "<ring_number>.<segment_number>.<offset>".  The receiv-
                      ing variable must be a two-word address pointer.

                 bbb ooorrr yyy

                      The input string must contain a boolean constant, which
                      may be 1 or 0, TRUE or FALSE, T or F, YES or NO,  Y  or
                      N.   The  receiving variable must be of type integer or
                      type logical.

                 ddd ooorrr fff

                      The  input  string  must  contain  a  standard  Fortran
                      representation  of  a  double-precision  floating-point
                      constant.  The  receiving  variable  must  be  of  type
                      long_real or double_precision.

                 ggg

                      None  of  the  input  string is examined by this format
                      code.  The argument pointer 'ap' is set to the value of
                      the width field; this allows  input  items  to  be  re-
                      filled or skipped entirely.

                 hhh

                      The  input string must contain at least as many charac-
                      ters as are specified by the width  field.   The  given
                      number of characters are then packed into the receiving
                      variable,  which  must  be  an array of integers larger
                      than the number of characters  divided  by  two  (since
                      there  are  two characters per word on the Prime.)  The
                      base field, if nonzero, specifies a limit on the number
                      of words of the receiving array that will  be  changed;
                      thus,  if  the width field is not specified, the entire
                      input string  (possibly  terminated  by  the  delimiter
                      character) will be packed into the receiving array, but
                      the  array  will  be  protected  from  overrun  by  the
                      specification of its size in the base field.  The  code
                      'h'  comes  from  the Fortran term "hollerith literal,"
                      which is the type of the receiving variable.

                 iii

                      The input string must contain  a  representation  of  a
                      short  (16-bit) integer constant.  If the base field is
                      non-zero, it is  assumed  to  be  the  radix  used  for
                      representation  of  the  integer.   If zero, base 10 is
                      assumed.  The base specified in  the  format  directive
                      may be overridden in the input string by giving a radix
                      followed  by  the  letter  "r"  followed by the desired
                      value, e.g.   "2r1001"  or  "16rA000".   The  receiving
                      variable must be of type integer.


            decode (2)                    - 2 -                    decode (2)




            decode (2) --- perform formatted conversion from character  03/30/80


                 lll

                      The  input  string  must  contain a representation of a
                      long  (32-bit)  integer  constant.   The   syntax   and
                      semantics of this form are identical to form 'i' above,
                      with  the exception that the receiving variable must be
                      of type long_int (integer*4).

                 nnn

                      The width field specifies the number of newlines in the
                      input string to be skipped.  If the end  of  the  input
                      string  is  encountered, the skipping stops.  This code
                      is most often used by the 'input' routine.

                 ppp

                      The syntax and semantics of this form are identical  to
                      the  'h'  form  above, with the exception that a period
                      character (".") will  be  placed  at  the  end  of  the
                      receiving array so that its length may be determined at
                      run time.

                 rrr

                      The  input  string  must  contain  a  standard  Fortran
                      representation of  a  single-precision  floating  point
                      number.  The receiving variable must be of type real.

                 sss

                      As  many  characters  as  specified  by  the base field
                      (unless the delimiter character is  encountered  first)
                      are  copied  from  the  input  string  to the receiving
                      variable, which must be an array of characters.

                 ttt

                      The string pointer variable 'sp' is set to the value of
                      the width field, or to the length of the input  string,
                      whichever is shorter.

                 uuu

                      The  values of the width, base, and delimiter character
                      fields specified on this directive become  the  default
                      values  for  the  remainder of the format directives in
                      the format string.

                 vvv

                      The syntax and semantics of this directive are  similar
                      to the 'h' directive above, with the exception that the
                      receiving  variable  must  be  a  PL/I-style character-
                      varying array.



            decode (2)                    - 3 -                    decode (2)




            decode (2) --- perform formatted conversion from character  03/30/80


                 xxx

                      The number of characters specified by the  width  field
                      (unless  the  delimiter character is encountered first)
                      are skipped; that is,  the  specified  portion  of  the
                      input string is ignored.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Impossible to explain to the uninitiated reader.  Please see
                 the code, and a system guru.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 sp, fp, ap, a1-a10


            _C_a_l_l_s

                 ctoi,  ctop,  ctoc, length, ctoa, move$, ctov, gctoi, gctol,
                 ctor, ctod, remark


            _S_e_e _A_l_s_o

                 input (2), conversion routines ('cto?*') (2)






























            decode (2)                    - 4 -                    decode (2)


