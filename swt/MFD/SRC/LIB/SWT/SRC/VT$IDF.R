# vt$idf --- invoke the definition of a user-defined key

   integer function vt$idf (c)
   character c

   include SWT_COMMON

   integer i, lim

   Nesting_count += 1
   if (Nesting_count > MAXNEST) {
      call vt$err ("Attempted infinite recursion"s)
      return (ERR)
      }

   lim = c - DEFINITION + 1
   for (i = lim; Def_buf (i) ~= EOS; i += 1)
      ;
   for ({i -= 1; Pb_ptr += 1}; i >= lim && Pb_ptr < MAXPB;
                      {i -= 1; Pb_ptr += 1})
      Pb_buf (Pb_ptr) = Def_buf (i)
   if (Pb_ptr >= MAXPB) {
      call vt$err ("Definition too long"s)
      return (ERR)
      }

   Pb_ptr -= 1
   return (OK)
   end
