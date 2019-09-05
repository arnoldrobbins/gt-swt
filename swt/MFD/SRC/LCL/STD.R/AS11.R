# as11 --- PDP-11 cross assembler

undefine(getc)

define(DEBUG,)

define(NOTTHERE,0)                  # Returned by 'index'

define(COMMON_BLOCKS,"as11_com.r.i")

# PDP-11 addressing modes (shifted left by 3)
define(AUTOINCREMENT,16)            # 20 octal
define(AUTODECREMENT,32)            # 40 octal
define(INDEXED,48)                  # 60 octal
define(DEFER_BIT,8)                 # 10 octal

# symbol types
define(UNDEF,'U'c)                  # Undefined symbols
define(ABSOLUTE,'A'c)               # Absolute symbols
define(OPSYMBOL,'O'c)               # Instruction mnemonics
define(REGSYMBOL,'R'c)              # Machine register designators
define(EVEN,'E'c)                   # '.even' directive
define(BYTE,'b'c)                   # '.byte' directive
define(STRUCT,'S'c)                 # '.struct' directive
define(RESERVE,'r'c)                # '.reserve' directive
define(QUOTE,"'"c)
define(STRSYMBOL,QUOTE)             # Strings
define(CONSTANT,'0'c)               # Numbers
define(EOSTMT,';'c)                 # General end-of-statement marker
define(PCREL,'.'c)                  # Relative to program counter
define(BRSYMBOL,'B'c)               # Branch instruction mnemonics

define(MUL_OP, '*'c)                # Multiply operator in expressions
define(DIV_OP, '/'c)                # Division operator in expressions
define(LSHIFT, '<'c)                # Left shift operator
define(RSHIFT, '>'c)                # Right shift operator
define(AND_OP, '&'c)                # "AND" operator in expressions
define(OR_OP, '|'c)                 # "OR" operator in expressions
define(NOT_OP, '~'c)                # "NOT" operator
define(IMMEDIATE, '$'c)             # immediate operand indicator
define(DEFERRED, '*'c)              # deferred addressing indicator
define(GETS, '='c)                  # assignment
define(LINDIRECT, '('c)             # used in sources and destinations
define(RINDIRECT, ')'c)
define(LGROUP,'['c)                 # grouping in expressions
define(RGROUP,']'c)
define(SDSEP,','c)                  # source, destination separator

# symbol table node
define(SYMATT,3)                    # number of symbol attribute words
define(SYMVALUE(s),Mem(s))             # SYMVALUE field of symtab struct
define(SYMTYPE(s),Mem(s+1))            # SYMTYPE field of symtab struct
define(SYMRPTFLG(s),Mem(s+2))          # SYMRPTFLG field of symtab struct

# sizes and limits
define(PUTBACKDEPTH,10)             # number of tokens puttable back
define(MAXLITSYM,9)                 # 1 + length of longest literal sym.
define(MAXTOKENS,10000)             # max number of tokens in program
define(MEMSIZE,20000)               # amount of symbol table space
define(MEMBUFSIZE,1024)             # max number of bytes in block
define(EXPRDEPTH,100)               # size of stacks for expressions

define(semerr,synerr)
define(div,/)
define(max,max0)
define(min,min0)

define(BYTEMASK,255)                # 2 to the 8th minus 1
define(WORDMASK,-1)                 # all ones (-0 on a one-comp mach.)

define(Dot,SYMVALUE(lctr))             # location counter
define(Dtype,SYMTYPE(lctr))            # type of location counter
define(Start,SYMVALUE(saddr))          # start address
define(Defbase,SYMVALUE(dbase))        # default number base



   integer prev_nundef, gflg, lflg, laflg, mflg, maflg
   include COMMON_BLOCKS

   errors_found = NO
   generate_code = NO
   report_undef = NO
   read_input = YES                       # just in first pass
   call lexinit
   call interpret_arguments (gflg, lflg, laflg, mflg, maflg)
   generate_list = laflg

   call remark ("-.")
   call parse                       # perform initial pass
   prev_nundef = nundef + 1         # so is greater
   read_input = NO

   while (errors_found == NO & nundef < prev_nundef & nundef > 0) {
      prev_nundef = nundef
      call remark ("-.")
      call parse                    # middle passes
      }

   if (nundef == 0)
      generate_code = gflg
   else
      report_undef = YES

   if (errors_found == NO
     && generate_code == YES ||
     report_undef == YES || lflg == YES && laflg == NO) {
      generate_list = lflg

      call remark ("-.")

      if (generate_code == YES) {   # initialize transmission
         call gtopen
         bufptr = 1                 # one-based postincrement pointer
         }

      call parse                    # make final pass!

      if (generate_code == YES) {   # wrap up transmission
         call flushbuf
         call gtclose (Start)
         }
      }

   stop
   end


# interpret_arguments --- interpret invoking command arguments for asm

   subroutine interpret_arguments (gflg, lflg, laflg, mflg, maflg)
   integer getarg
   integer gflg, lflg, laflg, mflg, maflg
   integer status, i
   character arg (MAXARG)

   gflg = NO
   lflg = NO
   mflg = NO
   maflg = NO
   laflg = NO
   status = OK

   if (getarg (1, arg, MAXARG) ~= EOF)
      if (arg (1) == 'a'c)
         status = ERR
      else
         for (i = 1; arg (i) ~= EOS; i = i + 1)
            if (arg (i) == 'g'c)
               gflg = YES
            else if (arg (i) == 'l'c)
               lflg = YES
            else if (arg (i) == 'm'c)
               mflg = YES
            else if (arg (i) == 'a'c)
               if (arg (i - 1) == 'l'c)
                  laflg = YES
               else if (arg (i - 1) == 'm'c)
                  maflg = YES
               else
                  status = ERR
            else
               status = ERR

   if (status == ERR)
      call error ("Usage: as11 [g][l[a]][m[a]].")

   return
   end


# synerr --- report syntax (or semantic) error

   subroutine synerr (litmesg)
   include COMMON_BLOCKS

   call print (ERROUT, "*i.", lineno)
   call putch (':'c, ERROUT)
   call putch (' 'c, ERROUT)
   call remark (litmesg)
   errors_found = YES

   return
   end


# membership --- determine if a character is in a set

   integer function membership (candidate, set)
   character candidate, set (ARB)
   integer index

   if (index (set, candidate) == NOTTHERE)
      membership = NO
   else
      membership = YES
   return
   end


######################################################################
#                      Lexical Section                               #
######################################################################

