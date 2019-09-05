# c1 --- first pass of C compiler

   include "c1_com.r.i"

   integer ap, i, infd, state (4)
   integer open, create, gfnarg, length, getarg, ctoc
   character inf (MAXLINE), outf (MAXLINE), fname (MAXLINE), arg (MAXARG)
   character mapdn

   string Version "V1.1"

   PARSE_COMMAND_LINE ("[-afguy] [-d<ign>] [-i<ign>]"s,
      "Usage: cc [-afguy] { -I<dir> | -D<name>[=<val>] } <inf>"p)

   Dir_top = 0
   for (ap = 1; getarg (ap, arg, MAXARG) ~= EOF; ap += 1)
      if (arg (1) == '-'c && mapdn (arg (2)) == 'i'c) {
         if (arg (3) ~= EOS) {
            Dir_top += 1 + ctoc (arg (3), Dir_name (Dir_top + 1), MAXDIR - Dir_top)
            if (Dir_top >= MAXDIR)
               call error ("Too many -I directories!"p)
            call delarg (ap)
            ap -= 1
            }
         else {
            call delarg (ap)
            if (getarg (ap, arg, MAXARG) == EOF)
               call error ("Directory name expected"p)
            Dir_top += 1 + ctoc (arg (1), Dir_name (Dir_top + 1), MAXDIR - Dir_top)
            if (Dir_top >= MAXDIR)
               call error ("Too many -I directories!"p)
            call delarg (ap)
            ap -= 1
            }
         }

   Dfo_top = 0
   for (ap = 1; getarg (ap, arg, MAXARG) ~= EOF; ap += 1)
      if (arg (1) == '-'c && mapdn (arg (2)) == 'd'c) {
         if (arg (3) ~= EOS) {
            Dfo_top += 1 + ctoc (arg (3), Dfo_name (Dfo_top + 1), MAXDFO - Dfo_top)
            if (Dfo_top >= MAXDFO)
               call error ("Too many -D arguments!"p)
            call delarg (ap)
            ap -= 1
            }
         else {
            call delarg (ap)
            if (getarg (ap, arg, MAXARG) == EOF)
               call error ("Identifier expected after -D"p)
            Dfo_top += 1 + ctoc (arg (1), Dfo_name (Dfo_top + 1), MAXDFO - Dfo_top)
            if (Dfo_top >= MAXDFO)
               call error ("Too many -D arguments!"p)
            call delarg (ap)
            ap -= 1
            }
         }
   state (1) = 1
   while (gfnarg (fname, state) ~= EOF) {

      call mapstr (fname, LOWER)
      i = length (fname) - 1
      if (fname (i) == '.'c && fname (i + 1) == 'c'c && fname (i + 2) == EOS)
         fname (i) = EOS
      if (fname (1) == '/'c && fname (2) == 'd'c && fname (3) == 'e'c
            && fname (4) == 'v'c && fname (5) == '/'c) {
         call ctoc (fname, inf, MAXLINE)
         fname (1) = EOS
         }
      else
         call encode (inf, MAXLINE, "*s.c"s, fname)
      infd = open (inf, READ)
      if (infd == ERR) {
         call print (ERROUT, "*s: can't open*n"p, inf)
         next
         }

      if (ARG_PRESENT(y)) {
         call encode (outf, MAXLINE, "*s.ck"s, fname)
         Ckfile = create (outf, WRITE)
         if (Ckfile == ERR) {
            call close (infd)
            call print (ERROUT, "*s: can't open*n"p, outf)
            next
            }
         }

      for (Outfp = 1; Outfp <= MAXSTREAMS; Outfp += 1) {
         call encode (outf, MAXLINE, "*s.ct*i"s, fname, Outfp)
         OUTFILE = create (outf, WRITE)
         if (OUTFILE == ERR) {
            call print (ERROUT, "*s: can't open*n"p, outf)
            for (Outfp -= 1; Outfp > 0; Outfp -= 1)
               call close (OUTFILE)
            if (ARG_PRESENT (y))
               call close (Ckfile)
            call close (infd)
            next 2
            }
         }

      call initialize
      call ctoc (inf, Module_name, MAXTOK)
      call process (infd)

#     call print (STDOUT, "[*4,10,0i ERRORS GT-C *s]*n"s, Nerrs, Version)

      if (ARG_PRESENT (a) && Nerrs > 0)
         call seterr (1000)

      call close (infd)
      if (ARG_PRESENT (y))
         call close (Ckfile)

      SETSTREAM (INTDEFSTREAM)
      call out_oper (NULL_OP)
      SETSTREAM (ENTSTREAM)
      call out_oper (NULL_OP)
      SETSTREAM (EXTDEFSTREAM)
      call out_oper (NULL_OP)
      for (i = 1; i <= MAXSTREAMS; i += 1)
         call close (OUTFILE)
      }

   stop
   end


# process --- convert C code on file 'fin' to PMA 'fout'

   subroutine process (fin)
   file_des fin

   include "c1_com.r.i"

   parse_state state

   if (~ARG_PRESENT (f)) {        #  -f option not present
      call putback (NEWLINE)      # remember -- putbacks go in backwards
      call putback ("'"c)
      call putback_str (DEFINEFILE)
      call putback ("'"c)
      call putback_str ("#include "s)
      }

   Level = 1
   Infile (Level) = fin
   Line_number (Level) = 0

   call getsym
   call getsym
   while (Symbol == ';'c)
      call getsym

   SETSTREAM (INTDEFSTREAM)
   call out_oper (MODULE_OP)
   SETSTREAM (ENTSTREAM)
   call out_oper (MODULE_OP)
   SETSTREAM (EXTDEFSTREAM)
   call out_oper (MODULE_OP)

   repeat {
      call external_definition (state)
      if (state == FAILURE)
         SYNERR ("Parser failure"p)
      while (Symbol == ';'c)
         call getsym
      } until (Symbol == EOF)

   call out_declarations

   SETSTREAM (INTDEFSTREAM)
   call out_oper (NULL_OP)
   SETSTREAM (ENTSTREAM)
   call out_oper (NULL_OP)
   SETSTREAM (EXTDEFSTREAM)
   call out_oper (NULL_OP)

   DBG (19, call dump_sym (1))
   DBG (32, call dump_mode)

   call clean_up_ll

   return
   end
