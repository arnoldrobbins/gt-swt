

            translang (3) --- D-Machine microprogram translator      04/22/80


            _U_s_a_g_e

                 translang [-b | -l | -bl] <input_file> [-h <hex_file>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Translang' is a translator for the Burroughs D-Machine sym-
                 bolic     microprogramming     language,     described    in
                 _M_i_c_r_o_p_r_o_g_r_a_m_m_i_n_g _P_r_i_m_e_r, by Harry Katzan, Jr.   (McGraw-Hill
                 Book Company 1977).

                 The  source  code  to  be  translated  is read from the file
                 <input_file>, which conventionally  is  named  with  a  ".d"
                 suffix  (e.g.   "multiply.d").  The hexadecimal microprogram
                 is written to <hex_file> if it is specified;  otherwise,  it
                 is  written  to a file whose name is the input file with the
                 suffix changed to ".h" (e.g.  "multiply.h").  (If the  input
                 file  has  no  suffix,  ".h" is simply appended.)  This file
                 name should be given to 'dmach' for simulation.

                 The options control output listing  behavior.   If  "-b"  is
                 specified, the binary micro and nano instructions are listed
                 after  each  line of source text.  If "-l" is specified, the
                 hexadecimal micro and nano instructions are listed after the
                 entire source text.  If  neither  option  is  specified,  no
                 listing is produced.

                 The  listing,  if  generated, is produced on standard output
                 one, and may be redirected to a file or to  another  program
                 by the usual Subsystem I/O redirection operators.  Each line
                 of  the  source  file is listed (double spaced), followed by
                 any error messages that pertain to its  translation  and  by
                 instruction bit patterns (if the "-b" option is used).  When
          |      no listing is generated, error messages will appear on stan-
          |      dard  output, preceded by the number of the line causing the
          |      error.

                 The language accepted by 'translang' is a  superset  of  the
                 language  defined  in Katzan.  The following differences are
                 particularly worthy of note:

                   ...  The full 96-character ASCII character set may be  used.
                      Upper case is not distinguished from lower case.

                   ...  Input  is  totally free-form; spaces are necessary only
                      to separate adjacent keywords or labels.

                   ...  The character sequence "->" may be used in addition  to
                      "=".   Spaces around these assignment operators are not
                      significant.

                   ...  The character "%" (from the reference language) may  be
                      used in place of "$" to precede a comment.

                   ...  There  is  no  need  to terminate each source line with


            translang (3)                 - 1 -                 translang (3)




            translang (3) --- D-Machine microprogram translator      04/22/80


                      "$".

                   ...  The key words "comment" and "commnt" may both  be  used
                      to  precede  comments.   Furthermore,  they  may appear
                      anywhere on a line (not just at the beginning).

                   ...  Statement labels are not limited  to  6  characters  in
                      length.   (In practice, however, no statement label may
                      be longer than a single input line.)

                   ...  The problems with the microcode  listing  mentioned  on
                      page  135  of Katzan have been corrected.  The bit pat-
                      terns listed are now always complete.

                   ...  Empty statements are now allowable, and are recommended
                      for  improving  the   readability   of   microprograms.
                      Specifically,  blank  lines  may  be  used at will, and
                      labels  may  be  placed  on  lines  by  themselves   to
                      facilitate  insertion  and  deletion  of code following
                      them.

                   ...  The character ":"  may be used in addition to  "."   to
                      terminate a statement label.

                   ...  Commas  are  totally ignored; they may be used wherever
                      desired.

                   ...  The "end" statement served no purpose and is no  longer
                      required  (although  it  will  be accepted as a comment
                      without complaint).

                 There are two major  results  of  these  changes:   (1)  the
                 reference  language used throughout Katzan may be translated
                 without change, which was not previously the case;  (2)  the
                 minor  inflexibilities  and  inconsistencies  present in the
                 original translator have been eliminated,  thus  making  its
                 use a little less complex and frustrating.


            _E_x_a_m_p_l_e_s

                 translang -b multiply.d
                      The  source  program  will  be read from the file "mul-
                      tiply.d"; the hexadecimal output will be written to the
                      file "multiply.h".  A listing of the  source  code  and
                      the  bit patterns produced for each instruction will be
                      sent to the user's terminal.

                 translang -l emulator -h hex >listing
                      The  source  program  will  be  read  from   the   file
                      "emulator"  and  the hexadecimal output will be written
                      to the file "hex".  A listing of the  source  code  and
                      the hexadecimal microprogram will be placed on the file
                      "listing".

                 translang -lb stack.d >/dev/lps


            translang (3)                 - 2 -                 translang (3)




            translang (3) --- D-Machine microprogram translator      04/22/80


                      The   source   program  will  be  read  from  the  file
                      "stack.d"; the hexadecimal output will  be  written  to
                      the  file  "stack.h"; a listing of the source code, the
                      bit  patterns  it   produces,   and   the   hexadecimal
                      microprogram will be printed on the line printer.


            _M_e_s_s_a_g_e_s

                 Several syntax and semantics error messages may be produced.
                 These are intended to be self-explanatory.


            _B_u_g_s

                 This  particular  implementation  has  not  been  thoroughly
                 tested, so if mystifying results  occur,  the  bit  patterns
                 generated  by  suspect  instructions  should  be reported to
                 someone in the Software Support group.

                 Since so much of the nano-instruction syntax is optional, it
                 is difficult to detect syntax errors and produce  meaningful
                 diagnostics.


            _S_e_e _A_l_s_o

                 dmach (3), _M_i_c_r_o_p_r_o_g_r_a_m_m_i_n_g _P_r_i_m_e_r






























            translang (3)                 - 3 -                 translang (3)