# lexinit --- initialize symbol table and other things

   subroutine lexinit
   include COMMON_BLOCKS

   integer junk
   character nl (2), eofs (2)
   data nl (1) /NEWLINE/, nl (2) /EOS/, eofs (1) /EOF/, eofs (2) /EOS/

   pointer mktabl

   call dsinit (MEMSIZE)
   Symtab = mktabl (SYMATT)

   srptflg = NO                  # don't list predefined symbols on map

   Ibp = 1
   Inbuf (Ibp) = EOS             # buffer for line I/O; init to force read

   lctr = install ("."s, ABSOLUTE, 0)        # the location counter
   saddr = install ("start'"s, ABSOLUTE, 0)     # program start address
   dbase = install ("base'"s, ABSOLUTE, 10)     # default number base

   newlinex = install (nl, EOSTMT, ARB)      # end-of-statement markers
   junk = install (eofs, EOF, ARB)           # end-of-file
   junk = install (".EOF"s, EOF, ARB)
   junk = install (";"s, EOSTMT, ARB)
   junk = install (".even"s, EVEN, ARB)
   junk = install (".byte"s, BYTE, ARB)    # byte directive
   junk = install ("b'"s, BYTE, ARB)
   junk = install (".struct"s, STRUCT, ARB)
   junk = install (".reserve"s, RESERVE, ARB)

   # VT40 codes
   junk = install ("char"s, ABSOLUTE, :100000)   # set graphic mode
   junk = install ("shortv"s, ABSOLUTE, :104000)
   junk = install ("longv"s, ABSOLUTE, :110000)
   junk = install ("point"s, ABSOLUTE, :114000)
   junk = install ("graphx"s, ABSOLUTE, :120000)
   junk = install ("graphy"s, ABSOLUTE, :124000)
   junk = install ("relatv"s, ABSOLUTE, :130000)
   junk = install ("int0"s, ABSOLUTE, :2000)     # optional parameters
   junk = install ("int1"s, ABSOLUTE, :2200)     #  in set graphic mode
   junk = install ("int2"s, ABSOLUTE, :2400)     #  instruction
   junk = install ("int3"s, ABSOLUTE, :2600)
   junk = install ("int4"s, ABSOLUTE, :3000)
   junk = install ("int5"s, ABSOLUTE, :3200)
   junk = install ("int6"s, ABSOLUTE, :3400)
   junk = install ("int7"s, ABSOLUTE, :3600)
   junk = install ("lpoff"s, ABSOLUTE, :100)
   junk = install ("lpon"s, ABSOLUTE, :140)
   junk = install ("blkoff"s, ABSOLUTE, :20)
   junk = install ("blkon"s, ABSOLUTE, :30)
   junk = install ("line0"s, ABSOLUTE, :4)
   junk = install ("line1"s, ABSOLUTE, :5)
   junk = install ("line2"s, ABSOLUTE, :6)
   junk = install ("line3"s, ABSOLUTE, :7)
   junk = install ("djmp"s, ABSOLUTE, :160000)   # display jump
   junk = install ("dnop"s, ABSOLUTE, :164000)   # display no-op
   junk = install ("statsa"s, ABSOLUTE, :170000) # load status reg A
   junk = install ("dstop"s, ABSOLUTE, :173400)
   junk = install ("sinon"s, ABSOLUTE, :1400)
   junk = install ("sinof"s, ABSOLUTE, :1000)
   junk = install ("lplite"s, ABSOLUTE, :200)
   junk = install ("lpdark"s, ABSOLUTE, :300)
   junk = install ("ital0"s, ABSOLUTE, :40)
   junk = install ("ital1"s, ABSOLUTE, :60)
   junk = install ("sync"s, ABSOLUTE, :4)
   junk = install ("statsb"s, ABSOLUTE, :174000) # load status reg B
   junk = install ("incr"s, ABSOLUTE, :100)
   junk = install ("intx"s, ABSOLUTE, :40000)    # intensify bit
   junk = install ("minusx"s, ABSOLUTE, :20000)  # sign bits
   junk = install ("minusy"s, ABSOLUTE, :20000)
   junk = install ("misvx"s, ABSOLUTE, :20000)
   junk = install ("misvy"s, ABSOLUTE, :100)

   # VT40 registers' bus addresses
   junk = install ("dpc"s, ABSOLUTE, :172000)
   junk = install ("dsr"s, ABSOLUTE, :172002)
   junk = install ("beep"s, ABSOLUTE, :172002)
   junk = install ("xsr"s, ABSOLUTE, :172004)
   junk = install ("ysr"s, ABSOLUTE, :172006)

   # other device registers on GT40
   junk = install ("rcsr"s, ABSOLUTE, :175610)   # DL11 receiver
   junk = install ("rbuf"s, ABSOLUTE, :175612)
   junk = install ("xcsr"s, ABSOLUTE, :175614)   # DL11 transmitter
   junk = install ("xbuf"s, ABSOLUTE, :175616)
   junk = install ("kbuf"s, ABSOLUTE, :177562)   # LK40 keyboard
   junk = install ("kcsr"s, ABSOLUTE, :177560)
   junk = install ("clcsr"s, ABSOLUTE, :177546)  # line time clock

   junk = install ("boot"s, ABSOLUTE, :166000)   # ROM entry point
   junk = install ("highest"s, ABSOLUTE, :40000) # amount of core

   # ASCII control characters:
   junk = install ("NUL"s, ABSOLUTE, :000)
   junk = install ("SOH"s, ABSOLUTE, :001)
   junk = install ("STX"s, ABSOLUTE, :002)
   junk = install ("ETX"s, ABSOLUTE, :003)
   junk = install ("EOT"s, ABSOLUTE, :004)
   junk = install ("ENQ"s, ABSOLUTE, :005)    # a. k. a. WRU
   junk = install ("ACK"s, ABSOLUTE, :006)
   junk = install ("BEL"s, ABSOLUTE, :007)
   junk = install ("BS"s,  ABSOLUTE, :010)
   junk = install ("HT"s,  ABSOLUTE, :011)
   junk = install ("LF"s,  ABSOLUTE, :012)
   junk = install ("VT"s,  ABSOLUTE, :013)
   junk = install ("FF"s,  ABSOLUTE, :014)
   junk = install ("CR"s,  ABSOLUTE, :015)
   junk = install ("SO"s,  ABSOLUTE, :016)
   junk = install ("SI"s,  ABSOLUTE, :017)
   junk = install ("DLE"s, ABSOLUTE, :020)
   junk = install ("DC1"s, ABSOLUTE, :021)
   junk = install ("DC2"s, ABSOLUTE, :022)
   junk = install ("DC3"s, ABSOLUTE, :023)
   junk = install ("DC4"s, ABSOLUTE, :024)
   junk = install ("NAK"s, ABSOLUTE, :025)
   junk = install ("SYN"s, ABSOLUTE, :026)
   junk = install ("ETB"s, ABSOLUTE, :027)
   junk = install ("CAN"s, ABSOLUTE, :030)
   junk = install ("EM"s,  ABSOLUTE, :031)
   junk = install ("SUB"s, ABSOLUTE, :032)
   junk = install ("ESC"s, ABSOLUTE, :033)
   junk = install ("FS"s,  ABSOLUTE, :034)
   junk = install ("GS"s,  ABSOLUTE, :035)
   junk = install ("RS"s,  ABSOLUTE, :036)
   junk = install ("US"s,  ABSOLUTE, :037)
   junk = install ("SP"s,  ABSOLUTE, :040)
   junk = install ("DEL"s, ABSOLUTE, :177)    # a. k. a. RUBOUT

   # PDP-11 processor register bus addresses
   junk = install ("psw"s, ABSOLUTE, :177776) # processor status word
   junk = install ("swr"s, ABSOLUTE, :177570) # console switch register

   # branch instructions
   junk = install ("br"s,   BRSYMBOL, :000400)
   junk = install ("beq"s,  BRSYMBOL, :001400)
   junk = install ("bne"s,  BRSYMBOL, :001000)
   junk = install ("bmi"s,  BRSYMBOL, :100400)
   junk = install ("bpl"s,  BRSYMBOL, :100000)
   junk = install ("bcs"s,  BRSYMBOL, :103400)
   junk = install ("bcc"s,  BRSYMBOL, :103000)
   junk = install ("bvs"s,  BRSYMBOL, :102400)
   junk = install ("bvc"s,  BRSYMBOL, :102000)
   junk = install ("blt"s,  BRSYMBOL, :002400)
   junk = install ("bge"s,  BRSYMBOL, :002000)
   junk = install ("ble"s,  BRSYMBOL, :003400)
   junk = install ("bgt"s,  BRSYMBOL, :003000)
   junk = install ("bhi"s,  BRSYMBOL, :101000)
   junk = install ("blos"s, BRSYMBOL, :101400)
   junk = install ("blo"s,  BRSYMBOL, :103400)
   junk = install ("bhis"s, BRSYMBOL, :103000)

   # one-operand instructions (not branches)
   junk = install ("clr"s, OPSYMBOL, :005000)
   junk = install ("clrb"s, OPSYMBOL, :105000)
   junk = install ("dec"s, OPSYMBOL, :005300)
   junk = install ("decb"s, OPSYMBOL, :105300)
   junk = install ("inc"s, OPSYMBOL, :005200)
   junk = install ("incb"s, OPSYMBOL, :105200)
   junk = install ("neg"s, OPSYMBOL, :005400)
   junk = install ("negb"s, OPSYMBOL, :105400)
   junk = install ("tst"s, OPSYMBOL, :005700)
   junk = install ("tstb"s, OPSYMBOL, :105700)
   junk = install ("com"s, OPSYMBOL, :005100)
   junk = install ("comb"s, OPSYMBOL, :105100)
   junk = install ("asr"s, OPSYMBOL, :006200)
   junk = install ("asrb"s, OPSYMBOL, :106200)
   junk = install ("asl"s, OPSYMBOL, :006300)
   junk = install ("aslb"s, OPSYMBOL, :106300)
   junk = install ("adc"s, OPSYMBOL, :005500)
   junk = install ("adcb"s, OPSYMBOL, :105500)
   junk = install ("sbc"s, OPSYMBOL, :005600)
   junk = install ("sbcb"s, OPSYMBOL, :105600)
   junk = install ("rol"s, OPSYMBOL, :006100)
   junk = install ("rolb"s, OPSYMBOL, :106100)
   junk = install ("ror"s, OPSYMBOL, :006000)
   junk = install ("rorb"s, OPSYMBOL, :106000)
   junk = install ("swab"s, OPSYMBOL, :000300)
   junk = install ("jmp"s, OPSYMBOL, :000100)

   # two-operand instructions
   junk = install ("mov"s, OPSYMBOL, :010000)
   junk = install ("movb"s, OPSYMBOL, :110000)
   junk = install ("add"s, OPSYMBOL, :060000)
   junk = install ("sub"s, OPSYMBOL, :160000)
   junk = install ("cmp"s, OPSYMBOL, :020000)
   junk = install ("cmpb"s, OPSYMBOL, :120000)
   junk = install ("bis"s, OPSYMBOL, :050000)
   junk = install ("bisb"s, OPSYMBOL, :150000)
   junk = install ("bit"s, OPSYMBOL, :030000)
   junk = install ("bitb"s, OPSYMBOL, :130000)
   junk = install ("bic"s, OPSYMBOL, :040000)
   junk = install ("bicb"s, OPSYMBOL, :140000)

   junk = install ("rts"s, OPSYMBOL, :0200)      # half an operand
   junk = install ("jsr"s, OPSYMBOL, :004000)    # 1.5 operands

   # no-operand instructions
   junk = install ("clc"s, ABSOLUTE, :241)
   junk = install ("clv"s, ABSOLUTE, :242)
   junk = install ("clz"s, ABSOLUTE, :244)
   junk = install ("cln"s, ABSOLUTE, :250)
   junk = install ("sec"s, ABSOLUTE, :261)
   junk = install ("sev"s, ABSOLUTE, :262)
   junk = install ("sez"s, ABSOLUTE, :264)
   junk = install ("sen"s, ABSOLUTE, :270)
   junk = install ("emt"s, ABSOLUTE, :104000)
   junk = install ("trap"s, ABSOLUTE, :104400)   # UNIX "sys"
   junk = install ("bpt"s, ABSOLUTE, :3)      # breakpoint trap
   junk = install ("iot"s, ABSOLUTE, :4)
   junk = install ("halt"s, ABSOLUTE, 0)
   junk = install ("wait"s, ABSOLUTE, 1)
   junk = install ("reset"s, ABSOLUTE, 5)
   junk = install ("rti"s, ABSOLUTE, 2)

   junk = install ("r0"s, REGSYMBOL, 0)    # machine register symbols
   junk = install ("r1"s, REGSYMBOL, 1)
   junk = install ("r2"s, REGSYMBOL, 2)
   junk = install ("r3"s, REGSYMBOL, 3)
   junk = install ("r4"s, REGSYMBOL, 4)
   junk = install ("r5"s, REGSYMBOL, 5)
   junk = install ("sp"s, REGSYMBOL, 6)
   junk = install ("r6"s, REGSYMBOL, 6)
   junk = install ("pc"s, REGSYMBOL, 7)
   junk = install ("r7"s, REGSYMBOL, 7)

   pbchar = EOS                              # no character pushed back
   srptflg = YES              # report user-modified or -defined symbols

   return
   end


