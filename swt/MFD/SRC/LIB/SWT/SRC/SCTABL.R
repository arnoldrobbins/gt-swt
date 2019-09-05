# sctabl --- scan symbol table, returning next entry or EOF

   integer function sctabl (table, sym, info, posn)
   pointer table, posn
   character sym (ARB)
   integer info (ARB)

   integer Mem (1)
   common /ds$mem/ Mem

   pointer bucket, walker
   pointer dsget

   integer nodesize, i

   if (posn == 0) {                 # just starting scan?
      posn = dsget (2)                 # get space for position info
      Mem (posn) = 1                   # get index of first bucket
      Mem (posn + 1) = Mem (table + 1) # get pointer to first chain
      }

   bucket = Mem (posn)              # recover previous position
   walker = Mem (posn + 1)
   nodesize = Mem (table)

   repeat {    # until the next symbol, or none are left
      if (walker ~= LAMBDA) {       # symbol available?
         call scopy (Mem, walker + ST_DATA + nodesize, sym, 1)
         for (i = 1; i <= nodesize; i += 1)
            info (i) = Mem (walker + ST_DATA + i - 1)
         Mem (posn) = bucket        # save position of next symbol
         Mem (posn + 1) = Mem (walker + ST_LINK)
         sctabl = 1  # not EOF
         return
         }
      else {
         bucket = bucket + 1
         if (bucket > ST_HTABSIZE)
            break
         walker = Mem (table + bucket)
         }
      }

   call dsfree (posn)      # throw away position information
   posn = 0
   sc_tabl = EOF
   return
   end
