# tscan$ --- traverse tree in the file system

   integer function tscan$ (path, buf, clev, nlev, action)
   integer buf (MAXDIRENTRY), clev, nlev, action
   character path (MAXPATH)

   include SWT_COMMON

   integer type, code, i, l, pwd (3), opwd (3), npwd (3)
   integer follow, ctoc, expand, equal, upkfn$

   procedure check_postorder forward
   procedure reattach forward
   procedure enter_pwd forward
   procedure enter_info forward
   procedure fix_path forward

   Ts_at = NO           # no reattach done on this call, yet
   if (clev == 0) {     # first call, initialize everything

      ### Set up the state vectors
      if (expand ("=GaTech="s, Ts_path, MAXPATH) == ERR
            || equal (Ts_path, "yes"s) == NO)
         Ts_gt = NO
      else
         Ts_gt = YES
      clev = 1
      Ts_ps (clev) = ctoc (path, Ts_path, MAXPATH) + 1
      if (and (action, REATTACH) ~= 0)
         reattach

      ### Open the current directory for reading
      call srch$$ (KREAD + KGETU, KCURR, 0, Ts_un (clev), type, code)
      if (code ~= 0) {
         clev = 0
         return (EOF)
         }
      call dir$rd (KINIT, Ts_un (clev), loc (buf), MAXDIRENTRY, code)
      Ts_state = GET_NEXT_ENTRY
      }

   repeat {
      select (Ts_state)
         when (DESCEND) {        # descend to next level
            if (and (action, REATTACH) ~= 0 && (Ts_at == NO))
               reattach
            if (clev >= nlev) {  # are we at the limit?
               Ts_state = GET_NEXT_ENTRY
               check_postorder
               next
               }

            ### Attach to the new directory
            enter_pwd
            call at$swt (Ts_bf (2, clev), 32, 0, pwd, KICUR, code)
            if (code ~= 0) {
               Ts_state = COULDNT_DESCEND
               return (ERR)
               }
            clev += 1

            ### Open it for reading
            call srch$$ (KREAD + KGETU, KCURR, 0, Ts_un (clev), type, code)
            if (code ~= 0) {
               Ts_state = ASCEND
               return (ERR)
               }
            Ts_state = GET_NEXT_ENTRY
            }

         when (COULDNT_DESCEND) {   # couldn't descend into last dir
            if (Ts_at == NO)
               reattach
            Ts_state = GET_NEXT_ENTRY
            check_postorder
            }

         when (GET_NEXT_ENTRY) {    # get next entry from this level
            if (and (action, REATTACH) ~= 0 && (Ts_at == NO))
               reattach
            path (Ts_ps (clev)) = EOS
            call dir$rd (KREAD, Ts_un (clev), loc (buf), MAXDIRENTRY, code)
            if (code ~= 0)
               Ts_state = ATEOD
            elif (rs(buf(1),8) == 2 || rs(buf(1),8) == 3) {
               buf (1) = 0          # indicate preorder encounter
               fix_path
               if (and (buf (20), 8r10007) == 4) { # a ufd but not mfd
                  enter_info        # next time we're called, we will
                  Ts_state = DESCEND   # descend another level
                  }
               if ( ~(and (buf (20), 7) == 4)     # file type is NOT ufd
                     || and (action, PREORDER) ~= 0)
                  return (OK)
               }
            # else stay in this state
            }

         when (ATEOD) {          # at end of directory
            if (and (action, REATTACH) ~= 0 && (Ts_at == NO))
               reattach
            call srch$$ (KCLOS, 0, 0, Ts_un (clev), 0, code)
            Ts_state = ASCEND
            if (and (action, EODPAUSE) ~= 0)
               return (EOD)
            }

         when (ASCEND) {         # pop up one level
            clev -= 1
            if (clev <= 0)
               break
            reattach
            Ts_state = GET_NEXT_ENTRY
            check_postorder
            }

      else
         call error ("in tscan$: can't happen"s)

      }

   return (EOF)


# check_postorder --- return entry on postorder encounter if desired

   procedure check_postorder {

      if (and (action, POSTORDER) ~= 0) {
         call move$ (Ts_bf (1, clev), buf, MAXDIRENTRY)
         buf (1) = 1       # indicate postorder encounter
         return (OK)
         }

      }


# enter_pwd --- get password for next lower directory

   procedure enter_pwd {

      local valid_name; bool valid_name
      local junk; integer junk

      call gpas$$ (Ts_bf (2, clev), 32, opwd, npwd, code)
      call texto$ (opwd, 6, junk, valid_name)

      if (code == ENRIT) {
         pwd (1) = "  "
         pwd (2) = "  "
         pwd (3) = "  "
         }
      elif (Ts_gt == YES && valid_name) {
         pwd (1) = npwd (1)
         pwd (2) = npwd (2)
         pwd (3) = npwd (3)
         }
      else {
         pwd (1) = opwd (1)
         pwd (2) = opwd (2)
         pwd (3) = opwd (3)
         }
      do i = 1, 3
         Ts_pw (i, clev) = pwd (i)
      l = Ts_eos
      if (pwd (1) ~= "  " && pwd (1) ~= 0) {
         path (l) = ':'c
         l += 1 + upkfn$ (pwd, 6, path (l + 1), MAXPATH - l)
         }
      Ts_ps (clev + 1) = l
      }


# fix_path --- add name of current entry to pathname

   procedure fix_path {

      l = Ts_ps (clev)
      if (l > 1) {
         path (l) = '/'c
         l += 1
         }
      l += upkfn$ (buf (2), 32, path (l), MAXPATH - l + 1)
      Ts_eos = l
      }


# enter_info --- save info in current directory entry

   procedure enter_info {

      call move$ (buf, Ts_bf (1, clev), MAXDIRENTRY)
      }


# reattach --- attach back to the same place

   procedure reattach {

      Ts_at = YES
      call at$hom (code)
      if (follow (Ts_path, 0) == ERR) {
         Ts_state = ATEOD
         return (ERR)
         }

      for (i = 1; i < clev; i += 1) {
         call at$swt (Ts_bf (2, i), 32, 0, Ts_pw (1, i), KICUR, code)
         if (code ~= 0) {
            Ts_state = ATEOD
            return (ERR)
            }
         }
      }

   end
