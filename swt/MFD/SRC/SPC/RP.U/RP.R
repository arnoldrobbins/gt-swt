# rp --- Ratfor preprocessor

   include "rp_com.i"

   integer i, j, infd, outfd, argstatus, state (4)
   integer getarg, open, create, gfnarg, length, mapdn
   character inf (MAXLINE), outf (MAXLINE)

   PARSE_COMMAND_LINE ("-abcdefghlmpstvy -o<rs> -n<ign> -x<rs>"s, _
      "Usage: rp [-abcdefghlmpstvy] [-o <outf>] [-x <ttable>] {<inf>}"p)

   call initialize            # open temporary files -- remember to call
                              # cleanup to close them if there's an error

   if (~ARG_PRESENT (f)) {      # F option not present
      call putback (NEWLINE)        # Remember -- putbacks go in backwards
      call putback ("'"c)
      call putback_str (DEFINEFILE)
      call putback ("'"c)
      call putback_str ("include "s)
      }

   argstatus = getarg (1, outf, MAXLINE)

   if (ARG_PRESENT (o))
      call ctoc (ARG_TEXT (o), outf, MAXLINE)
   else if (argstatus == EOF || outf (1) == '-'c)
      call ctoc ("/dev/stdout1"s, outf, MAXLINE)
   else {
      i = length (outf)          # build a name ourselves
      while (i >= 1 && outf (i) ~= '/'c)
         i -= 1
      for (j = i + 1; j < i + 31 && outf (j) ~= EOS; j += 1)
         if (outf (j) == '.'c & mapdn (outf (j + 1)) == 'r'c &
             outf (j + 2) == EOS)
            break
      call scopy (".f"s, 1, outf, j)
      }

   outfd = create (outf, WRITE)
   if (outfd == ERR) {
      call cleanup
      call cant (outf)
      }

   state (1) = 1
   while (gfnarg (inf, state) ~= EOF) {
      infd = open (inf, READ)
      if (infd == ERR)
         call print (ERROUT, "*s: can't open*n"p, inf)
      else {
         call process (infd, outfd)
         call close (infd)
         }
      }

   call end_program

   if (First_stmt == YES)
      SYNERR ("Missing 'end' statement"p)

   if (~ ARG_PRESENT (d))
      call list_long_names (outfd)
   call cleanup
   call close (outfd)


   stop
   end



# process --- convert Ratfor code on file 'fin' to Fortran on 'fout'

   subroutine process (fin, fout)
   file_des fin, fout

   include "rp_com.i"

   parse_state state

   Level = 1
   Infile (Level) = fin
   Line_number (Level) = 0
   Fortfile = fout
   Outfile (1) = fout         # set up temporary #1

   call getsym
   repeat {
      while (Symbol == '}'c) {         # check for error
         SYNERR ("Unmatched }"p)
         call getsym
         }
      call ratfor_code (state)
      if (state == FAILURE)
         SYNERR ("PARSER FAILURE -- HELP!!"p)
      } until (Symbol == EOF)

  # Note that code is flushed from the work files by
  # the 'end' statement at the end of each module.

   return
   end



# list_long_names --- output a table listing long variable names

   subroutine list_long_names (fd)
   integer fd

   include "rp_com.i"

   integer sctabl
   pointer posn
   character lname (MAXTOK)
   untyped info (SYMINFOSIZE)

   call print (fd, "C ---- Long Name Map ----*n"s)

   posn = 0
   while (sctabl (Idtable, lname, info, posn) ~= EOF) {

      if (info (SYMBOLTYPE) ~= LNAME_SYMBOLTYPE)
         next

      call print (fd, "C *30s *s*n"s, lname, Mem (info (SYMBOLDATA)))
      }

   return
   end
