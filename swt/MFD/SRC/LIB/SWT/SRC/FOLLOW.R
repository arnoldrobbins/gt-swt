# follow --- path name follower

   integer function follow (path, seth)
   character path (ARB)
   integer seth

   integer i, save_bplabel (4)
   integer getto, ptoc

   shortcall mkonu$ (18)
   external bponu$

   include SWT_COMMON

   integer attach_sw
   integer pname (16), ppwd (3), unpackedn(40), vpack(21), i

   procedure restore_Bplabel forward


   call break$ (DISABLE)               # no interruptions
   do i = 1, 4                         # while changing
      save_bplabel (i) = Bplabel (i)   # common block values
   call mklb$f ($1, Bplabel)
   call break$ (ENABLE)

   call mkonu$ ("BAD_PASSWORD$"v, loc (bponu$))

   if (path (1) == EOS)
      call at$hom (Errcod)

   elif (getto (path, pname, ppwd, attach_sw) == OK) {
      i = ptoc (pname, " "c, unpackedn, 33)     # build the directory name
      unpackedn (i + 1) = " "c
      i += 2
      call ptoc (ppwd, " "c, unpackedn(i), 7)   # and password for converting
      i = 1
      call ctov (unpackedn, i, vpack, 21)       # to character varying
      call at$rel (seth, vpack, Errcod)         # for at$rel
      }

   else {
1     call at$hom (i)
      restore_Bplabel
      return (ERR)
      }

   if (Errcod == 0) {
      restore_Bplabel
      return (OK)
      }
   else {
      call at$hom (i)
      restore_Bplabel
      return (ERR)
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