# install --- put new entry in symbol table

   integer function install (name, type, value)
   character name (ARB)
   integer type, value

   include COMMON_BLOCKS

   integer attr (SYMATT)

   pointer node, pred

   call enter (name, attr, Symtab)
   call st$lu (name, node, pred, Symtab)
   node += 1
   SYMTYPE (node) = type
   SYMVALUE (node) = value
   SYMRPTFLG (node) = srptflg

   return (node)
   end


# lookup_sym --- look up symbol, record attributes, return index

   integer function lookup_sym (name, type, value)
   character name (ARB)
   integer type, value

   include COMMON_BLOCKS

   integer st$lu

   pointer node, pred

   if (st$lu (name, node, pred, Symtab) == YES) {
      node += 1
      type = SYMTYPE (node)
      value = SYMVALUE (node)
      lookup_sym = node
      }
   else
      lookup_sym = EOF                           # indicate not found

   return
   end


# getc --- get a character for gtok

   character function getc (c)
   character c
   include COMMON_BLOCKS

   integer getlin

   if (pbchar ~= EOS) {
      c = pbchar
      pbchar = EOS
      }
   else
      if (Inbuf (Ibp) == EOS)       # time to read a new buffer?
         if (getlin (Inbuf, STDIN) == EOF)
            c = EOF
         else {
            c = Inbuf (1)     # pick up the first char read
            Ibp = 2
            }
      else {                        # text was already available
         c = Inbuf (Ibp)
         Ibp += 1
         }

   getc = c
   return
   end


