# dmpcm$ --- dump the Subsystem common areas for examination

   subroutine dmpcm$ (fd)
   filedes fd

   include SWT_COMMON

   integer i, tbpptr (2), trtptr (2)
   character estr (MAXLINE), kstr (MAXLINE), nlstr (MAXLINE)
   character eofstr (MAXLINE), escstr (MAXLINE), rtstr (MAXLINE)

   call ctomn (Echar, estr)
   call ctomn (Kchar, kstr)
   call ctomn (Nlchar, nlstr)
   call ctomn (Eofchar, eofstr)
   call ctomn (Escchar, escstr)
   call ctomn (Rtchar, rtstr)

   call print (fd, "Software Tools Common Area:*n"s)
   call print (fd, "  Echar: *4s    Kchar: *4s    Nlchar: *4s*n"s,
             estr, kstr, nlstr)
   call print (fd, "  Eofchar: *4s  Escchar: *4s  Rtchar: *4s*n"s,
             eofstr, escstr, rtstr)
   call print (fd, "  Isphantom: *4y  Cputype: *i  Errcod: *i*n"s,
             Isphantom, Cputype, Errcod)
   call print (fd, "  Kill_resp: *s*n"s, Kill_resp)
   call print (fd, "  Stdporttbl: "s)
   for (i = 1; i <= MAXSTDPORTS; i += 1)
      call print (fd, " *3i"s, Stdporttbl (i))
   call print (fd, "*n"s)
   call print (fd, "  Passwd: *6s  Prtdest: *s  Prtform: *s*n"s,
             Passwd, Prt_dest, Prt_form)

   tbpptr (1) = Bplabel (2)      # reverse the backward ptr's
   tbpptr (2) = Bplabel (1)
   trtptr (1) = Rtlabel (2)
   trtptr (2) = Rtlabel (1)
   call print (fd, "  Bplabel: *a *a  Rtlabel: *a *a*n"s,
             tbpptr (1), Bplabel (3), trtptr (1), Rtlabel (3))
   call print (fd, "  Cmdstat: *i  Comunit: *i  Firstuse: *i*n"s,
             Cmdstat, Comunit, Firstuse)
   call print (fd, "  Termtype: *s  Lword: *,-8i*n"s,
             Termtype, Lword)
   call print (fd, "  Termattr: "s)
   for (i = 1; i <= MAXTERMATTR; i += 1)
      call print (fd, " *y"s, Termattr (i))
   call print (fd, "*n"s)

   return
   end
