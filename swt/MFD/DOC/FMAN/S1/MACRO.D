

            macro (1) --- macro language from Software Tools         01/16/83


            _U_s_a_g_e

                 macro [-e]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Macro'  is  Kernighan and Plauger's macro preprocessor from
                 Chapter 8 of _S_o_f_t_w_a_r_e  _T_o_o_l_s.   'Macro'  is  an  exceedingly
                 powerful  program; it is theoretically possible to use it as
                 a general programming system.  A complete description of its
                 capability is beyond the scope of this document, but  a  few
                 samples   are   presented  here  to  help  the  user  become
                 proficient in its usage.

                 'Macro' is a filter; it takes input from its standard  input
                 file,  expands all macros it encounters, and places the out-
                 put on its standard output  file.   This  behavior  strongly
                 encourages its use in pipelines.

                 The basic format of a macro definition is:

                    define(macro-name, replacement-text)

                 "Macro-name"  is  an identifier, i.e.  a sequence of letters
                 or digits beginning with a letter.  "replacement-text" is  a
                 (possibly  empty)  sequence  of  characters,  which  may  be
                 specially interpreted by 'macro'.

                 The "-e" option allows for the escaping of  characters  that
                 "macro'  would  normally  use  as  delimiters (e.g.  commas,
                 right parenthesis, etc.).  To escape a character, it must be
                 preceded by the escape character "@".  'Macro' discards  the
                 escape  character  and  treats  the  escaped  character as a
                 normal character with no  special  meaning.   Since  'macro'
                 discards the escape character, in order to get a literal "@"
                 it must be escaped ("@@").

                 Macro  arguments  are referred to by a construct of the form
                 "$<integer>" in the replacement text.  The <integer> must be
                 a digit from 0 to 9, inclusive.  (Digits 1-9  represent  the
                 first  through  the  ninth arguments; digit 0 represents the
                 name of the macro itself).  For example, the following macro
                 could be used to skip blanks and tabs in a string,  starting
                 at a given position:

                    define(skipbl,
                       while ($1 ($2) == ' 'c | $1 ($2) == TAB)
                          $2 = $2 + 1
                       )

                 Here are a few examples of the use of this macro:

                    skipbl(line, i)
                    skipbl(str, j)



            macro (1)                     - 1 -                     macro (1)




            macro (1) --- macro language from Software Tools         01/16/83


                 In  order  to  prevent premature evaluation of a string, the
                 string may be surrounded by square brackets.   For  example,
                 suppose  we wished to redefine an identifier.  The following
                 sequence will not work:

                    define(x,y)
                    define(x,z)

                 This is  because  "x"  in  the  second  definition  will  be
                 replaced  by  "y", with the net result of defining "y" to be
                 "z".  The correct method is

                    define(x,y)
                    define([x],z)

                 The square brackets prevent the premature evaluation of "x".

                 'Macro' provides several "built-in"  functions.   These  are
                 given below:

                    divert(filename) or divert(filename,append) or divert
                       "Filename"  is opened for output and its file descrip-
                       tor is stacked.  Whenever 'macro' produces output,  it
                       is directed to the named file.  If the second argument
                       is  present,  output  is  appended  to the named file,
                       rather than overwriting it.   If  both  arguments  are
                       missing,  the current output file is closed and output
                       reverts to the last active file.

                    dnl or dnl(commentary information)
                       As suggested by Kernighan and Plauger,  'dnl'  may  be
                       used  to  delete  all  blanks  and tabs up to the next
                       NEWLINE,  and  the  NEWLINE  itself,  from  the  input
                       stream.   There is no other way to prevent the NEWLINE
                       after each 'define' from being passed to  the  output.
                       Any arguments present are ignored, thus allowing 'dnl'
                       to be used to introduce comments.

                    ifelse(a,b,c,d)
                       If  "a"  and  "b" are the same string, then "c" is the
                       value of the expression; otherwise, "d" is  the  value
                       of  the expression.  Example:  this macro returns "OK"
                       if i is defined to be "1", "ERR" otherwise:
                          define(status,ifelse(i,1,OK,ERR))

                    include(filename)
                       "Filename" is opened and its file descriptor is  stac-
                       ked.    The  next  time  'macro'  requests  input,  it
                       receives input from the named file.  When  end-of-file
                       is seen, 'macro' reverts to the last active input file
                       (the  one  containing  the  last include) and picks up
                       where it left off.

                    incr(n)
                       increment the value of the integer represented by "n",
                       and return the incremented value.  For  instance,  the


            macro (1)                     - 2 -                     macro (1)




            macro (1) --- macro language from Software Tools         01/16/83


                       following  pair  of defines set MAXCARD to 80 and MAX-
                       LINE to 81:
                          define(MAXCARD,80)
                          define(MAXLINE,incr(MAXCARD))

                    substr(s,m,n)
                       return a substring of string "s" starting at  position
                       "m"  with  length  "n".   substr(abc,1,2)  is ab; sub-
                       str(abc,2,1) is b; substr(abc,4,1) is empty.   If  "n"
                       is  omitted,  the  rest  of  the string is used:  sub-
                       str(abc,2) is bc.

                    undefine(name)
                       'Undefine' is used to remove the definition associated
                       with a name.  Note that the name should be  surrounded
                       by brackets, if it is supplied as a literal, otherwise
                       it  will  be  evaluated  before  it  can be undefined.
                       Example:  undefine([x]), undefine([substr])




            _E_x_a_m_p_l_e_s

                 See _S_o_f_t_w_a_r_e _T_o_o_l_s.


            _F_i_l_e_s

                 None used by 'macro'  itself;  the  builtins  'include'  and
                 'divert' may be used for limited file manipulation.


            _M_e_s_s_a_g_e_s

                 Extensive.  See _S_o_f_t_w_a_r_e _T_o_o_l_s.


            _B_u_g_s

                 Blanks  are  not  allowed  between  the  macro  name and its
                 argument list.


            _S_e_e _A_l_s_o

                 rp (1), include (1), _S_o_f_t_w_a_r_e _T_o_o_l_s











            macro (1)                     - 3 -                     macro (1)


