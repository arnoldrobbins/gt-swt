# gvlarg --- obtain the value of a key-letter argument

   integer function gvlarg (str, state)
   character str (ARB)
   integer state (4)

   integer getarg

   repeat {

      select (state (1))
      when (1) {
         state (1) = 2        # new state
         state (2) = 1        # next argument
         state (3) = ERR      # current input file
         state (4) = 0        # input file count
         }

      when (2) {
         if (getarg (state (2), str, MAXARG) ~= EOF) {
            state (1) = 2     # stay in same state
            if (str (1) == "-"c)
               str (1) = EOS
            else
               state (2) += 1
            return (OK)
            }
         state (1) = 4     # EOF state
         }

      when (3) {
         str (1) = EOS
         return (OK)
         }

      when (4, 5)
         break

      else
         call error ("in gvlarg:  bad state (1) value*n"p)

      } # end of infinite repeat

   str (1) = EOS
   return (EOF)
   end
