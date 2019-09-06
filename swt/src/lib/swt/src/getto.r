# getto --- get to the last file in a path name

   integer function getto (pathin, pfilename, ppwd, attach_sw)
   character pathin (ARB)
   integer pfilename (16), ppwd (3)
   integer attach_sw

   include SWT_COMMON

   integer expand, mktr$

   character dirname (MAXTREE), temp (MAXPATH)
   character fulltree (MAXTREE), diskname (17)
   integer count, loop, sp, tp, j, save_bplabel (4)

   shortcall mkonu$ (18)
   external bponu$

   procedure check_code forward
   procedure getname forward
   procedure putname forward
   procedure restore_Bplabel forward


   call break$ (DISABLE)               # no interruptions
   do j = 1, 4                         # while changing
      save_bplabel (j) = Bplabel (j)   # common block values
   call mklb$f ($1, Bplabel)
   call break$ (ENABLE)

   call mkonu$ ("BAD_PASSWORD$"v, loc (bponu$))
   attach_sw = YES

   if (expand (pathin, temp, MAXPATH) == ERR) {
      attach_sw = NO
      restore_Bplabel
      return (ERR)
      }

   call mktr$ (temp, fulltree)
   call mapstr (fulltree, UPPER)

   if (pathin (1) == EOS) {  # case of current directory
      call at$hom (Errcod)
      check_code
      tp = 1
      putname
      pfilename (1) = KCURR      # Primos key for current directory
      attach_sw = NO
      restore_Bplabel
      return (OK)
      }

   # Count the number of pathname elements to worry about

   count = 0
   for (loop = 1; fulltree (loop) ~= EOS; loop += 1)
      if (fulltree (loop) == '>'c)
         count += 1

   if (fulltree(1) ~= '*'c)
      count += 1

   loop = 1
   repeat {
      if (loop ~= 1) {        # name relative to current directory
         getname
         call at$rel (KSETC, dirname, Errcod)
         }

      elif (fulltree (1) == '<'c) {    # absolute partition reference
         for (tp = 1; fulltree (tp) ~= '>'c; tp += 1)
            temp (tp) = fulltree (tp)
         tp += 1                    # step past '>'
         if (count == 1)
            putname
         temp(tp - 1) = '>'c
         call ctoc("MFD XXXXXX"s, temp(tp), MAXPATH)
         sp = 1
         call ctov (temp, sp, dirname, MAXTREE)
         call at$ (KSETC, dirname, Errcod)
         }

      elif (fulltree (1) == '*'c) {    # name references current directory
         tp = 3
         if (count == 1) {    # name is in current directory
            attach_sw = NO
            putname
            restore_Bplabel
            return (OK)
            }
         else {               # name relative to current directory
            getname
            call at$rel (KSETC, dirname, Errcod)
            }
         }

      else {      # absolute reference on any partition
         tp = 1
         if (count == 1)
            putname
         getname
         call at$any (KSETC, dirname, Errcod)
         if (count == 1) {    # special case of //name
            check_code
            call at$abs (KSETC, "*"v, "MFD XXXXXX"v, Errcod)
            check_code
            restore_Bplabel
            return (OK)
            }
         }

      check_code
      loop += 1
      } until (loop >= count)

   putname
   restore_Bplabel
   return (OK)

1  continue  # bad password return
   Errcod = EBPAS
   check_code


   # check_code --- check return code for errors

      procedure check_code {
         local i; integer i

         if (Errcod ~= 0) {
            call at$hom (i)
            attach_sw = NO
            restore_Bplabel
            return (ERR)
            }
         }


   # getname --- get the name of the next node in the treename

      procedure getname {
         local i, sp; integer i, sp

         for (i = 1; fulltree (tp) ~= '>'c && fulltree (tp) ~= EOS;
                  {i += 1; tp += 1})
            temp (i) = fulltree (tp)
         temp (i) = EOS

         tp += 1   # step past the '>'
         sp = 1
         call ctov (temp, sp, dirname, 21)
         if (i > 40) {
            Errcod = EITRE
            check_code
            }
         }


   # putname --- put name and password into 'pfilename' and
   #              'ppwd' in packed format

      procedure putname {
         local i; integer i

         do i = 1,3
            ppwd (i) = "  "
         do i = 1,16
            pfilename (i) = "  "
         j = 0
         for (i = tp; fulltree (i) ~= EOS
                        && fulltree (i) ~= ' 'c
                        && j <= 32; i += 1)
            spchar (pfilename, j, fulltree (i))
         if (fulltree (i) ~= EOS) {
            j = 0
            for (i += 1; fulltree (i) ~= EOS && j <= 6; i += 1)
               spchar (ppwd, j, fulltree (i))
            }
         }


   # restore_Bplabel --- restore saved value of Bplabel

      procedure restore_Bplabel {
         local i; integer i

         call break$ (DISABLE)               # no interruptions
         do i = 1, 4                         # while changing
            Bplabel (i) = save_bplabel (i)   # common block values
         call break$ (ENABLE)
         }

   end
