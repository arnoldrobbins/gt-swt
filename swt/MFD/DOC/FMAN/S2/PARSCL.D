

            parscl (2) --- parse command line arguments              01/07/83


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function parscl (str, buf)
                 character str (ARB), buf (MAXARGBUF)

                 Library: vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Parscl'  is  used  to parse most standard Subsystem command
                 line formats automatically.  It examines the  command  line,
                 parses   it   according   to  instructions  present  in  its
                 arguments, and makes the result available to  the  user  for
                 further  processing.   This processing is normally done with
                 the aid of a set of  standard  Subsystem  macros,  described
                 below.   All  arguments handled by 'parscl' are deleted from
                 the command line, so any remaining special cases may be han-
                 dled by the user.

                 The argument 'str' is a string describing the syntax of  the
                 command line.  The argument 'buf' is a one-dimensional array
                 of  characters normally declared with the standard Subsystem
                 macro 'ARG_DECL'.  The function return is OK if the  command
                 line  parsed successfully, ERR if an illegal option was seen
                 or a required parameter was missing.

                 'Parscl'  handles  several  types  of   arguments.    "Flag"
                 arguments  are  single-letter flags, preceded by a hyphen or
                 dash, that have no parameters and may be grouped together in
                 a single argument; for example, "-a" or  "-acq".   Arguments
                 with parameters may have a string or integer value following
                 the  single-letter,  or  present in the next argument in the
                 command line.  For example, "-p1", "-p 1", "-nfilename",  or
                 "-n   filename".   Parameters  for  such  arguments  may  be
                 optional  or  required.   Finally,  some  arguments  may  be
                 ignored entirely, while others may not be allowable at all.

                 The  argument  'str'  contains  a specification of allowable
                 arguments and their types.  Each specification  consists  of
                 an  option  letter  (case  is ignored) followed by a type in
                 angle brackets.  The following types are allowable:  'f'  or
                 'flag'  for flag arguments, 'ign' or 'ignored' for ignorable
                 arguments, 'na' for arguments that are not  allowable,  'oi'
                 or   'opt  int'  for  arguments  with  an  optional  integer
                 parameter, 'os' or 'opt str' for arguments with an  optional
                 string  parameter,  'ri'  or  'req int' for arguments with a
                 required integer  parameter,  and  'rs'  or  'req  str'  for
                 arguments  with a required string parameter.  For example, a
                 command with the syntax

                      -u <integer> [-l <integer>] [-i [<string>]]

                 would pass the following string to 'parscl':

                      u<req int> l<req int> i<opt str>


            parscl (2)                    - 1 -                    parscl (2)




            parscl (2) --- parse command line arguments              01/07/83


                 Order of arguments on the command line  is  unimportant,  as
                 well as the case of the option letter used.

                 The  command line is typically parsed and then examined with
                 a number of standard Subsystem macros.  'ARG_DECL'  is  used
                 to    declare    the    buffer    required    by   'parscl'.
                 "PARSE_COMMAND_LINE(str,msg)" is used  to  invoke  'parscl';
                 'str' is passed to 'parscl' as its first argument, and 'msg'
                 is passed to 'error' to be printed if the command line could
                 not be parsed.  For example, one might use

                      PARSE_COMMAND_LINE ("u<ri>l<ri>i<os>"s,
                         "Usage:  cmd -u<upper> [-l<lower>] [-i[<file>]]"p)

                 Once 'parscl' has been called in this manner, default values
                 for    optional    parameters    may    be   supplied   with
                 'ARG_DEFAULT_INT' and 'ARG_DEFAULT_STR':

                      ARG_DEFAULT_STR(i,"/dev/stdin1"s)
                      ARG_DEFAULT_INT(l, 1)

                 One may test for the presence of an argument on the  command
                 line  with  'ARG_PRESENT', and retrieve argument values with
                 'ARG_VALUE' and 'ARG_TEXT':

                      if (ARG_PRESENT (l))
                         lower = ARG_VALUE (l)
                      else
                         lower = 1
                      call ctoc (ARG_TEXT (i), filename, MAXLINE)

                 Once as much as possible of this kind of argument parsing is
                 complete, the user may examine any  remaining  arguments  by
                 fetching them with 'getarg'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Parscl'  scans  the  specification  string  and builds a 26
                 element array.  Each element of the array corresponds  to  a
                 letter  A - Z and contains an integer describing the type of
                 argument expected when that letter is  encountered.   If  an
                 unrecognized   argument   type   (in   angle   brackets)  is
                 encountered, 'parscl' calls 'error' to print an  error  mes-
                 sage.

                 Then  'parscl'  scans  the  command line arguments, skipping
                 those that do not begin with a hyphen or have  a  letter  as
                 the second character.  Arguments that begin with hyphens are
                 examined  further.   If the letter in the second position of
                 the  argument  is  to  be  ignored,  it  is  skipped.   Flag
                 arguments  are  simply  marked  "present"  in  the  argument
                 buffer.  Values for string  parameters  are  stored  in  the
                 argument  buffer  for  later  retrieval.  Values for integer
                 parameters  are  converted  with  'gctoi'   (thus   allowing
                 arbitrary  radix representation) then stored in the argument


            parscl (2)                    - 2 -                    parscl (2)




            parscl (2) --- parse command line arguments              01/07/83


                 buffer.

                 So that variables can be used in the macro calls,  the  fol-
                 lowing  macros  take  an  integer  or variable containing an
                 integer in the range 1 to 26 rather than a letter:
                 
                      ARG_VALUE_I (<integer>)
                      ARG_PRESENT_I (<integer>)
                      ARG_DEFAULT_INT_I (<integer>, <string>)
                      ARG_DEFAULT_STR_I (<integer>, <string>)


            _C_a_l_l_s

                 ctoc, delarg, error, gctoi, getarg, mapdn, putlin, strbsr


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 buf


            _S_e_e _A_l_s_o

                 delarg (2), getarg (2), gfnarg (2)

































            parscl (2)                    - 3 -                    parscl (2)


