# xref --- cross reference generator for Ratfor programs

   filedes ifd, tfd1, tfd2
   filedes open, mktemp
   integer state (4)
   integer gfnarg, gklarg
   character name (MAXPATH)

   include XREF_COMMON

   PARSE_COMMAND_LINE ("bilpu"s,
                  "Usage: xref {-{b | i | l | p | u}} {<file>}"p)

   call init_cross_ref

   tfd1 = mktemp (READWRITE)
   tfd2 = mktemp (READWRITE)
   if (tfd1 == ERR || tfd2 == ERR)
      call error ("can't create temporary files"p)

   state (1) = 1              # initialize for 'gfnarg'
   repeat {
      select (gfnarg (name, state))
         when (EOF)
            break
         when (OK) {
            ifd = open (name, READ)
            if (ifd == ERR)
               call print (ERROUT, "*s: can't open*n"p, name)
            else {
               call build_cross_ref (ifd, tfd1)
               call close (ifd)
               if (ARG_PRESENT (p))
                  call putch (FF, STDOUT)
               }
            }
         when (ERR)
            call print (ERROUT, "*s: can't open*n"p, name)
      } # end of infinite repeat

   call rewind (tfd1)
   call sort (tfd1, tfd2)
   call rmtemp (tfd1)
   call print_cross_ref (tfd2, STDOUT)
   call rmtemp (tfd2)

   stop
   end



# init_cross_ref --- initialize cross reference program

   subroutine init_cross_ref

   include XREF_COMMON

   integer i

  # Input buffer:
   Ibp = PBLIMIT
   Inbuf (Ibp) = EOS

  # Output buffer:
   Outp = 1
   Out_line = 1
   Out_width = 76

  # Dynamic storage area:
   call dsinit (MEMSIZE)

  # Identifier table:
   Id_table = mktabl (SYMINFOSIZE)

  # Ratfor reserved words:
   call enter_kw ("string"s)
   call enter_kw ("linkage"s)
   call enter_kw ("procedure"s)
   call enter_kw ("recursive"s)
   call enter_kw ("forward"s)
   call enter_kw ("local"s)
   call enter_kw ("if"s)
   call enter_kw ("else"s)
   call enter_kw ("for"s)
   call enter_kw ("while"s)
   call enter_kw ("repeat"s)
   call enter_kw ("until"s)
   call enter_kw ("case"s)
   call enter_kw ("do"s)
   call enter_kw ("return"s)
   call enter_kw ("break"s)
   call enter_kw ("next"s)
   call enter_kw ("stop"s)
   call enter_kw ("goto"s)
   call enter_kw ("call"s)
   call enter_kw ("end"s)
   call enter_kw ("include"s)
   call enter_kw ("define"s)
   call enter_kw ("undefine"s)
   call enter_kw ("select"s)
   call enter_kw ("when"s)
   call enter_kw ("ifany"s)

  # Fortran keywords:
   call enter_kw ("continue"s)
   call enter_kw ("complex"s)
   call enter_kw ("precision"s)
   call enter_kw ("logical"s)
   call enter_kw ("implicit"s)
   call enter_kw ("parameter"s)
   call enter_kw ("external"s)
   call enter_kw ("dimension"s)
   call enter_kw ("integer"s)
   call enter_kw ("equivalence"s)
   call enter_kw ("function"s)
   call enter_kw ("subroutine"s)
   call enter_kw ("common"s)
   call enter_kw ("data"s)
   call enter_kw ("trace"s)
   call enter_kw ("save"s)
   call enter_kw ("real"s)
   call enter_kw ("double"s)
   call enter_kw ("blockdata"s)
   call enter_kw ("stackheader"s)
   call enter_kw ("shortcall"s)

   return
   end



# enter_kw --- place key word in identifier table

   subroutine enter_kw (kw)
   character kw (ARB)

   include XREF_COMMON

   untyped info (SYMINFOSIZE)

   info (SYMBOLTYPE) = KEYWD_SYMBOLTYPE
   call enter (kw, info, Idtable)

   return
   end



# synerr --- report syntax error

   subroutine synerr (message)
   packed_char message (ARB)

   include XREF_COMMON

   integer i
   character str (MAXLINE)

   call print (ERROUT, "*i"p, Line_number (1))
   for (i = 2; i <= Level; i += 1)
      call print (ERROUT, ".*i"p, Line_number (i))
   call print (ERROUT, ": *p.*n"p, message)

   return
   end