# gtok --- get one token from input stream

   integer function gtok (sx, type)
   integer sx                          # symbol index
   integer type

   include COMMON_BLOCKS

   character token (MAXLINE), aux (MAXLINE), c, breakcharacters (25)

   integer value, cx
   integer index, lookup_sym, install, getc, number, ascii

   data breakcharacters /'+'c,      # postincrement and sum operator
                        '-'c,       # predecrement and difference op.
                        MUL_OP,
                        DIV_OP,     # quotient operator
               '('c,   ')'c,        # indirection indicators
               NEWLINE, ';'c,       # end of statement indicators
                        IMMEDIATE,  # immediate operand tag
                        '='c,       # assignment operator
                        ':'c,       # label tag
                        ','c,       # operand separator
               '['c,    ']'c,       # expression groupers
                  TAB,  ' 'c,       # general token separators
                        EOF,        # end of file
                        '#'c,       # comment marker
               OR_OP,   AND_OP,     # operators in expressions
                        NOT_OP,
               LSHIFT,  RSHIFT,
                        DEFERRED,
                        EOS/

   if (token_sp >= 1) {             # return pushed back token
      sx = token_stack (token_sp)
      token_sp = token_sp - 1
      type = SYMTYPE (sx)
      }
   else if (read_input == YES) {       # get fresh token from input file
      call skipbl                      # skip blanks and tabs
      if (getc (c) == '#'c) {          # comment marker
         Inbuf (Ibp) = EOS             # use secret knowledge to force a read
         c = NEWLINE                   # stop at end-of-line
         }

      cx = 1
      if (c == "'"c) {   # collect string
         repeat {
            if (cx >= MAXLINE - 2)
               call error ("In gtok: string too long.")
            token (cx) = c
            cx = cx + 1
            if (getc (c) == "'"c) {
               token (cx) = c
               cx = cx + 1
               if (getc (c) ~= "'"c)
                  break
               }
            else if (c == NEWLINE) {
               call synerr ("Unbalanced quotes.")
               call error ("which I can't handle.")
               }
            }
         token (cx) = EOS
         pbchar = c                 # back up over character after quote
         }
      else if (index (breakcharacters, c) == NOTTHERE) { # ordinary token
         repeat {
            if (cx >= MAXLINE)
               call error ("In gtok: token too long.")
            token (cx) = c
            cx = cx + 1
            } until (index (breakcharacters, getc (c)) ~= NOTTHERE)
         token (cx) = EOS
         pbchar = c                       # back up over break character
         }
      else {                              # is breakcharacter
         token (1) = c                    # form one-character token
         token (2) = EOS
         if (c == NEWLINE)
            newlines_behind = newlines_behind + 1
         }

      if (token (3) == EOS)                  # see if it's a local label
         if (token (2) == 'b'c || token (2) == 'f'c || token (2) == 'h'c)
            if (IS_DIGIT (token (1)))
               call map_knuth_label (token)

      sx = lookup_sym (token, type, value)
      if (sx == EOF) {                 # symbol not already in table
         value = 0
         if (token (1) == "'"c) {
            type = STRSYMBOL
            call dequote (token, aux)
            if (aux (1) ~= EOS) {
               value = ascii (aux (1))
               if (aux (2) ~= EOS)
                  value = ls (value, 8) + ascii (aux (2))
               }
            }
         else if (index (breakcharacters, token (1)) ~= NOTTHERE)
            type = token (1)           # is special character
         else if (number (token, value) == YES)
            type = CONSTANT            # is a number
         else                          # is regular user-defined symbol
            type = UNDEF
         sx = install (token, type, value)
         }

      token_record (tr_ptr) = sx       # save token for subsequent passes
      tr_ptr = tr_ptr + 1
      if (tr_ptr >= MAXTOKENS)
         call error ("Too many tokens in source program.")
      }
   else {                        # return stale token from previous pass
      sx = token_record (tr_ptr)
      tr_ptr = tr_ptr + 1
      type = SYMTYPE (sx)
      if (sx == newlinex)
         newlines_behind = newlines_behind + 1
      }

   gtok = type
   return
   end


