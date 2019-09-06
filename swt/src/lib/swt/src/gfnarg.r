# gfnarg --- get the next file name from the argument list

   integer function gfnarg (name, state)
   character name (MAXPATH)
   integer state (4)

   integer l
   integer getarg, open, getlin

   string in1 "/dev/stdin1"
   string in2 "/dev/stdin2"
   string in3 "/dev/stdin3"

   procedure process_next_arg forward

   repeat {

      select (state (1))
      when (1) {
         state (1) = 2        # new state
         state (2) = 1        # next argument
         state (3) = ERR      # current input file
         state (4) = 0        # file argument count
         }

      when (2) {
         if (getarg (state (2), name, MAXARG) ~= EOF) {
            state (1) = 2     # stay in same state
            state (2) += 1    # bump argument count

            process_next_arg  # may return on its own
            }
         else
            state (1) = 4     # EOF state
         }

      when (3) {
         l = getlin (name, state (3))
         if (l ~= EOF) {
            name (l) = EOS
            return (OK)
            }
         if (state (3) > 0)
            call close (state (3))
         state (1) = 2
         }

      when (4) {
         state (1) = 5
         if (state (4) == 0) {# no file arguments
            call scopy (in1, 1, name, 1)
            return (OK)
            }
         break
         }

      when (5)
         break

      else
         call error ("in gfnarg:  bad state (1) value"p)

      } # end of infinite repeat

   name (1) = EOS
   return (EOF)



   procedure process_next_arg {

      select
         when (name (1) ~= '-'c) {
            state (4) += 1    # bump file argument count
            return (OK)
            }
         when (name (2) == EOS) {
            call scopy (in1, 1, name, 1)
            state (4) += 1    # bump file argument count
            return (OK)
            }
         when (name (2) == '1'c && name (3) == EOS) {
            call scopy (in1, 1, name, 1)
            state (4) += 1    # bump file argument count
            return (OK)
            }
         when (name (2) == '2'c && name (3) == EOS) {
            call scopy (in2, 1, name, 1)
            state (4) += 1    # bump file argument count
            return (OK)
            }
         when (name (2) == '3'c && name (3) == EOS) {
            call scopy (in3, 1, name, 1)
            state (4) += 1    # bump file argument count
            return (OK)
            }

         when (name (2) == 'n'c || name (2) == 'N'c) {
            state (1) = 3           # new state
            state (4) += 1          # bump file argument count
            select
               when (name (3) == EOS)
                  state (3) = STDIN1
               when (name (3) == '1'c && name (4) == EOS)
                  state (3) = STDIN1
               when (name (3) == '2'c && name (4) == EOS)
                  state (3) = STDIN2
               when (name (3) == '3'c && name (4) == EOS)
                  state (3) = STDIN3
            else {
               state (3) = open (name (3), READ)
               if (state (3) == ERR) {
                  call print (ERROUT, "*s: can't open*n"p, name)
                  state (1) = 2
                  }
               }
            }
         else
            return (ERR)
      }

   end
