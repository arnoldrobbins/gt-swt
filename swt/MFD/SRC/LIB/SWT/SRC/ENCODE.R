# encode --- formatted memory-to-memory conversion routine

   integer function encode (str, max, fmt,
               a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
   character str (ARB)
   integer max, fmt (ARB), a1 (ARB), a2 (ARB), a3 (ARB), a4 (ARB),
      a5 (ARB), a6 (ARB), a7 (ARB), a8 (ARB), a9 (ARB), a10 (ARB)

   integer i, arg, cur, max_cur, num, m, l,
      default_width, default_base, default_fill
   integer width, rjust, base, fill
   integer ptoc, ctoc, gitoc, gltoc, rtoc, dtoc, vtoc, atoc, ctoi
   character term, tmp (MAXLINE)

   procedure interpret_format forward
   procedure get_num forward
   procedure convert_num forward
   procedure fill_field (len) forward
   procedure putstr forward
   procedure encode_packed forward
   procedure encode_string forward
   procedure encode_bool forward
   procedure encode_yesno forward
   procedure encode_tab forward
   procedure encode_addr forward
   procedure encode_varying forward
   procedure encode_integer forward
   procedure encode_longint forward
   procedure encode_real forward
   procedure encode_double forward
   procedure encode_newline forward
   procedure too_many_args forward

   define (putchar (x), {str (cur) = x; cur += 1})

   arg = 1
   cur = 1
   max_cur = 1
   default_width = 0
   default_base = 0
   default_fill = ' 'c

   for (i = 1; fmt (i) ~= EOS && cur < max; i += 1) {

      if (fmt (i) ~= FORMATFLAG)
         putchar (fmt (i))

      else {
         interpret_format
         select (fmt (i))
            when (GOTOFORM)
               arg = width
            when (DEFAULTFORM) {
               default_width = width
               default_base = base
               default_fill = fill
               }
            when (BOOLFORM)
               encode_bool
            when (YESNOFORM)
               encode_yesno
            when (TABFORM)
               encode_tab
            when (ADDRFORM)
               encode_addr
            when (PACKEDSTRINGFORM) {
               term = '.'c
               encode_packed
               }
            when (HOLLERITHFORM) {
               term = EOS
               encode_packed
               }
            when (STRINGFORM)
               encode_string
            when (CHARFORM) {          # compatibility only
               base = 1
               encode_string
               }
            when (VARYINGFORM)
               encode_varying
            when (INTFORM)
               encode_integer
            when (RCINTFORM) {         # compatibility only
               base = -base
               encode_integer
               }
            when (LONGINTFORM)
               encode_longint
            when (RCLONGINTFORM) {     # compatibility only
               base = -base
               encode_longint
               }
            when (REALFORM)
               encode_real
            when (FLOATFORM, DOUBLEFORM)
               encode_double
            when (NLINE)
               encode_newline
            when (FILLFORM)
               fill_field (width)
         else
            putchar (fmt (i))
         }
      }

   if (max_cur > cur)
      cur = max_cur
   str (cur) = EOS
   return (cur - 1)


   # interpret_format --- interpret and set the flags for the format
      procedure interpret_format {

         ### Get width:
         i += 1
         if (fmt (i) == ','c || IS_LETTER (fmt (i)))  # default
            width = default_width
         else if (fmt (i) == '#'c) {                  # indirect
            get_num
            i += 1
            width = num
            }
         else {                                       # specified
            convert_num
            width = num
            }

         if (width >= 0)               # Get rjust
            rjust = NO
         else {
            rjust = YES
            width = -width
            }

         ### Get base:
         if (fmt (i) ~= ','c)          # no more format specs
            base = default_base
         else {
            i += 1
            if (fmt (i) == ','c || IS_LETTER (fmt (i)))  # default
               base = default_base
            else if (fmt (i) == '#'c) {                  # indirect
               get_num
               i += 1
               base = num
               }
            else {                                       # specified
               convert_num
               base = num
               }
            }

         ### Get fill character:
         if (fmt (i) ~= ','c)          # no more format specs
            fill = default_fill
         elif (fmt (i + 1) ~= '#'c) {  # not indirect
            fill = fmt (i + 1)
            i += 2
            }
         elif (fmt (i + 2) == '#'c) {  # double "#"
            fill = '#'c
            i += 3
            }
         else {                        # indirect
            get_num
            fill = num
            i += 2
            }

         }


   # get_num --- grab a number from the argument list; put in 'num'
      procedure get_num {

         select (arg)
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

         arg += 1

         }

   # convert_num --- grab a number from the format string; put in 'num'
      procedure convert_num {

         bool neg

         neg = (fmt (i) == '-'c)
         if (fmt (i) == '+'c || fmt (i) == '-'c)
            i += 1

         num = ctoi (fmt, i)
         if (neg)
            num = - num

         }


   # putstr --- put the string in 'tmp' into 'str' at 'cur'
      procedure putstr {

         cur += ctoc (tmp, str (cur), max - cur + 1)

         }


   # fill_field --- output 'len' fill character, but don't overflow 'str'
      procedure fill_field (len) {
      integer len

         local i
         integer i

         for (i = 1; i <= len && cur < max; {cur += 1; i += 1})
            str (cur) = fill

         }


   # encode_packed --- encode a packed string
      procedure encode_packed {

         if (rjust == NO) {
            m = max - cur + 1
            if (base ~= 0 && base + 1 < m)
               m = base + 1

            select (arg)
               when ( 1)  l = ptoc (a1,  term, str (cur), m)
               when ( 2)  l = ptoc (a2,  term, str (cur), m)
               when ( 3)  l = ptoc (a3,  term, str (cur), m)
               when ( 4)  l = ptoc (a4,  term, str (cur), m)
               when ( 5)  l = ptoc (a5,  term, str (cur), m)
               when ( 6)  l = ptoc (a6,  term, str (cur), m)
               when ( 7)  l = ptoc (a7,  term, str (cur), m)
               when ( 8)  l = ptoc (a8,  term, str (cur), m)
               when ( 9)  l = ptoc (a9,  term, str (cur), m)
               when (10)  l = ptoc (a10, term, str (cur), m)
            else
               too_many_args

            cur += l
            fill_field (width - l)
            }

         else {
            if (base == 0 || base + 1 >= MAXLINE)
               m = MAXLINE
            else
               m = base + 1

            select (arg)
               when ( 1)  l = ptoc (a1,  term, tmp, m)
               when ( 2)  l = ptoc (a2,  term, tmp, m)
               when ( 3)  l = ptoc (a3,  term, tmp, m)
               when ( 4)  l = ptoc (a4,  term, tmp, m)
               when ( 5)  l = ptoc (a5,  term, tmp, m)
               when ( 6)  l = ptoc (a6,  term, tmp, m)
               when ( 7)  l = ptoc (a7,  term, tmp, m)
               when ( 8)  l = ptoc (a8,  term, tmp, m)
               when ( 9)  l = ptoc (a9,  term, tmp, m)
               when (10)  l = ptoc (a10, term, tmp, m)
            else
               too_many_args

            fill_field (width - l)
            putstr
            }

         arg += 1

         }


   # encode_string --- encode an EOS-terminated string
      procedure encode_string {

         if (rjust == NO) {
            m = max - cur + 1
            if (base ~= 0 && base + 1 < m)
               m = base + 1

            select (arg)
               when ( 1)  l = ctoc (a1,  str (cur), m)
               when ( 2)  l = ctoc (a2,  str (cur), m)
               when ( 3)  l = ctoc (a3,  str (cur), m)
               when ( 4)  l = ctoc (a4,  str (cur), m)
               when ( 5)  l = ctoc (a5,  str (cur), m)
               when ( 6)  l = ctoc (a6,  str (cur), m)
               when ( 7)  l = ctoc (a7,  str (cur), m)
               when ( 8)  l = ctoc (a8,  str (cur), m)
               when ( 9)  l = ctoc (a9,  str (cur), m)
               when (10)  l = ctoc (a10, str (cur), m)
            else
               too_many_args

            cur += l
            fill_field (width - l)
            }

         else {
            if (base == 0 || base + 1 >= MAXLINE)
               m = MAXLINE
            else
               m = base + 1

            select (arg)
               when ( 1)  l = ctoc (a1,  tmp, m)
               when ( 2)  l = ctoc (a2,  tmp, m)
               when ( 3)  l = ctoc (a3,  tmp, m)
               when ( 4)  l = ctoc (a4,  tmp, m)
               when ( 5)  l = ctoc (a5,  tmp, m)
               when ( 6)  l = ctoc (a6,  tmp, m)
               when ( 7)  l = ctoc (a7,  tmp, m)
               when ( 8)  l = ctoc (a8,  tmp, m)
               when ( 9)  l = ctoc (a9,  tmp, m)
               when (10)  l = ctoc (a10, tmp, m)
            else
               too_many_args

            fill_field (width - l)
            putstr
            }

         arg += 1

         }


   # encode_bool --- encode a boolean value
      procedure encode_bool {

         select (arg)
            when ( 1)  l = a1 (1)
            when ( 2)  l = a2 (1)
            when ( 3)  l = a3 (1)
            when ( 4)  l = a4 (1)
            when ( 5)  l = a5 (1)
            when ( 6)  l = a6 (1)
            when ( 7)  l = a7 (1)
            when ( 8)  l = a8 (1)
            when ( 9)  l = a9 (1)
            when (10)  l = a10 (1)
         else
            too_many_args

         if (rjust == NO) {
            m = max - cur + 1
            if (base ~= 0 && base + 1 < m)
               m = base + 1

            if (l ~= 0)    # true
               l = ctoc ("TRUE"s, str (cur), m)
            else
               l = ctoc ("FALSE"s, str (cur), m)

            cur += l
            fill_field (width - l)
            }

         else {
            if (base == 0 || base + 1 >= MAXLINE)
               m = MAXLINE
            else
               m = base + 1

            if (l == 1)    # true
               l = ctoc ("TRUE"s, tmp, m)
            else
               l = ctoc ("FALSE"s, tmp, m)

            fill_field (width - l)
            putstr
            }

         arg += 1

         }


   # encode_yesno --- encode a YES/NO value
      procedure encode_yesno {

         select (arg)
            when ( 1)  l = a1 (1)
            when ( 2)  l = a2 (1)
            when ( 3)  l = a3 (1)
            when ( 4)  l = a4 (1)
            when ( 5)  l = a5 (1)
            when ( 6)  l = a6 (1)
            when ( 7)  l = a7 (1)
            when ( 8)  l = a8 (1)
            when ( 9)  l = a9 (1)
            when (10)  l = a10 (1)
         else
            too_many_args

         if (rjust == NO) {
            m = max - cur + 1
            if (base ~= 0 && base + 1 < m)
               m = base + 1

            if (l == YES)
               l = ctoc ("YES"s, str (cur), m)
            elif (l == NO)
               l = ctoc ("NO"s, str (cur), m)
            else
               l = ctoc ("?"s, str (cur), m)

            cur += l
            fill_field (width - l)
            }

         else {
            if (base == 0 || base + 1 >= MAXLINE)
               m = MAXLINE
            else
               m = base + 1

            if (l == YES)
               l = ctoc ("YES"s, tmp, m)
            elif (l == NO)
               l = ctoc ("NO"s, tmp, m)
            else
               l = ctoc ("?"s, tmp, m)

            fill_field (width - l)
            putstr
            }

         arg += 1

         }


   # encode_tab --- handle tab formats
      procedure encode_tab {

         if (cur > max_cur)
            max_cur = cur
         for ( ; max_cur < width && max_cur < max; max_cur += 1)
            str (max_cur) = fill
         cur = width

         }


   # encode_addr --- encode an address
      procedure encode_addr {

         select (arg)
            when ( 1)  l = atoc (a1,  tmp, MAXLINE)
            when ( 2)  l = atoc (a2,  tmp, MAXLINE)
            when ( 3)  l = atoc (a3,  tmp, MAXLINE)
            when ( 4)  l = atoc (a4,  tmp, MAXLINE)
            when ( 5)  l = atoc (a5,  tmp, MAXLINE)
            when ( 6)  l = atoc (a6,  tmp, MAXLINE)
            when ( 7)  l = atoc (a7,  tmp, MAXLINE)
            when ( 8)  l = atoc (a8,  tmp, MAXLINE)
            when ( 9)  l = atoc (a9,  tmp, MAXLINE)
            when (10)  l = atoc (a10, tmp, MAXLINE)
         else
            too_many_args

         if (rjust == NO) {
            fill_field (width - l)
            putstr
            }
         else {
            putstr
            fill_field (width - l)
            }
         arg += 1

         }


   # encode_varying --- encode a PL/I varying string
      procedure encode_varying {

         if (rjust == NO) {
            m = max - cur + 1
            if (base ~= 0 && base + 1 < m)
               m = base + 1

            select (arg)
               when ( 1)  l = vtoc (a1,  str (cur), m)
               when ( 2)  l = vtoc (a2,  str (cur), m)
               when ( 3)  l = vtoc (a3,  str (cur), m)
               when ( 4)  l = vtoc (a4,  str (cur), m)
               when ( 5)  l = vtoc (a5,  str (cur), m)
               when ( 6)  l = vtoc (a6,  str (cur), m)
               when ( 7)  l = vtoc (a7,  str (cur), m)
               when ( 8)  l = vtoc (a8,  str (cur), m)
               when ( 9)  l = vtoc (a9,  str (cur), m)
               when (10)  l = vtoc (a10, str (cur), m)
            else
               too_many_args

            cur += l
            fill_field (width - l)
            }

         else {
            if (base == 0 || base + 1 >= MAXLINE)
               m = MAXLINE
            else
               m = base + 1

            select (arg)
               when ( 1)  l = vtoc (a1,  tmp, m)
               when ( 2)  l = vtoc (a2,  tmp, m)
               when ( 3)  l = vtoc (a3,  tmp, m)
               when ( 4)  l = vtoc (a4,  tmp, m)
               when ( 5)  l = vtoc (a5,  tmp, m)
               when ( 6)  l = vtoc (a6,  tmp, m)
               when ( 7)  l = vtoc (a7,  tmp, m)
               when ( 8)  l = vtoc (a8,  tmp, m)
               when ( 9)  l = vtoc (a9,  tmp, m)
               when (10)  l = vtoc (a10, tmp, m)
            else
               too_many_args

            fill_field (width - l)
            putstr
            }

         arg += 1

         }


   # encode_integer --- encode and justify an integer
      procedure encode_integer {

         select (arg)
            when ( 1)  l = gitoc (a1,  tmp, MAXLINE, base)
            when ( 2)  l = gitoc (a2,  tmp, MAXLINE, base)
            when ( 3)  l = gitoc (a3,  tmp, MAXLINE, base)
            when ( 4)  l = gitoc (a4,  tmp, MAXLINE, base)
            when ( 5)  l = gitoc (a5,  tmp, MAXLINE, base)
            when ( 6)  l = gitoc (a6,  tmp, MAXLINE, base)
            when ( 7)  l = gitoc (a7,  tmp, MAXLINE, base)
            when ( 8)  l = gitoc (a8,  tmp, MAXLINE, base)
            when ( 9)  l = gitoc (a9,  tmp, MAXLINE, base)
            when (10)  l = gitoc (a10, tmp, MAXLINE, base)
         else
            too_many_args

         if (rjust == NO) {
            fill_field (width - l)
            putstr
            }
         else {
            putstr
            fill_field (width - l)
            }
         arg += 1

         }


   # encode_longint --- encode and justify an long integer
      procedure encode_longint {

         select (arg)
            when ( 1)  l = gltoc (a1,  tmp, MAXLINE, base)
            when ( 2)  l = gltoc (a2,  tmp, MAXLINE, base)
            when ( 3)  l = gltoc (a3,  tmp, MAXLINE, base)
            when ( 4)  l = gltoc (a4,  tmp, MAXLINE, base)
            when ( 5)  l = gltoc (a5,  tmp, MAXLINE, base)
            when ( 6)  l = gltoc (a6,  tmp, MAXLINE, base)
            when ( 7)  l = gltoc (a7,  tmp, MAXLINE, base)
            when ( 8)  l = gltoc (a8,  tmp, MAXLINE, base)
            when ( 9)  l = gltoc (a9,  tmp, MAXLINE, base)
            when (10)  l = gltoc (a10, tmp, MAXLINE, base)
         else
            too_many_args

         if (rjust == NO) {
            fill_field (width - l)
            putstr
            }
         else {
            putstr
            fill_field (width - l)
            }
         arg += 1

         }


   # encode_real --- encode a single-precision floating point number
      procedure encode_real {

         if (base == 0)
            base = 100

         if (base > 14 || base < 0 || width == 0)
            m = MAXLINE - 1
         else
            m = base + 20

         select (arg)
            when ( 1)  l = rtoc (a1,  tmp, m, base)
            when ( 2)  l = rtoc (a2,  tmp, m, base)
            when ( 3)  l = rtoc (a3,  tmp, m, base)
            when ( 4)  l = rtoc (a4,  tmp, m, base)
            when ( 5)  l = rtoc (a5,  tmp, m, base)
            when ( 6)  l = rtoc (a6,  tmp, m, base)
            when ( 7)  l = rtoc (a7,  tmp, m, base)
            when ( 8)  l = rtoc (a8,  tmp, m, base)
            when ( 9)  l = rtoc (a9,  tmp, m, base)
            when (10)  l = rtoc (a10, tmp, m, base)
         else
            too_many_args

         if (rjust == YES) {
             if (base < 0 && tmp (1) ~= '-'c) {
               putchar (fill)
               l += 1
               }
            putstr
            fill_field (width - l)
            }
         else if (base >= 0) {
            fill_field (width - l)
            putstr
            }
         else {
            fill_field (width + base - 8)
            if (tmp (1) ~= '-'c) {
               putchar (fill)
               l += 1
               }
            putstr
            fill_field (-base + 7 - l)
            }
         arg += 1

         }


   # encode_double --- encode a double-precision floating point number
      procedure encode_double {

         if (base == 0)
            base = 100

         if (base > 14 || base < 0 || width == 0)
            m = MAXLINE - 1
         else
            m = base + 20

         select (arg)
            when ( 1)  l = dtoc (a1,  tmp, m, base)
            when ( 2)  l = dtoc (a2,  tmp, m, base)
            when ( 3)  l = dtoc (a3,  tmp, m, base)
            when ( 4)  l = dtoc (a4,  tmp, m, base)
            when ( 5)  l = dtoc (a5,  tmp, m, base)
            when ( 6)  l = dtoc (a6,  tmp, m, base)
            when ( 7)  l = dtoc (a7,  tmp, m, base)
            when ( 8)  l = dtoc (a8,  tmp, m, base)
            when ( 9)  l = dtoc (a9,  tmp, m, base)
            when (10)  l = dtoc (a10, tmp, m, base)
         else
            too_many_args

         if (rjust == YES) {
             if (base < 0 && tmp (1) ~= '-'c) {
               putchar (fill)
               l += 1
               }
            putstr
            fill_field (width - l)
            }
         else if (base >= 0) {
            fill_field (width - l)
            putstr
            }
         else {
            fill_field (width + base - 8)
            if (tmp (1) ~= '-'c) {
               putchar (fill)
               l += 1
               }
            putstr
            fill_field (-base + 7 - l)
            }
         arg += 1

         }


   # encode_newline --- insert a specified number of NEWLINES
      procedure encode_newline {

         repeat {
            putchar (NEWLINE)
            width -= 1
            } until (width <= 0 || cur >= max)

         }


   # too_many_args --- issue an error message for too many arguments
      procedure too_many_args {

         call remark ("in encode: attempt to use more than 10 fields"p)
         tmp (1) = EOS

         }

   undefine (putchar)

   end
