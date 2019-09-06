# lacl --- list acl info

   include ARGUMENT_DEFS

   integer mksacl, gfnarg, gtacl$, expand, gcdir$, equal

   character path (MAXPATH), aclpath (MAXPATH), pairs (MAXACLLIST)
   character xpath (MAXPATH), sep (4)
   integer state (4), type, key, attach_sw
   logical verbose, do_pairs, do_long, do_priority
   ARG_DECL

   string usage "Usage: lacl [-l] [-b [-a]] [-p] [-t] [-c] [-v] {<pathname>}"
   string cant "Cannot list acl for '*s'*n"
   stringtable typei, types, / "specific" / "acat" / "default specific" / _
      "default acat" / "is an acat" / "priority"

   PARSE_COMMAND_LINE ("l<f>a<f>b<f>c<f>p<f>t<f>v<f>n<ign>"s, usage)

   do_long = ARG_PRESENT (l)
   do_priority = ARG_PRESENT (p)
   verbose = ARG_PRESENT (v) | do_long
   do_pairs = ~(ARG_PRESENT (t) | ARG_PRESENT (b))
   do_pairs = do_pairs | do_long | ARG_PRESENT (a)

   if (ARG_PRESENT (c) || do_long)
      call ctoc ("*n"s, sep, 3)
   else
      call ctoc (" "s, sep, 3)

   if (do_priority)
      key = 2
   else
      key = 1


   state (1) = 1
   repeat {
      select (gfnarg (xpath, state))
      when (EOF)
         stop
      when (ERR)
         call error (usage)
      else {
         if (expand (xpath, path, MAXPATH) == ERR)
            call print (ERROUT, cant, xpath)
         elif (gtacl$ (path, key, attach_sw) == ERR)
            call print (ERROUT, cant, xpath)
         elif (mksacl (aclpath, pairs, type, sep) == ERR)
            call print (ERROUT, cant, xpath)
         else {
            if (do_priority)
               type = 5
            if (verbose)
               call print (STDOUT, "*s "s, path)
            if ((do_long || (verbose && ARG_PRESENT (b))) && ~ do_priority)
               call print (STDOUT, "by *s "s, aclpath)
            elif (ARG_PRESENT (b))
               call print (STDOUT, "*s "s, aclpath)
            if (do_long || ARG_PRESENT (t)) {
               if (verbose)
                  call print (STDOUT, " ("s)
               call putlin (types (typei (type + 2)), STDOUT)
               if (verbose)
                  call print (STDOUT, ")"s)
               }
            call print (STDOUT, sep)
            if (do_pairs)
               call print (STDOUT, "*s*n"s, pairs)
            } # end else
         } # end else

      if (attach_sw == YES)
         call follow (EOS, 0)
      } # end repeat

   end
