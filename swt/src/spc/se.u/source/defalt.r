# defalt --- set defaulted line numbers

   subroutine defalt (def1, def2)
   integer def1, def2

   include SE_COMMON

   if (Nlines == 0) {         # no line numbers supplied, use defaults
      Line1 = def1
      Line2 = def2
      }

   return
   end
