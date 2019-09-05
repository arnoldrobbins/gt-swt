# decode --- formatted memory-to-memory conversion routine

   integer function decode (str, sp, fmt, fp, ap,
               a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
   character str (ARB)
   integer sp, fmt (ARB), fp, ap, a1 (ARB), a2 (ARB), a3 (ARB), a4 (ARB),
      a5 (ARB), a6 (ARB), a7 (ARB), a8 (ARB), a9 (ARB), a10 (ARB)

   integer cur_sp, cur_fp, cur_ap
   integer i, num, m, l, tp
   integer default_width, default_base, default_delim
   integer width, base, delim
   integer ctoi, gctoi, length

   longint ln
   longint ctoa, gctol

   character term, tmp (MAXDECODE)

   real lr
   real ctor

   longreal ld
   longreal ctod

   procedure interpret_format forward
   procedure get_num forward
   procedure convert_num forward
   procedure error_in_field forward
   procedure get_str forward
   procedure decode_packed forward
   procedure decode_string forward
   procedure decode_bool forward
   procedure decode_tab forward
   procedure decode_addr forward
   procedure decode_varying forward
   procedure decode_integer forward
   procedure decode_longint forward
   procedure decode_real forward
   procedure decode_double forward
   procedure decode_newline forward
   procedure decode_fill forward
   procedure too_many_args forward

   default_width = 0
   default_base = 0
   default_delim = ' 'c

   for (; fmt (fp) ~= EOS; fp += 1) {

      cur_fp = fp                      # for error recovery
      cur_sp = sp
      cur_ap = ap

      if (fmt (fp) ~= FORMATFLAG)
         ;                             # ignore the character

      else {
         interpret_format
         select (fmt (fp))
            when (GOTOFORM)
               ap = width
            when (DEFAULTFORM) {
               default_width = width
               default_base = base
               default_delim = delim
               }
            when (BOOLFORM)
               decode_bool
            when (YESNOFORM)
               decode_bool
            when (TABFORM)
               decode_tab
            when (ADDRFORM)
               decode_addr
            when (PACKEDSTRINGFORM) {
               term = '.'c
               decode_packed
               }
            when (HOLLERITHFORM) {
               term = EOS
               decode_packed
               }
            when (STRINGFORM)
               decode_string
            when (VARYINGFORM)
               decode_varying
            when (INTFORM)
               decode_integer
            when (LONGINTFORM)
               decode_longint
            when (REALFORM)
               decode_real
            when (FLOATFORM, DOUBLEFORM)
               decode_double
            when (NLINE)
               decode_newline
            when (FILLFORM)
               decode_fill
         }
      }

   return (EOF)


   # interpret_format --- interpret and set the flags for the format
      procedure interpret_format {

         fp +=1                        # Get width
         if (fmt (fp) == ','c)         # omitted, use default
            width = default_width
         elif (fmt (fp) ~= '#'c) {     # indirect
            convert_num
            width = num
            }
         else {
            get_num
            width = num
            fp += 1
            }

         if (fmt (fp) ~= ','c)         # Get base
            base = default_base
         else {
            fp += 1
            if (fmt (fp) ~= '#'c) {
               convert_num
               base = num
               }
            else {
               get_num
               base = num
               fp += 1
               }
            }

         if (fmt (fp) ~= ','c)         # Get delim
            delim = default_delim
         else if (fmt (fp + 1) ~= '#'c) {
            delim = fmt (fp + 1)
            fp += 2
            }
         else if (fmt (fp + 2) == '#'c) {
            delim = '#'c
            fp += 3
            }
         else {
            get_num
            delim = num
            fp += 2
            }

         }


   # get_num --- grab a number from the argument list; put in 'num'
      procedure get_num {

         select (ap)
            when ( 1)  num = a1 (1)
            when ( 2)  num = a2 (1)
            when ( 3)  num = a3 (1)
            when ( 4)  num = a4 (1)
            when ( 5)  num = a5 (1)
            when ( 6)  num = a6 (1)
            when ( 7)  num = a7 (1)
            when ( 8)  num = a8 (1)
            when ( 9)  num = a9 (1)
            when (10)  num = a10 (1)
         else
            too_many_args

         ap += 1

         }

   # convert_num --- grab a number from the format string; put in 'num'
      procedure convert_num {

         bool neg

         neg = (fmt (fp) == '-'c)
         if (fmt (fp) == '+'c || fmt (fp) == '-'c)
            fp += 1

         num = ctoi (fmt, fp)
         if (neg)
            num = - num

         }


   # error_in_field --- a field contains an error; return error status
   procedure error_in_field {

      fp = cur_fp
      sp = cur_sp
      ap = cur_ap

      return (ERR)
      }


   # get_str --- get a delimited string from the input string
   procedure get_str {

      if (width > 0) {        # delimited by size
         for (tp = 1; tp <= width && tp <= MAXDECODE; {tp += 1; sp += 1}) {
            if (str (sp) == NEWLINE || str (sp) == EOS)
               break
            tmp (tp) = str (sp)
            }
         for (; tp <= width && tp < MAXDECODE; tp += 1)
            tmp (tp) = ' 'c
         tmp (tp) = EOS
         }

      else {                  # delimited by delimiter
         if (delim == ' 'c)
            SKIPBL (str, sp)

         for (tp = 1; tp < MAXDECODE; {tp += 1; sp += 1}) {
            if (str (sp) == NEWLINE || str (sp) == EOS || str (sp) == delim)
               break
            tmp (tp) = str (sp)
            }
         tmp (tp) = EOS

         if (str (sp) == delim)     # bump over delimiter
            sp += 1
         }

      }


   # decode_packed --- decode a packed string
      procedure decode_packed {

         get_str

         if (base == 0)
            m = MAXLINE
         else
            m = base

         tmp (tp) = term
         tmp (tp + 1) = EOS

         i = 1

         select (ap)
            when ( 1)  call ctop (tmp, i, a1,  m)
            when ( 2)  call ctop (tmp, i, a2,  m)
            when ( 3)  call ctop (tmp, i, a3,  m)
            when ( 4)  call ctop (tmp, i, a4,  m)
            when ( 5)  call ctop (tmp, i, a5,  m)
            when ( 6)  call ctop (tmp, i, a6,  m)
            when ( 7)  call ctop (tmp, i, a7,  m)
            when ( 8)  call ctop (tmp, i, a8,  m)
            when ( 9)  call ctop (tmp, i, a9,  m)
            when (10)  call ctop (tmp, i, a10, m)
         else
            too_many_args

         ap += 1
         }


   # decode_string --- decode an EOS-terminated string
      procedure decode_string {

         get_str

         if (base == 0)
            m = MAXLINE
         else
            m = base

         select (ap)
            when ( 1)  call ctoc (tmp, a1,  m)
            when ( 2)  call ctoc (tmp, a2,  m)
            when ( 3)  call ctoc (tmp, a3,  m)
            when ( 4)  call ctoc (tmp, a4,  m)
            when ( 5)  call ctoc (tmp, a5,  m)
            when ( 6)  call ctoc (tmp, a6,  m)
            when ( 7)  call ctoc (tmp, a7,  m)
            when ( 8)  call ctoc (tmp, a8,  m)
            when ( 9)  call ctoc (tmp, a9,  m)
            when (10)  call ctoc (tmp, a10, m)
         else
            too_many_args

         ap += 1

         }


   # decode_bool --- decode a boolean value
      procedure decode_bool {

         get_str

         tp = 1
         SKIPBL (tmp, tp)

         select (tmp (tp))
            when (EOS)
               if (base == 0)
                  m = 0
               else
                  m = 1
            when ('t'c, 'T'c, 'y'c, 'Y'c, '1'c, 'o'c, 'O'c)
               m = 1
            when ('f'c, 'F'c, 'n'c, 'N'c, '0'c)
               m = 0
         else
            error_in_field

         select (ap)
            when ( 1)  a1 (1) = m
            when ( 2)  a2 (1) = m
            when ( 3)  a3 (1) = m
            when ( 4)  a4 (1) = m
            when ( 5)  a5 (1) = m
            when ( 6)  a6 (1) = m
            when ( 7)  a7 (1) = m
            when ( 8)  a8 (1) = m
            when ( 9)  a9 (1) = m
            when (10)  a10 (1) = m
         else
            too_many_args

         ap += 1

         }


   # decode_tab --- handle tab formats
      procedure decode_tab {

         m = length (str)
         if (width <= m)
            sp = width
         else
            sp = m

         }


   # decode_addr --- decode an address
      procedure decode_addr {

         get_str

         i = 1
         ln = ctoa (tmp, i)
         SKIPBL (tmp, i)
         if (tmp (i) ~= EOS)
            error_in_field

         select (ap)
            when ( 1)  call move$ (ln, a1,  2)
            when ( 2)  call move$ (ln, a2,  2)
            when ( 3)  call move$ (ln, a3,  2)
            when ( 4)  call move$ (ln, a4,  2)
            when ( 5)  call move$ (ln, a5,  2)
            when ( 6)  call move$ (ln, a6,  2)
            when ( 7)  call move$ (ln, a7,  2)
            when ( 8)  call move$ (ln, a8,  2)
            when ( 9)  call move$ (ln, a9,  2)
            when (10)  call move$ (ln, a10, 2)
         else
            too_many_args

         ap += 1
         }


   # decode_varying --- decode a PL/I varying string
      procedure decode_varying {

         get_str

         if (base == 0)
            m = MAXLINE
         else
            m = base

         i = 1

         select (ap)
            when ( 1)  call ctov (tmp, i, a1,  m)
            when ( 2)  call ctov (tmp, i, a2,  m)
            when ( 3)  call ctov (tmp, i, a3,  m)
            when ( 4)  call ctov (tmp, i, a4,  m)
            when ( 5)  call ctov (tmp, i, a5,  m)
            when ( 6)  call ctov (tmp, i, a6,  m)
            when ( 7)  call ctov (tmp, i, a7,  m)
            when ( 8)  call ctov (tmp, i, a8,  m)
            when ( 9)  call ctov (tmp, i, a9,  m)
            when (10)  call ctov (tmp, i, a10, m)
         else
            too_many_args

         ap += 1

         }


   # decode_integer --- decode a short integer
      procedure decode_integer {

         get_str

         if (base == 0)
            base = 10

         i = 1
         l = gctoi (tmp, i, base)
         SKIPBL (tmp, i)

         if (tmp (i) ~= EOS)
            error_in_field

         select (ap)
            when ( 1)  a1 (1) = l
            when ( 2)  a2 (1) = l
            when ( 3)  a3 (1) = l
            when ( 4)  a4 (1) = l
            when ( 5)  a5 (1) = l
            when ( 6)  a6 (1) = l
            when ( 7)  a7 (1) = l
            when ( 8)  a8 (1) = l
            when ( 9)  a9 (1) = l
            when (10)  a10 (1) = l
         else
            too_many_args

         ap += 1
         }


   # decode_longint --- decode a long integer
      procedure decode_longint {

         get_str

         if (base == 0)
            base = 10

         i = 1
         ln = gctol (tmp, i, base)
         SKIPBL (tmp, i)

         if (tmp (i) ~= EOS)
            error_in_field

         select (ap)
            when ( 1)  call move$ (ln, a1, 2)
            when ( 2)  call move$ (ln, a2, 2)
            when ( 3)  call move$ (ln, a3, 2)
            when ( 4)  call move$ (ln, a4, 2)
            when ( 5)  call move$ (ln, a5, 2)
            when ( 6)  call move$ (ln, a6, 2)
            when ( 7)  call move$ (ln, a7, 2)
            when ( 8)  call move$ (ln, a8, 2)
            when ( 9)  call move$ (ln, a9, 2)
            when (10)  call move$ (ln, a10, 2)
         else
            too_many_args

         ap += 1

         }


   # decode_real --- decode a single-precision floating point number
      procedure decode_real {

         get_str

         i = 1
         lr = ctor (tmp, i)
         SKIPBL (tmp, i)
         if (tmp (i) ~= EOS)
            error_in_field

         select (ap)
            when ( 1)  call move$ (lr, a1,  2)
            when ( 2)  call move$ (lr, a2,  2)
            when ( 3)  call move$ (lr, a3,  2)
            when ( 4)  call move$ (lr, a4,  2)
            when ( 5)  call move$ (lr, a5,  2)
            when ( 6)  call move$ (lr, a6,  2)
            when ( 7)  call move$ (lr, a7,  2)
            when ( 8)  call move$ (lr, a8,  2)
            when ( 9)  call move$ (lr, a9,  2)
            when (10)  call move$ (lr, a10, 2)
         else
            too_many_args

         ap += 1

         }


   # decode_double --- decode a double-precision floating point number
      procedure decode_double {

         get_str

         i = 1
         ld = ctod (tmp, i)
         SKIPBL (tmp, i)
         if (tmp (i) ~= EOS)
            error_in_field

         select (ap)
            when ( 1)  call move$ (ld, a1,  4)
            when ( 2)  call move$ (ld, a2,  4)
            when ( 3)  call move$ (ld, a3,  4)
            when ( 4)  call move$ (ld, a4,  4)
            when ( 5)  call move$ (ld, a5,  4)
            when ( 6)  call move$ (ld, a6,  4)
            when ( 7)  call move$ (ld, a7,  4)
            when ( 8)  call move$ (ld, a8,  4)
            when ( 9)  call move$ (ld, a9,  4)
            when (10)  call move$ (ld, a10, 4)
         else
            too_many_args

         ap += 1
         }


   # decode_fill --- skip a specified number of characters
      procedure decode_fill {

         get_str                 # just thrown them away

         }


   # decode_newline --- skip a specified number of NEWLINES
      procedure decode_newline {

         if (width <= 0) {       # skip one newline, if it's there
            if (str (sp) == NEWLINE)
               sp += 1
            }
         else {                  # skip 'width' newlines
            i = 1
            repeat {
               while (str (sp) ~= NEWLINE && str (sp) ~= EOS)
                  sp += 1
               if (str (sp) == NEWLINE)
                  sp += 1
               i += 1
               } until (i > width)
            }
         if (str (sp) == EOS && fmt (fp + 1) ~= EOS) {
            fp += 1
            return (OK)          # get new input line
            }

         }


   # too_many_args --- issue an error message for too many arguments
      procedure too_many_args {

         call remark ("in decode: attempt to use more than 10 fields"p)
         tmp (1) = EOS

         }

   end
