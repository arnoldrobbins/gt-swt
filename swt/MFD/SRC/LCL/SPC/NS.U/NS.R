# ns --- print out network status

include "=incl=/x$keys.r.i"

   integer adrl, adll, avcl, naml, vcdl, i, j, num, code, time
   integer adr (1024), adl (128), adp (128), avc (128), nam (128),
         vcd (128)

   procedure print_circuit_status (vcid) forward

   ### Get X.25 addresses of all nodes in network:
   call x$stat (XI$ADR, num, adr, adrl, adl, adll, code, time)
   if (code == XS$NET)
      call error ("network not configured"s)
   elif (code ~= XS$CMP)
      call error ("x$stat error. Shouldn't happen."s)

   ### Find the starting position of each address:
   for ({i = 1; j = 0}; i <= adll; {j += adl (i); i += 1})
      adp (i) = j / 2 + 1

   ### For each node, get a list of active VCs to that node:
   for (i = 1; i <= adll; i += 1) {
      call x$stat (XI$AVC, num, adr (adp (i)), adl (i), avc, avcl,
            code, time)
      if (num <= 0)
         next
      call x$stat (XI$XTP, 0, adr (adp (i)), adl (i), nam, naml,
            code, time)
      for (j = 1; j <= avcl; j += 1) {
         call x$stat (XI$VCD, avc (j), 0, 0, vcd, vcdl, code, time)
         if (code == XS$CMP)
            print_circuit_status (avc (j))
         }
      }

   stop


   # print_circuit_status --- print status of one virtual circuit

      procedure print_circuit_status (vcid) {
      integer vcid

      local userm, code, stxt, spos
      integer userm (43), code
      string_table spos, stxt _
         / "From" / / / / / / / / / / / / "With" / "To"

      call gmetr$ (4, loc (userm), 43, code, vcd (2))

      call print (STDOUT, "*,#h (*2,,0i) Port *3i, vc*-2i *s *,#h*n"s,
            MAXUSERNAME - 1, userm (5), vcd (2), vcd (5), vcid,
            stxt (spos (vcd (1) + 1)), naml, nam)
      }

   end
