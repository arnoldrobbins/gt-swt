# error --- print error message, return error code (for shell progs)

   define (DEFAULT_ERRCODE,1000)    # same as the subprogram 'error'

   character arg (MAXLINE)

   integer ap, i, errcode, firstarg
   integer getarg, ctoi

   errcode = DEFAULT_ERRCODE

   firstarg = 1
   if (getarg (1, arg, MAXLINE) ~= EOF    # test for "-<errcode>"
         && arg (1) == '-'c) {
      i = 2
      errcode = ctoi (arg, i)
      if (arg (i) == EOS)
         firstarg = 2
      else
         errcode = DEFAULT_ERRCODE
      }

   for (ap = firstarg; getarg (ap, arg, MAXLINE) ~= EOF; ap += 1) {
      if (ap ~= firstarg)
         call putch (' 'c, ERROUT)
      call putlin (arg, ERROUT)
      }

   if (ap > firstarg)
      call putch (NEWLINE, ERROUT)

   call seterr (errcode)

   stop
   end