# map_knuth_label --- map Knuth-type local label to global label

   subroutine map_knuth_label (token)
   character token (ARB)
   integer itoc, index
   character control
   integer use, which, junk
   integer kllseq (10)     # possibly should be in common blocks
   string digits "0123456789"

   data kllseq /10 * 1/

   which = index (digits, token (1))
   if (which == 0)
      call error ("in map_knuth_label:  can't happen.")
   control = token (2)
   if (control == 'f'c)       # forward reference
      use = kllseq (which)
   else if (control == 'h'c) {   # here definition
      use = kllseq (which)
      kllseq (which) = use + 1
      }
   else              # control is 'b'c - backward reference
      use = kllseq (which) - 1

   token (2) = '#'c       # user cannot make a token with it
   junk = itoc (use, token (3), MAXLINE - 4)
   return
   end


# number --- see if a token is numeric; if so, evaluate it

   # The part of this routine that converts the numbers is Prime-
   # specific in that it uses long integers.  On some machines,
   # it may be necessary to code the conversion in assembly language.
   # on others (CDC, for example), the integers are longer than 16
   # bits anyway and essentially the same algorithm can be used, but
   # masking out all but the low 16 bits as the last calculation.

   integer function number (str, value)
   integer value
   character str (ARB)
   integer index, length
   integer i, l
   longint base, x, v
   include COMMON_BLOCKS # for Defbase
   string digits "0123456789ABCDEF"

   i = 1
   l = length (str)
   if (str (i) == '0'c) {        # leading zero
      i = i + 1
      base = 8                   # octal number
      }
   else if (str (l) == "'"c) {
      l = l - 1
      base = 16
      }
   else if (str (l) == '.'c) {
      l = l - 1
      base = 10
      }
   else
      base = Defbase

   number = YES
   v = intl (0)                  # long integer arithmetic
   for (; i <= l; i = i + 1) {
      x = intl (index (digits, str (i)) - 1) # "1" because is array org.
      if (x < intl (0) | x >= base) {
         number = NO
         break # for speed
         }
      v = base * v + x
      }

   value = ints (v)                       # stores low-order 16 bits
   return
   end


# skipbl --- skip blanks and tabs in input stream

   subroutine skipbl

   include COMMON_BLOCKS

   character c
   character getc

   if (getc (c) ~= ' 'c && c ~= TAB) {
      pbchar = c
      return
      }
   while (Inbuf (Ibp) == ' 'c || Inbuf (Ibp) == TAB)
      Ibp += 1

   return
   end


# getname --- copy name from symbol table node

   subroutine getname (s, name)
   integer s
   character name (MAXLINE)

   include COMMON_BLOCKS

   call scopy (Mem, s + SYMATT, name, 1)
   return
   end


# putback --- put a token back on the input stream

   subroutine putback (token)
   integer token
   include COMMON_BLOCKS

   if (token_sp >= PUTBACKDEPTH)
      call error ("Too many tokens put back.")

   token_sp = token_sp + 1
   token_stack (token_sp) = token
   return
   end


######################################################################
##                      Syntactic Section                           ##
######################################################################

# dequote --- interpret quoted string

   subroutine dequote (with, without)
   character with (ARB), without (ARB)
   integer from, to

   to = 1
   from = 2    # skip leading quote
   while (with (from + 1) ~= EOS) {
      if (with (from) == "'"c)
         from = from + 1
      without (to) = with (from)
      from = from + 1
      to = to + 1
      }
   without (to) = EOS

   return
   end


# parse --- make one pass over the input

   subroutine parse
   integer token                 # Actually a symbol table index
   integer type
   integer gtok
   include COMMON_BLOCKS

   token_sp = 0                              # empty stack
   tr_ptr = 1                                # begin at the beginning
   Dot = 0                                   # reset location counter
   SYMVALUE (dbase) = 10                     # reset number base
   nundef = 0                          # reset count of undefined things
   newlines_behind = 0
   lineno = 1

   while (gtok (token, type) ~= EOF) {
      while (newlines_behind > 0) {      # mess with line numbers
         lineno = lineno + 1
         newlines_behind = newlines_behind - 1
         }
      call stmt (token, type)                # Parse a statement
      }

   return
   end


# stmt --- parse a statement

   subroutine stmt (token, type)
   integer token, type                    # initial token
   integer gtok, exprstmt
   integer token1, token2, type1, type2, status

   token1 = token
   type1 = type

   if (type1 == EOSTMT)
      ;                                   # null statement
   else if (gtok (token2, type2) == ':'c)
      call label (token1)
   else if (type2 == '='c)                # Must be an assignment
      call assg (token1)
   else if (type2 == EOSTMT & type1 == EVEN)
      call doeven
   else {
      call putback (token2)
      if (type1 == OPSYMBOL)              # Is an instruction
         call inst (token1)
      else if (type1 == BRSYMBOL)         # Is a branch
         call branch (token1)
      else if (type1 == STRSYMBOL)        # Is a string
         call stringstmt (token1)
      else if (type1 == BYTE)             # Is .byte directive
         call dot_byte
      else if (type1 == STRUCT | type1 == RESERVE)
         call dot_struct (type1)
      else {                     # try to parse as expression statement
         call putback (token1)
         if (exprstmt (status) == OK)
            ;
         else {
            call synerr ("Unrecognized statement.")
            call skip                   # skip to end of statement
            }
         }
      }

   return
   end


# exprstmt --- handle an expression statement

   integer function exprstmt (status)
   integer status
   integer token, type, junk, meaningtype, meaningvalue
   integer gtok, expr

   status = ERR
   if (expr (meaningvalue, meaningtype, junk) == OK
     && gtok (token, type) == EOSTMT) {
      status = OK
      call genword (meaningvalue, meaningtype)
      }
   exprstmt = status
   return
   end


# dot_byte --- parse remainder of .byte directive

   subroutine dot_byte
   integer token, type, etype, evalue, status
   integer gtok, expr

   while (expr (evalue, etype, status) == OK) {
      call genbyte (and (evalue, BYTEMASK), etype)
      if (gtok (token, type) == EOSTMT)
         break                                  # status is OK
      else if (type ~= SDSEP) {
         status = ERR
         break
         }
      }

   if (status == ERR) {
      call synerr ("Syntax error in @.byte directive.")
      call skip
      }

   return
   end


