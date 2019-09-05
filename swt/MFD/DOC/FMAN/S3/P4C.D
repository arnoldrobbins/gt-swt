

            p4c (3) --- Pascal 4 Compiler                            07/07/82


            _U_s_a_g_e

                 p4c


            _D_e_s_c_r_i_p_t_i_o_n

                 'P4c'  is  the third release of the Georgia Tech Pascal com-
                 piler for the Prime 400.  The present version  takes  Pascal
                 source  code  from  its  first standard input and produces a
                 listing on its first  standard  output,  and  an  equivalent
                 Fortran program on its second standard output.

                 The  Pascal  language  is  fully  described  in _P_a_s_c_a_l _U_s_e_r_s
                 _M_a_n_u_a_l _a_n_d _R_e_p_o_r_t , Second Edition,  by  K.  Jensen  and  N.
                 Wirth, Springer-Verlag, 1976.  Most error diagnostic numbers
                 produced  by  the  compiler  conform  to those listed in the
                 book.   The  remainder  of  this  description   covers   the
                 important  differences between the language described in the
                 Report and the one implemented at Georgia Tech.


                 OOOppptttiiiooonnnsss

                      The behavior  of  the  Pascal  compiler  is  controlled
                      through the use of special comments of the form:

                           (*$<option sequence> any comment *)

                      An  option sequence consists of a series of option set-
                      tings separated by  commas  with  no  embedded  blanks.
                      Available options include:

                      B+   Turn  on code generation.  (Generated Fortran code
                           is written to standard output port two.)
                      B-   Turn off code generation.
                      L+   Turn on source listing.  (The listing  is  written
                           to standard output port one.)
                      L-   Turn off source listing.
                      P+   Include  pointer  validity checks in the generated
                           code.
                      P-   Do not include pointer validity checks.
                      R2   Include full range and  subscript  checks  in  the
                           generated code.
                      R1   Include   optimized  range  and  subscript  checks
                           (assume subrange variables contain valid values).
                      R0   Do not include any range or subscript checks.

                      Default values for these options are equivalent  to  an
                      occurence  of  "(*$B+,L+,P+,R1*)" at the beginning of a
                      program.

                      Any number of option setting comments may appear  in  a
                      program.   Note, however, that turning off code genera-
                      tion for any  portion  of  a  program  may  render  the
                      generated code generally unreliable.


            p4c (3)                       - 1 -                       p4c (3)




            p4c (3) --- Pascal 4 Compiler                            07/07/82


                 IIIdddeeennntttiiifffiiieeerrrsss

                      The identifiers in a program may be of arbitrary length
                      and  may  include  the  underscore  character ("_") and
                      upper and lower case letters (no  distinction  is  made
                      between upper and lower case).  However, only the first
                      eight characters of an identifier are significant.


                 KKKeeeyyywwwooorrrdddsss

                      Keywords  are  recognized  in  any mixture of upper and
                      lower case.


                 PPPaaaccckkkiiinnnggg

                      The 'packed' attribute that may be  applied  to  arrays
                      and  records is not implemented, with the single excep-
                      tion of character strings.  A quoted  character  string
                      has the type

                            packed array [1..<length of string>] of char

                      This  is  the  only  type  of  character array that may
                      appear  in  an  output  procedure  call  (e.g.   write,
                      writeln).

                      In   addition,   the  standard  procedures  'pack'  and
                      'unpack' are not implemented and cause the compiler  to
                      issue a diagnostic.

                      The  'packed'  keyword may be used freely without error
                      in the declaration of types and variables; however,  it
                      currently has no effect except as described in the case
                      of character arrays.


                 FFFiiillleeesss

                      The  use  of  user  defined files has been implemented.
                      Currently, the only restriction is that fields within a
                      record may not be defined as files.   Remember  that  a
                      Pascal  file  must  be  passed  as  an  argument in the
                      program heading if it is to  exist  after  the  program
                      terminates  execution.   This  is  especially important
                      when using pathnames, since a file must be permanent to
                      be linked to a pathname.

                      The  use  of  pathnames  has  been  implemented  by  an
                      extension  of the RESET and REWRITE procedures.  To use
                      a pathname, a file of the correct type must be  defined
                      within  the  program and this file must be an parameter
                      in the  'program'  heading.   Therefore,  the  complete
                      syntax for RESET or REWRITE is :



            p4c (3)                       - 2 -                       p4c (3)




            p4c (3) --- Pascal 4 Compiler                            07/07/82


                              RESET(<filename>{,"<pathname>"});

                      Note  that  the  pathname  is  enclosed  within  _d_o_u_b_l_e
                      quotes.  The pathname may be up to  100  characters  in
                      length  and  may  contain  any  ASCII  character.   Two
          |           consecutive double quotes act as a single double quote.
          |           All references to the pathname (in  read,  write,  etc)
                      are made through <filename>.

                      There  are  also  four  predefined  text files, two for
                      input and two  for  output,  that  the  programmer  has
                      access to.  For input, the files 'input' and 'keyboard'
                      are  available  and  correspond  to  Subsystem standard
                      input ports one and two, respectively.  For output, the
                      files 'output' and 'prr' are available  and  correspond
                      to Subsystem standard output ports one and two, respec-
                      tively.

                      Newly  added  is the predefined file 'keyboard' (in the
                      place of prd).  This file is used for reading from  the
                      terminal.   (note  that  the  name 'keyboard' was taken
                      from the UCSD PASCAL compiler).  This file differs from
                      standard Pascal files in that it does not incorporate a
                      lookahead  buffer.   Since  input  does  incorporate  a
                      lookahead  buffer,  the program will expect a character
                      before it will start to execute if 'input' is used.  To
                      make these files accessable within  a  program,  it  is
                      only   necessary  to  include  their  names  as  formal
                      parameters in the 'program' declaration.  For example

                           program test (input, output, keyboard, prr)

                      would make all four files available within the program.


                      The standard procedure PAGE has been implemented.  This
                      procedure prints a form feed in the specified file  (as
                      opposed  to a '1' is column 1 as described in the stan-
                      dard).  This allows the user to insert  form  feeds  as
                      needed  in  a file of type TEXT (file of char).  If the
                      file specified as an argument is not of type  TEXT,  an
                      error will be issued.


                      Remember:   There are essentially two types of files in
                      PASCAL; local  files,  those  that  are  local  to  the
                      program  or  a  particular  procedure  or function, and
                      external files,  which  are  files  that  exist  before
                      and/or  after the program is executed.  In order that a
                      file be external, it must be passed as a  parameter  to
                      the 'program' in the program heading.  If pathnames are
                      used, the file that the pathname is linked to must also
                      be in the 'program' heading (NOT the pathname itself!).


                 TTThhheee HHHeeeaaappp


            p4c (3)                       - 3 -                       p4c (3)




            p4c (3) --- Pascal 4 Compiler                            07/07/82


                      Two  standard  procedures,  'mark'  and  'release'  are
                      provided for rudimentary management of the heap.   Each
                      takes a single parameter whose type must be of the form

                           ^<any type>

                      'Mark'  copies  the  current  value of the heap pointer
                      into the argument; 'release'  does  the  opposite:   it
                      copies  the  contents  of  the  argument  into the heap
                      pointer.   This  scheme  is  only   effective   in   an
                      environment  where storage is allocated and released in
                      a (more or less)  last-in-first-out  manner  (which  is
                      exactly the situation in a recursive descent compiler).


                 PPPrrroooccceeeddduuurrreeesss///FFFuuunnnccctttiiiooonnnsss aaasss PPPaaarrraaammmeeettteeerrrsss

                      Neither  procedures  nor  functions  may  be  passed as
                      parameters to other procedures or functions.


                 NNNooonnn---lllooocccaaalll GGGoootttooosss

                      'Goto' statements whose target label is not within  the
                      scope of the current procedure are not supported.


                 PPPrrroooccceeeddduuurrreeesss TTTiiimmmeee aaannnddd DDDaaattteee

                      Two    new    (non-standard)   procedures   have   been
                      implemented.  These are the procedures time  and  date.
                      Both procedures take a single argument which must be an
                      (unpacked)  array  of  8 characters.  The variable into
                      which the corresponding value is to  be  returned  must
                      not  be  subscripted in the procedure call.  An example
                      is:

                              Time (thetime);

                        where the variable thetime is defined as:
                              thetime:  array [1..8] of char;

                      returns  the  current   time   in   variable   thetime.
                      Procedure  DATE  works the same way.  The time returned
                      is in HH:MM:SS  24-hour  format  and  the  date  is  in
                      MM/DD/YY format.


                 EEExxxeeecccuuutttiiiooonnn ooofff PPPaaassscccaaalll PPPrrrooogggrrraaammmsss

                      The  full journey from Pascal source code to executable
                      program involves three stages:  compilation by 'p4c', a
                      trek through the Fortran compiler, and  linking/loading
                      by   'ld'.    The   following   sequence   of  commands
                      illustrates a possible scenario:



            p4c (3)                       - 4 -                       p4c (3)




            p4c (3) --- Pascal 4 Compiler                            07/07/82


                           copy.p> p4c >copy.l >copy.f
                           fc copy.f
                           ld copy.b -l p4clib -o copy

                      Special notice should  be  taken  of  the  "-l  p4clib"
                      argument  sequence in the 'ld' command; it is mandatory
                      for the completion of linking.

                      This procedure may be abbreviated to a  single  command
                      through  the  use  of  the  'p4cl'  command.   Detailed
                      information on its usage is available from 'help'.


            _E_x_a_m_p_l_e_s

                 prog.p> p4c >prog.l >prog.f
                 xref.p> p4c 2>xref.f | sp -f


            _M_e_s_s_a_g_e_s

                 Numbered error diagnostics for syntactic or semantic errors.
                 Messages corresponding to  the  numbers  are  given  in  the
                 User's Manual.


            _B_u_g_s

                 Produces code that is too huge and too slow to be considered
                 useful by anybody.

                 Locally supported.


            _S_e_e _A_l_s_o

                 p4cl (3), _P_a_s_c_a_l _U_s_e_r_'_s _M_a_n_u_a_l _a_n_d _R_e_p_o_r_t





















            p4c (3)                       - 5 -                       p4c (3)


