# dosopt --- set source language-related options

   integer function dosopt (lin)
   character lin (ARB)

   include SE_COMMON

   character lang (8)
   integer i
   integer strbsr

   string_table lpos, ltxt
      /  1, "" _
      /  2, "f" _
      /  2, "f77" _
      /  2, "ftn" _
      /  3, "pma" _
      /  3, "s"

   i = 1
   call getwrd (lin, i, lang, 8)
   if (lin (i) ~= NEWLINE)
      return (ERR)

   call mapstr (lang, LOWER)

   i = strbsr (lpos, ltxt, 1, lang)
   if (i == EOF) {
      Errcode = ENOLANG
      return (ERR)
      }

   select (ltxt (lpos (i)))
      when (1) {  # restore defaults
         Warncol = 74
         Rel_a = 'A'c
         Rel_z = 'Z'c
         Invert_case = NO
         call scopy ("+3"s, 1, Tabstr, 1)
         call settab (Tabstr)
         }
      when (2) {  # Fortran
         Warncol = 72
         Rel_a = 'a'c
         Rel_z = 'z'c
         Invert_case = YES
         call scopy ("7+3"s, 1, Tabstr, 1)
         call settab (Tabstr)
         }
      when (3) {  # PMA
         Warncol = 72
         Rel_a = 'a'c
         Rel_z = 'z'c
         Invert_case = YES
         call scopy ("13 22 37+3"s, 1, Tabstr, 1)
         call settab (Tabstr)
         }

   return (OK)
   end