# dot_struct --- interpret '.struct' directive and '.reserve' directive

   subroutine dot_struct (which)
   integer which
   integer gtok, expr
   integer type, node_size, field_offset, delimiter, status, etype,
     evalue, junk, total, ttype

   include COMMON_BLOCKS

   status = ERR

   type = gtok (node_size, type)
   if (which == STRUCT) {
      total = 0
      ttype = ABSOLUTE
      }
   else {                                 # which is RESERVE
      total = SYMVALUE (node_size)
      ttype = type
      }

   if (type == ABSOLUTE | type == UNDEF)
      repeat {
         type = gtok (field_offset, type)
         if (type ~= ABSOLUTE & type ~= UNDEF)
            break
         if (expr (evalue, etype, junk) ~= OK)
            break
         call doassg (field_offset, total, ttype)
         total = total + evalue
         if (etype == UNDEF)
            ttype = UNDEF
         if (gtok (delimiter, type) == EOSTMT) {
            status = OK
            break
            }
         if (type ~= SDSEP)
            break
         }

   if (status == OK)
      call doassg (node_size, total, ttype)
   else {
      call synerr ("Bad syntax in @.struct directive.")
      if (type ~= EOSTMT)
         call skip
      }

   return
   end


# stringstmt --- handle a string statement

   subroutine stringstmt (it)
   integer it
   integer token, type
   integer gtok

   if (gtok (token, type) == EOSTMT)
      call dostringstmt (it)
   else {
      call synerr ("Bad syntax in string statement.")
      call skip
      }
   return
   end


# label --- handle label for stmt

   subroutine label (target)
   integer target
   include COMMON_BLOCKS

   call doassg (target, Dot, Dtype)

   return
   end


# assg --- parse assignment

   subroutine assg (target)
   integer target
   integer expr, gtok
   integer status, token, type, meaningvalue, meaningtype

   if (expr (meaningvalue, meaningtype, status) == OK)
      if (gtok (token, type) == EOSTMT)
         call doassg (target, meaningvalue, meaningtype)
      else
         status = ERR

   if (status == ERR) {
      call synerr ("Bad syntax in assignment.")
      call skip
      }

   return
   end


# inst --- parse an instruction

   subroutine inst (opmnemonic)
   integer opmnemonic
   integer gtok, srcdst
   integer status, token, type, trailer1value, trailer1type,
     trailer2value, trailer2type, modereg1, modereg2

   modereg1 = 0
   modereg2 = 0
   trailer1type = EOF                     # EOF meaning nonexistant
   trailer2type = EOF

   if (srcdst (modereg2, trailer1value, trailer1type, status) == OK) {
      if (gtok (token, type) == EOSTMT)
         ;                                # only one operand, okay
      else if (type == ','c) {
         modereg1 = modereg2
         modereg2 = 0
         if (srcdst (modereg2, trailer2value, trailer2type,
           status) == OK)       # second operand
            if (gtok (token, type) ~= EOSTMT)
               status = ERR
         }
      else                             # no comma
         status = ERR
      if (status == ERR)
         call synerr ("Instruction syntax.")
      }

   if (status == ERR)
      call skip
   else
      call doinst (opmnemonic, modereg1, modereg2, trailer1value,
        trailer1type, trailer2value, trailer2type)

   return
   end


# branch --- parse a branch instruction

   subroutine branch (mnemonic)
   integer mnemonic
   integer expr, gtok
   integer status, token, type, meaningvalue, meaningtype

   if (expr (meaningvalue, meaningtype, status) == OK)
      if (gtok (token, type) ~= EOSTMT)
         status = ERR

   if (status == ERR) {
      call synerr ("Bad syntax in branch instruction.")
      call skip
      }
   else
      call dobranch (mnemonic, meaningvalue, meaningtype)

   return
   end


# skip --- skip past end of statement for error recovery

   subroutine skip
   integer gtok
   integer type, token
   include COMMON_BLOCKS                   # only for name of symbol

   while (gtok (token, type) ~= EOSTMT) {
      if (type == EOF) {                  # don't pass end of file
         call putback (token)
         break
         }
      call putch (' 'c, ERROUT)
      call putlin (Mem (token + SYMATT), ERROUT)
      }
   call putch (NEWLINE, ERROUT)

   return
   end


# expr --- parse an expression

   integer function expr (value, etype, status)
   integer status, etype, value
   integer token, type, value, etype, binop, unop, ix, termvalue
   integer gtok, membership, apply, index
   integer terms (12), operators (10), defaults (9)

   include COMMON_BLOCKS

   data terms /ABSOLUTE, UNDEF, STRSYMBOL, OPSYMBOL, REGSYMBOL,
               BRSYMBOL, CONSTANT, BYTE, RESERVE, EVEN, STRUCT, EOS/
   data operators /'+'c, '-'c, MUL_OP, DIV_OP, LSHIFT, RSHIFT, AND_OP,
                   OR_OP, NOT_OP, EOS/
   data defaults  /0,    0,     1,      1,      1,   WORDMASK, WORDMASK,
                   0, WORDMASK/

   value = 0
   etype = ABSOLUTE
   unop = EOF
   binop = '+'c
   status = ERR

   repeat {
      # get a term, possibly preceeded by a unary operator
      ix = index (operators, gtok (token, type))
      if (ix ~= NOTTHERE) {      # is a unary operator
         unop = type
         type = gtok (token, type)     # get term now
         }
      if (membership (type, terms) == YES) {
         termvalue = SYMVALUE (token)
         if (unop ~= EOF)              # there was a unary operator
            termvalue = apply (unop, defaults (ix), termvalue)
         unop = EOF
         value = apply (binop, value, termvalue)
         if (etype ~= UNDEF)
            etype = type
         status = OK       # because term encountered
         }
      else {      # is neither term nor operator
         call putback (token)
         break
         }
      # get binary operator
      if (membership (gtok (token, type), operators) == YES) {
         binop = type
         status = ERR   # no terms encountered since this binary op.
         }
      else {            # missing operator
         binop = '+'c   # default operator
         call putback (token)
         }
      }

   if (etype == STRSYMBOL | etype == CONSTANT)
      etype = ABSOLUTE         # prevent ordinary symbols becoming strings
   expr = status
   return
   end


# apply --- apply an arithmetic operator to two operands

   integer function apply (op, a, b)
   integer op, a, b

   if (op == '+'c)
      apply = a + b
   else if (op == '-'c)
      apply = a - b
   else if (op == MUL_OP)
      apply = ints (intl (a) * intl (b))
   else if (op == DIV_OP)
      if (b == 0)
         apply = 0
      else
         apply = ints (intl (a) div intl (b))
   else if (op == LSHIFT)
      apply = ls (a, b)
   else if (op == RSHIFT)
      apply = rs (a, b)
   else if (op == AND_OP)
      apply = and (a, b)
   else if (op == OR_OP)
      apply = or (a, b)
   else if (op == NOT_OP)
      apply = and (a, not (b))   # Default for a is all ones; see 'expr'.
   else
      call error ("in apply:  can't happen.")

   return
   end


