

            mt (1) --- magnetic tape interface                       03/23/82


            _U_s_a_g_e

                 mt [<unit>] [-p<pos>] [-(r|w) [<cvt>] [<blk>] {<file_spec>}] [-v]
                    <unit>      ::=   0 | 1 | 2 | 3 | 4 | 5 | 6 | 7
                    <pos>       ::=   [+|-]<file number>[/<block number>]
                    <cvt>       ::=   -c (a[scii] | b[inary] | e[bcdic])
                    <blocking>  ::=   -b <record size>[/<blocking factor>]


            _D_e_s_c_r_i_p_t_i_o_n

                 'Mt'  is  a  program  designed  to provide a general purpose
                 magnetic tape handling facility to users of  the  Subsystem.
                 It   supports   three   basic   types  of  operation:   tape
                 positioning, reading files from tape, and writing  files  to
                 tape.   It  is  also  possible to perform both a positioning
                 operation  and  a  read  or  write  operation  in  a  single
                 invocation.

                 The  first argument may be used to specify a particular tape
                 drive.  The allowable values are integers from 0 through  7,
                 although a particular installation may not support that many
                 drives.  If no unit is specified on the command line, unit 0
                 is  assumed.   Whatever  unit  is  used, it should have been
                 previously assigned by the user with the Primos ASSIGN  com-
                 mand.

                 The  remaining  arguments select one of the basic operations
                 to be performed  on  the  specified  drive.   The  available
                 options are described in the following paragraphs.

                 -p   The  "-p"  option  may  be  used  to  accomplish either
                      relative or absolute  positioning  of  the  tape.   The
                      argument  following  the  "-p"  consists of an optional
                      plus or minus sign followed by either a  <file  number>
                      or  a <file number> and a <block number> separated by a
                      slash (/).

                      If  the  plus  or  minus  sign  is  present,   relative
                      positioning  is  selected;  the <file number> specifies
                      the offset from the current file of  the  target  file.
                      Thus  "+1"  would position the tape to the beginning of
                      the file immediately following the current  one,  while
                      "-1" would position the tape to the immediately preced-
                      ing  file.  If a block number is present, the specified
                      number of blocks are skipped in the same direction.  As
                      a special case, if a minus sign is present and both the
                      <file number> and <block number> are zero, the tape  is
                      positioned to the beginning of the current file.

                      If  no  sign is present, absolute positioning is selec-
                      ted; the <file number> is taken as  the  target  file's
                      ordinal  position on the tape, where the first file has
                      position 1, and the <block  number>  is  taken  as  the
                      ordinal position of the desired block within the target
                      file.


            mt (1)                        - 1 -                        mt (1)




            mt (1) --- magnetic tape interface                       03/23/82


                      In  positioning  the tape, 'mt' only considers physical
                      tape marks; it specifically does not recognize any kind
                      of labels in determining where a file begins and ends.

                 -r   The "-r" option causes 'mt'  to  read  files  from  the
                      specified  tape drive.  The "-r" may optionally be fol-
                      lowed by conversion and blocking specifications.  <Cvt>
                      specifies what kind of character set conversion  is  to
                      be  performed  on  the data read from the tape:  "-c a"
                      indicates that the characters on the tape are in ASCII,
                      "-c e" indicates that they are in EBCDIC,  and  "-c  b"
                      indicates  that they are arbitrary binary codes and are
                      not to be interpreted as  characters  at  all.   If  no
                      <cvt>  is  specified, ASCII is assumed.  The Prime con-
                      vention for text files is to store characters with  the
                      most  significant  bit  set  to  1,  whereas most ASCII
                      encoded tapes are written with this bit set to 0.  'Mt'
                      automatically turns this  bit  on  when  reading  ASCII
                      tapes, and turns it off when writing them.

                      <Blk>  specifies  how the physical blocks from the tape
                      will be broken up into lines before being written  out.
                      This argument is significant only if the specified con-
                      version  is ASCII or EBCDIC; binary records are written
                      out as-is, regardless of whatever  <blk>  specification
                      may  be  in  effect.   If  omitted,  a default value of
                      "80/10" is used; that is, 80 bytes per line,  10  lines
                      per physical tape block.  Although this implicitly sug-
                      gests  that  physical  tape  blocks are 800 bytes long,
                      'mt' will read any size tape block (up to 6K bytes  for
                      ASCII and EBCDIC conversion, up to 12K bytes for binary
                      conversion)  and  divide it into lines according to the
                      specified <record size>.  For ASCII and  EBCDIC  tapes,
                      each line is stripped of trailing blanks and terminated
                      with  a  NEWLINE  character before being written out to
                      its final destination.

                 -v   The "-v" option is used to make 'mt' verbose,  it  will
                      tell  you  how many blocks it read from or wrote to the
                      tape.

                 -w   The "-w" option is syntactically identical to the  "-r"
                      option.  The <cvt> specification may be used to specify
                      what  character  set  will be used in writing the tape,
                      and the <blk> specification determines the size of  the
                      blocks  written.   'Mt'  writes fixed size tape blocks,
                      the size of which  is  determined  by  the  product  of
                      <record  size> and <blocking factor>.  If the specified
                      conversion is ASCII or EBCDIC,  input  lines  that  are
                      shorter  than  <record  size>  are  padded  out to that
                      length with blanks after having their NEWLINE character
                      removed.  As with "-r", binary blocks are  not  divided
                      into  lines.  In any case, if the end of the input file
                      is reached before a complete block has  been  construc-
                      ted,  the  remaining  bytes  are filled with zeros (for
                      binary conversion) or blanks (for ASCII or EBCDIC  con-


            mt (1)                        - 2 -                        mt (1)




            mt (1) --- magnetic tape interface                       03/23/82


                      version).

                 The  remaining  command line arguments are taken as names of
                 files to be read from or written  to  the  tape.   The  full
                 syntax of the <file_spec> argument is described in the entry
                 for  'cat' (1).  Most frequently, it will take the form of a
                 Subsystem pathname.


            _E_x_a_m_p_l_e_s

                 mt -p 1
                 mt 1 -w tape_file
                 mt -r -ce -b120/30 file1 file2 file3
                 cat file | mt -w


            _M_e_s_s_a_g_e_s

                 "Usage:  mt ..."  for incorrect argument syntax.
                 "syntax:   -b   <record   size>[/<blocking   factor>]"   for
                      incorrect blocking arguments.
                 "syntax:   -c (a[scii] | b[inary] | e[bcdic])" for incorrect
                      conversion arguments.
                 "syntax:   -p  [+|-]<file  number>[/<block   number>]"   for
                      incorrect positioning arguments.
                 "maximum  block  size is <max> bytes" if the requested block
                      size exceeds the maximum.
                 "units are <low> to <high>" if an  illegal  unit  number  is
                      specified.
                 "drive is not ready" if the specified unit is not ready.
                 "drive is off line" if the specified unit is not on line.
                 "tape  is  at  end  of  reel"  if  the  tape  mounted on the
                      specified unit is  positioned  beyond  the  end-of-tape
                      marker.
                 "tape  is  in  mid-file" if an attempt is made to write on a
                      tape that is neither at the load point  or  at  a  file
                      mark.
                 "tape  is write protected" if an attempt is made to write on
                      a tape that has no write ring.
                 "<file>:  bad file name" if <file> begins with a dash.
                 "<file>:  can't  create"  if  <file>  can't  be  opened  for
                      writing.
                 "<file>:  can't open" if <file> can't be opened for reading.
                 "<file>: <num>  blocks  read  from tape" when using the "-v"
                      option.
                 "<file>: <num> blocks written to tape" when using  the  "-v"
                      option.
                 "Block  <n>:  <error status> Unrecovered" for an unrecovered
                      tape i/o error  on  the  <n>th  block,  resulting  from
                      <error status>.
                 "beginning  of  file"  if  an attempt is made to do backward
                      relative block positioning beyond a file mark.
                 "beginning of tape" if an attempt is  made  to  do  backward
                      relative positioning beyond the load point.
                 "end  of  file" if an attempt is made to do forward relative


            mt (1)                        - 3 -                        mt (1)




            mt (1) --- magnetic tape interface                       03/23/82


                      block positioning beyond a file mark.
                 "end of tape" if an attempt is made to position  beyond  the
                      end-of-tape marker.


            _S_e_e _A_l_s_o

                 cat (1), Primos MAGNET command, Primos t$mt


















































            mt (1)                        - 4 -                        mt (1)


