# term --- set terminal characteristics

   include LIBRARY_DEFS

   character arg (MAXARG)

   integer i
   integer getarg

   if (getarg (1, arg, MAXARG) == EOF)
      call display
   else {
      for (i = 1; getarg (i, arg, MAXARG) ~= EOF; i += 1) {
         if (arg (1) == '-'c)
            call do_opt (arg (2), i)
         else
            call do_term (arg)
         }
      }

   stop
   end


# do_term --- process <type> argument for term

   subroutine do_term (term)
   character term (ARB)

   integer ttyp$v, equal

   call mapstr (term, LOWER)     # map to lower case

   if (equal ("help"s, term) == YES || equal ("?"s, term) == YES)
      call ttyp$l
   else if (ttyp$v (term) == YES)
      ;
   else
      call usage

   return
   end


# do_opt --- process <option> argument for term

   subroutine do_opt (opt, ap)
   character opt (ARB)
   integer ap

   include SWT_COMMON

   integer o
   integer strbsr, duplx$, getarg
   character c, char (4)
   character mntoc

   string_table opos, otext _
      01, "break"          /  _
      02, "echo"           /  _
      03, "enb"            /  _
      20, "eof"            /  _
      04, "erase"          /  _
      05, "escape"         /  _
      06, "inh"            /  _
      07, "kill"           /  _
      08, "lcase"          /  _
      09, "lf"             /  _
      19, "newline"        /  _
      10, "nobreak"        /  _
      11, "noecho"         /  _
      03, "noinh"          /  _
      12, "nolcase"        /  _
      13, "nolf"           /  _
      21, "nose"           /  _
      22, "novth"          /  _
      14, "noxoff"         /  _
      15, "noxon"          /  _
      16, "retype"         /  _
      23, "se"             /  _
      24, "vth"            /  _
      17, "xoff"           /  _
      18, "xon"

   procedure fetch_c forward
   procedure set_lword_bits (bitstr) forward
   procedure reset_lword_bits (bitstr) forward


   call mapstr (opt, LOWER)

   o = strbsr (opos, otext, 1, opt)
   if (o == EOF)
      call usage
   else
      select (otext (opos (o)))
         when (1)                # break
            call break$ (ENABLE)
         when (2)                # echo
            reset_lword_bits (:100000)
         when (3)                # noinh
            reset_lword_bits (:10000)
         when (4) {              # erase
            fetch_c
            Echar = c
            }
         when (5) {              # escape
            fetch_c
            Escchar = c
            }
         when (6)                # inh
            set_lword_bits (:10000)
         when (7) {              # kill
            fetch_c
            Kchar = c
            }
         when (8)                # lcase
            Term_attr (TA_UPPER_ONLY) = NO
         when (9)                # lf
            reset_lword_bits (:40000)
         when (10)               # nobreak
            call break$ (DISABLE)
         when (11)               # noecho
            set_lword_bits (:100000)
         when (12)               # nolcase
            Term_attr (TA_UPPER_ONLY) = YES
         when (13)               # nolf
            set_lword_bits (:40000)
         when (14, 15)           # noxoff, noxon
            reset_lword_bits (:20000)
         when (16) {             # retype
            fetch_c
            Rtchar = c
            }
         when (17, 18)           # xoff, xon
            set_lword_bits (:20000)
         when (19) {             # newline
            fetch_c
            Nlchar = c
            }
         when (20) {             # eof
            fetch_c
            Eofchar = c
            }
         when (21)               # nose
            Term_attr (TA_SE_USEABLE) = NO
         when (22)               # novth
            Term_attr (TA_VTH_USEABLE) = NO
         when (23)               # se
            Term_attr (TA_SE_USEABLE) = YES
         when (24)               # vth
            Term_attr (TA_VTH_USEABLE) = YES

   return


   # fetch_c --- get a character or ASCII mnemonic from argument list

      procedure fetch_c {

         local i; integer i
         ap += 1
         if (getarg (ap, char, 4) == EOF)
            call usage
         i = 1; c = mntoc (char, i, ERR)
         if (c == ERR) {
            call putlin (char, ERROUT)
            call error (": unrecognized mnemonic"s)
            }

         }


   # set_lword_bits --- set bits in the terminal configuration word

      procedure set_lword_bits (bitstr) {
      integer bitstr

         Lword = or (duplx$ (-1), bitstr)
         call duplx$ (Lword)

         }


   # reset_lword_bits --- turn off bits in terminal configuration word

      procedure reset_lword_bits (bitstr) {
      integer bitstr

         Lword = and (duplx$ (-1), not (bitstr))
         call duplx$ (Lword)

         }


   end


# display --- display terminal parameters for term

   subroutine display

   include SWT_COMMON

   integer lword, i, breakval
   integer duplx$, ctomn, chkstr
   character erase (4), escape (4), kill (4), retype (4), eof (4), nl (4)


   lword = duplx$ (-1)  # read configuration word
   call break$ (2, breakval)  # get break inhibit count


# print terminal type and buffer number:

   if (chkstr (Term_type, MAXTERMTYPE) == YES)
      call print (STDOUT, "type *s  "s, Term_type)
   call print (STDOUT, "buffer *i*n"s, and (lword, 8r377))


# print erase, escape, kill and retype characters:

   call ctomn (Echar, erase)
   call ctomn (Escchar, escape)
   call ctomn (Kchar, kill)
   call ctomn (Rtchar, retype)
   call ctomn (Eofchar, eof)
   call ctomn (Nlchar, nl)
   call print (STDOUT, "-erase *s  -escape *s  -kill *s  "s,
         erase, escape, kill)
   call print (STDOUT, "-retype *s  -eof *s  -newline *s*n"s,
         retype, eof, nl)


# print terminal configuration word:

   for (i = 1; i <= 4; {lword = ls (lword, 1); i += 1})
      if (lt (lword, 1) == 0)
         call print (STDOUT, "*#g*s  "s, i + 1,
               "-echo"s, "-lf"s, "-noxoff"s, "-noinh"s)
      else
         call print (STDOUT, "*#g*s  "s, i + 1,
               "-noecho"s, "-nolf"s, "-xoff"s, "-inh"s)


# print status of terminal attributes:

   if (Term_attr (TA_SE_USEABLE) == NO)
      call print (STDOUT, "-nose  "s)
   else
      call print (STDOUT, "-se  "s)

   if (Term_attr (TA_VTH_USEABLE) == NO)
      call print (STDOUT, "-novth  "s)
   else
      call print (STDOUT, "-vth  "s)

   if (Term_attr (TA_UPPER_ONLY) == YES)
      call print (STDOUT, "-nolcase  "s)
   else
      call print (STDOUT, "-lcase  "s)


# print status of break control value:

   if (breakval == 0)
      call print (STDOUT, "-break"s)
   else
      call print (STDOUT, "-nobreak"s)

   call putch (NEWLINE, STDOUT)

   return
   end


# usage --- print usage message and terminate

   subroutine usage

   call remark _
      ("Usage: term [ ? | <term type> | { <option> } ]"p)
   call remark _
      ("   <option> ::= -erase <char>  | -kill <char> | -newline <char>"p)
   call remark _
      ("              | -retype <char> | -eof <char>  | -escape <char>"p)
   call remark _
      ("              | -[no]break | -[no]echo | -[no]lcase | -[no]lf"p)
   call remark _
      ("              | -[no]xoff  | -[no]xon  | -[no]se    | -[no]vth"p)
   call error _
      ("              | -[no]inh"p)

   return
   end