# srcdst --- parse a source or destination operand

   integer function srcdst (modereg, trailervalue, trailertype, status)
   integer status, modereg, trailervalue, trailertype
   integer match, expr
   integer postinc (5), simpreg (2), deferred (2), indexed (4),
     immediate (2), predec (5)               # templates
   integer tvec (5)                          # token vector for match
   integer mode, reg, evalue, etype

   include COMMON_BLOCKS

   data predec /'-'c, '('c, REGSYMBOL, ')'c, EOS/
   data postinc /'('c, REGSYMBOL, ')'c, '+'c, EOS/
   data simpreg /REGSYMBOL, EOS/
   data deferred /'*'c, EOS/
   data indexed /'('c, REGSYMBOL, ')'c, EOS/
   data immediate /'$'c, EOS/

   trailertype = EOF    # no trailer word by default
   reg = 0

   if (match (deferred, tvec) == YES)
      mode = DEFER_BIT
   else
      mode = 0

   status = OK
   if (match (predec, tvec) == YES) {
      mode = mode + AUTODECREMENT
      reg = SYMVALUE (tvec (3))        # 3 because predec(3) is REGSYMBOL
      }
   else if (match (postinc, tvec) == YES) {
      mode = mode + AUTOINCREMENT
      reg = SYMVALUE (tvec (2))
      }
   else if (match (simpreg, tvec) == YES)
      reg = SYMVALUE (tvec (1))
   else if (match (immediate, tvec) == YES) {
      if (expr (evalue, etype, status) == OK) {
         mode = mode + AUTOINCREMENT
         reg = 7                       # program counter
         trailertype = etype
         trailervalue = evalue
         }
      }
   else if (expr (evalue, etype, status) == OK) {
      if (match (indexed, tvec) == YES) {
         mode = mode + INDEXED
         reg = SYMVALUE (tvec (2))
         trailervalue = evalue
         trailertype = etype
         }
      else {
         mode = mode + INDEXED
         reg = 7                       # PC
         if (etype == ABSOLUTE)
            trailertype = PCREL
         else
            trailertype = etype     # probably undefined
         trailervalue = evalue
         }
      }
   else
      status = ERR

   if (status == ERR)
      call synerr ("Bad syntax in operand.")

   modereg = mode + reg
   srcdst = status
   return
   end


# match --- match input to a template

   integer function match (template, result)
   integer template (ARB), result (ARB)
   integer gtok
   integer i, type

   for (i = 1; template (i) ~= EOS; i = i + 1)
      if (gtok (result (i), type) ~= template (i))
         break

   if (template (i) == EOS)                     # match complete
      match = YES
   else {                                       # match incomplete
      match = NO
      repeat {
         call putback (result (i))              # put 'em ALL back!
         i = i - 1
         } until (i < 1)
      }

   return
   end


######################################################################
#                       Semantic Section                             #
######################################################################

# ascii --- translate from local character code to that of object mach.

   integer function ascii (char)
   character char

   # Prime --> DEC version:
   #  Just mask "parity" bit off of ASCII character!

   ascii = and (char, 127)
   return
   end


# doeven --- perform .even function

   subroutine doeven
   include COMMON_BLOCKS

   if (mod (Dot, 2) ~= 0)
      call genbyte (0, ABSOLUTE)
   return
   end


# dobranch --- generate code for a branch instruction

   subroutine dobranch (br, value, type)
   integer br, value, type
   integer offset, opcode
   include COMMON_BLOCKS

   if (type == UNDEF)
      opcode = 0                 # standard "don't know" value
   else {
      offset = value - (Dot + 2) # Dot + 2 will be contents of pc
      if (mod (offset, 2) ~= 0)
         call semerr ("Odd branch destination.")
      else if (offset >= 512 | offset < -512)
         call semerr ("Branch destination out of range.")
      else
         opcode = SYMVALUE (br) + and (rs (offset, 1), 255)
      }
   call genword (opcode, type)

   return
   end


# dostringstmt --- generate code for a string statement

   subroutine dostringstmt (it)
   integer it
   integer i
   character name (MAXLINE), aux (MAXLINE)
   integer ascii

   call getname (it, name)
   call dequote (name, aux)
   for (i = 1; aux (i) ~= EOS; i = i + 1)
      call genbyte (ascii (aux (i)), ABSOLUTE)

   return
   end


# doassg --- perform an assignment

   subroutine doassg (target, value, type)
   integer target, value, type
   string s2 " = "
   string s1 ":  "
   character name (MAXLINE)
   integer membership
   integer allowed (10)
   include COMMON_BLOCKS
   data allowed /ABSOLUTE, UNDEF, OPSYMBOL, BYTE, RESERVE, STRUCT,
                  EVEN, REGSYMBOL, BRSYMBOL, EOS/

   if (membership (SYMTYPE (target), allowed) == YES) {
      SYMVALUE (target) = value
      SYMTYPE (target) = type
      SYMRPTFLG (target) = YES
      if (generate_list == YES) {
         call print (STDOUT, "*6i.", lineno)
         call putlin (s1, STDOUT)
         call getname (target, name)
         call putlin (name, STDOUT)
         call putlin (s2, STDOUT)
         call print (STDOUT, "*,8j.", value)
         if (type ~= ABSOLUTE)
            call putch (type, STDOUT)
         call putch (NEWLINE, STDOUT)
         }
      }
   else
      call semerr ("Disallowed assignee (or label).")

   if (type == UNDEF) {
      nundef = nundef + 1
      if (report_undef == YES)
         call semerr ("Undefined.")
      }

   return
   end


# doinst --- generate code for an ordinary instruction (not a branch)

   subroutine doinst (opmnemonic, modereg1, modereg2, trailer1value,
     trailer1type, trailer2value, trailer2type)
   integer opmnemonic, modereg1, modereg2, trailer1value,
     trailer1type, trailer2value, trailer2type
   integer opcode
   integer ls                             # left shift on Prime
   include COMMON_BLOCKS

   opcode = SYMVALUE (opmnemonic) + modereg2 + ls (modereg1, 6)

   call genword (opcode, ABSOLUTE)

   call gentrailer (trailer1type, trailer1value)
   call gentrailer (trailer2type, trailer2value)

   return
   end


# gentrailer --- generate appropriate value for trailer word

   subroutine gentrailer (type, value)
   integer type, value
   include COMMON_BLOCKS                   # for Dot

   if (type == EOF)
      ;                                   # no trailer word
   else if (type == PCREL)                # indexing on program counter
      call genword (value - (Dot + 2), ABSOLUTE)
   else
      call genword (value, type)

   return
   end


# genword --- generate a PDP11 word, increment location counter
   # there is machine-dependant bit-fiddling here!

   subroutine genword (word, type)
   integer word, type
   string s2 ") = "
   string s1 ":  ("
   include COMMON_BLOCKS

   if (type == UNDEF) {
      nundef = nundef + 1
      if (report_undef == YES)
         call semerr ("Undefined.")
      }

   if (Dtype ~= UNDEF) {
      if (mod (Dot, 2) ~= 0) {   # odd address
         call semerr ("Odd address.")
         call genbyte (0, ABSOLUTE)    # be merciful
         }

      if (generate_list == YES) {
         call print (STDOUT, "*6i.", lineno)
         call putlin (s1, STDOUT)
         call print (STDOUT, "*6,8j.", Dot)
         call putlin (s2, STDOUT)
         call print (STDOUT, "*6,8j.", word)
         if (type ~= ABSOLUTE)
            call putch (type, STDOUT)
         call putch (NEWLINE, STDOUT)
         }

      call gbyte (rt (word, 8), type)      # low order byte
      call gbyte (and (rs (word, 8), BYTEMASK), type)    # high order byte
      }

   return
   end


# genbyte --- generate byte, list if appropriate

   subroutine genbyte (byte, type)
   integer byte, type
   string s1 ":  {"
   string s2 "} = "
   include COMMON_BLOCKS

   if (type == UNDEF) {
      nundef = nundef + 1
      if (report_undef == YES)
         call semerr ("Undefined byte.")
      }

   if (Dtype ~= UNDEF) {
      if (generate_list == YES) {
         call print (STDOUT, "*6i.", lineno)
         call putlin (s1, STDOUT)
         call print (STDOUT, "*6,8j.", Dot)
         call putlin (s2, STDOUT)
         if (mod (Dot, 2) == 0)        # low order byte
            call print (STDOUT, "*6,8j.", byte)
         else
            call print (STDOUT, "*3,8j.", byte)
         if (type ~= ABSOLUTE)
            call putch (type, STDOUT)
         call putch (NEWLINE, STDOUT)
         }

      call gbyte (byte, type)
      }

   return
   end



# gbyte --- generate PDP-11 byte, increment location counter

   subroutine gbyte (byte, type)
   integer byte, type
   include COMMON_BLOCKS

   if (generate_code == YES) {
      if (bufptr + bufstart - 1 ~= Dot | bufptr >= MEMBUFSIZE) {
         call flushbuf
         bufstart = Dot
         }
      membuf (bufptr) = byte
      bufptr = bufptr + 1
      }

   Dot = Dot + 1
   return
   end

######################################################################
#                    Transmission Section                            #
######################################################################

# flushbuf --- flush out memory buffer

   subroutine flushbuf
   include COMMON_BLOCKS

                        # Sending an empty block will cause loader
   if (bufptr > 1)      #  to jump to its address.
      call gtblock (bufstart, bufstart + bufptr - 1)

   bufptr = 1
   return
   end


# fetchbyte --- get a byte from the memory buffer for gtblock

   # liason between Semantic and Transmission Sections

   integer function fetchbyte (addr)
   integer addr
   integer x
   include COMMON_BLOCKS

   if (addr < bufstart | addr >= bufptr - 1 + bufstart)
      call error ("in fetchbyte: can't happen.")

   x = addr - bufstart + 1
   fetchbyte = membuf (x)
   return
   end


# gtblock --- send one loader block

   subroutine gtblock (start, fin)
   integer start, fin
   integer fetchbyte
   integer addr
   integer and
   include COMMON_BLOCKS

   checksum = 0

   call outword (1)                 # Majic number for .lda block
   call outword (fin - start + 6)   # Byte count including header words
   call outword (start)             # Address to start loading at

   for (addr = start; addr < fin; addr = addr + 1)
      call outbyte (fetchbyte (addr))

   call outbyte (and (checksum, BYTEMASK))

   return
   end


# gtopen --- initialize for down-line load to GT40

   subroutine gtopen
   include COMMON_BLOCKS
   string header "}R}L@@@@@@@@"

   # Initialize data for down-line loading process
   triple_index = 1

   # Put the bootstrap in load mode and send leader to give it time
   #    to synchronize:
   call putlin (header, STDOUT2)

   # Send the initial zero byte ("to save bootstrap code")
   call outbyte (0)

   return
   end

# outbyte --- shift 8 bits out to the GT40, adjust checksum

   subroutine outbyte (b)
   integer b
   integer rs, ls, or, and
   include COMMON_BLOCKS

   checksum = checksum - b

   triple (triple_index) = and (b, BYTEMASK)
   if (triple_index == 1)
      call outsix (rs (triple (1), 2))
   else if (triple_index == 2)
      call outsix (or (ls (and (triple (1), 3), 4), rs (triple (2), 4)))
   else if (triple_index == 3) {
      call outsix (or (ls (and (triple (2),
        15), 2), rs (triple (3), 6)))
      call outsix (triple (3))
      triple_index = 0
      }
   else
      call error ("in outbyte: can't happen.")
   triple_index = triple_index + 1

   return
   end


# outword --- shift 16 bits out to the GT40, adjust checksum

   subroutine outword (w)
   integer w
   integer rs, and                  # Fortran intrinsic on Prime

   call outbyte (and (w, BYTEMASK)) # low-order byte
   call outbyte (rs (w, 8))         # high-order byte

   return
   end


# outsix --- send assembled six bit character to GT40

   subroutine outsix (arg)
   integer ch, arg
   integer and
   include COMMON_BLOCKS

   ch = and (arg, 63)         # mask to six bits
   if (ch < 32)               # non-printable character
      ch = ch + 64            # make printable, preserving low 6 bits

   call putch (ch + NUL, STDOUT2)   # put parity bit on

   return
   end


# gtclose --- wind up down-line load, send start address

   subroutine gtclose (start_addr)
   integer start_addr
   include COMMON_BLOCKS

   call gtblock (start_addr, start_addr)

   if (triple_index ~= 1)
      call outbyte (0)        # flush
   call putch (NEWLINE, STDOUT2)    # keep Subsystem I/O routines happy

   return
   end
