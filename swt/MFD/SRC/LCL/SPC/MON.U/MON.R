# mon --- system status monitor

#  defines for the calls to GMETR$

   define (GM_SYS,1)
   define (GM_FS,2)
   define (GM_INT,3)
   define (GM_USER,4)
   define (GM_MEM,5)


#  defines for buffer allocation and loop control

   define (MAXUSER,128)
   define (SYS_SIZE,13)
   define (FS_SIZE,12)
   define (INT_SIZE,34)
   define (USER_SIZE,43)
   define (MEM_SIZE,129)


# funky definitions for break$

   define (GET_COUNTER,2)
   define (SET_COUNTER,4)


# defines for user data

   define (UTYPE,2)
   define (LIDATE,3)
   define (LITIME,4)
   define (LOGNAM,5)
   define (PROJID,21)
   define (CPUSED,37)
   define (IOUSED,39)

# general defines

   define (CLEAR,'c'c)
   define (LONG,'l'c)
   define (MEMORY,'m'c)
   define (QUIT,'q'c)
   define (SHORT,'s'c)
   define (COMMAND,'x'c)
   define (HELP,'?'c)

   define (CYCLE,000500)
   define (DEFAULT_TIME,30)

   define (MAXPROMPT,20)
   define (DEFAULT_PROMPT,"ok, "s)

   define (MAXROW,rowcol(1))
   define (MAXCOL,rowcol(2))
   define (COMMAND_LINE,MAXROW)
   define (PROCESS_LINE,7)

#  buffers for the return of metering information

   integer s_new (SYS_SIZE), s_old (SYS_SIZE)
   integer s_version, nusr, cptick, clrate
   longint o_cptot, o_iotot, o_gclok, o_iocnt
   longint   cptot,   iotot,   gclok,   iocnt

   equivalence (s_version, s_new (1)),
               (cptot, s_new (3)), (o_cptot, s_old (3)),
               (iotot, s_new (5)), (o_iotot, s_old (5)),
               (gclok, s_new (7)), (o_gclok, s_old (7)),
               (iocnt, s_new (9)), (o_iocnt, s_old (9)),
               (nusr, s_new (11)),
               (cptick, s_new (12)),
               (clrate, s_new (13))


   integer f_new (FS_SIZE),  f_old (FS_SIZE)
   integer f_version
   longint o_pfcnt, o_misses, o_found, o_same, o_used
   longint   pfcnt,   misses,   found,   same,   used

   equivalence (f_version, f_new (1)),
               (pfcnt, f_new (3)), (o_pfcnt, f_old (3)),
               (misses, f_new (5)), (o_misses, f_old (5)),
               (found, f_new (7)), (o_found, f_old (7)),
               (same, f_new (9)), (o_same, f_new (9)),
               (used, f_new (11)), (o_used, f_new (11))


   integer i_new (INT_SIZE), i_old (INT_SIZE)
   integer i_version
   longint o_idle1, o_idle2, o_clock, o_farnet, o_smlc, o_amlc, o_mpc1,
           o_mpc2,  o_plot,  o_ring,  o_spare, o_disk1, o_disk2
   longint   idle1,   idle2,   clock,   farnet,   smlc,   amlc,   mpc1,
             mpc2,    plot,    ring,    spare,   disk1,   disk2

   equivalence (i_version, i_new (1)),
               (idle1, i_new (3)), (o_idle1, i_old (3)),
               (idle2, i_new (5)), (o_idle2, i_old (5)),
               (clock, i_new (7)), (o_clock, i_old (7)),
               (farnet, i_new (9)), (o_farnet, i_old (9)),
               (smlc, i_new (11)), (o_smlc, i_old (11)),
               (amlc, i_new (13)), (o_amlc, i_old (13)),
               (mpc1, i_new (15)), (o_mpc1, i_old (15)),
               (mpc2, i_new (17)), (o_mpc2, i_old (17)),
               (plot, i_new (19)), (o_plot, i_old (19)),
               (ring, i_new (21)), (o_ring, i_old (21)),
               (spare, i_new (23)), (o_spare, i_old (23)),
               (disk1, i_new (25)), (o_disk1, i_old (25)),
               (disk2, i_new (27)), (o_disk2, i_old (27))


   integer u_new (USER_SIZE,MAXUSER),u_old (USER_SIZE,MAXUSER)
   integer u_version

   equivalence (u_version, u_new (1, 1))


   integer m_new (MEM_SIZE)
   integer m_version

   equivalence (m_version, m_new (1))


# now the normal data that we must shuffle

   bool just_after_help
   character term_type (MAXTERMTYPE), arg (MAXARG)
   character cmdbuf (MAXLINE), prompt (MAXPROMPT)
   integer i, next_line, code, position, hrs, min, here, inh_cnt
   integer display, ch, factor, rowcol (2), duplex, plen
   integer summary_time, cursor, command_mode
   longint interval, junk_ptr
   real sec

   longint d_iocnt, d_pfcnt, d_bhcnt
   real d_cpu, d_ucpu, d_io, d_sec, cp_time, io_time, up_time
   real pf_sec, da_sec, bh_sec, bh_pct

   common s_new, position, d_cpu, display, factor, m_new
   common /quit$/ inh_cnt


# support routines required for mon

   integer getarg, vtinit, duplx$, length
   character mapdn
   logical chkinp
   longint ctol
   shortcall mkonu$
   external quit


   procedure initialize_monitor forward
   procedure pause_for_timeslice forward
   procedure copy_stats forward
   procedure get_new_meters forward
   procedure calculate_delta_cpu forward
   procedure print_system_stats forward
   procedure print_process_stats forward
   procedure show_help forward



# start your program...

   initialize_monitor
   get_new_meters
   call sleep$ (001000)          # Wait 1 second initially

   repeat {

      copy_stats
      get_new_meters
      print_system_stats
      print_process_stats
      pause_for_timeslice
      }



   procedure initialize_monitor {

      if (getarg (1, arg, MAXARG) ~= EOF) {
         i = 1
         interval = ctol (arg, i) * 1000

         if (interval <= 0)
            call error ("Usage: mon [<sample interval>]"p)
         }
      else
         interval = DEFAULT_TIME * 1000

      call ctoc (DEFAULT_PROMPT, prompt, MAXPROMPT)
      plen = length (prompt)

      call mkonu$ ("QUIT$"v, loc (quit))
      call break$ (GET_COUNTER, inh_cnt)    # Save the current counter
      call break$ (SET_COUNTER, 0)          # Ensure breaks enabled
      if (vtinit (term_type) ~= OK) {
         call print (ERROUT, "Terminal type '*s' not supported"s, term_type)
         call error (""p)
         }

      call vtinfo (VT_MAXRC, rowcol)
      call vtupd (YES)
      display = LONG
      factor = 2
      command_mode = NO
      next_line = 1
      just_after_help = FALSE

      }



   procedure pause_for_timeslice {

      local dummy; integer dummy

      summary_time = 0
      while (summary_time < interval) {

         call sleep$ (CYCLE)
         summary_time += CYCLE
         while (chkinp (dummy)) {

            call t1in (ch)
            if (command_mode == NO) {

               ch = mapdn (ch)
               select (ch)
                  when (LONG, SHORT, MEMORY)
                     display = ch
                  when (COMMAND) {
                     command_mode = YES
                     call vtprt (COMMAND_LINE, 1, "*s*#x"s, prompt, MAXCOL)
                     call vtupd (NO)
                     cursor = plen
                     }
                  when (CLEAR) {
                     call vtupd (YES)
                     ch = NUL
                     }
                  when (QUIT)
                     call quit (junk_ptr)
                  when (HELP) {
                     show_help
                     just_after_help = TRUE
                     break 2
                     }

               select (display)
                  when (LONG)
                     factor = 2
                  when (SHORT, MEMORY)
                     factor = 3
               }
            else {

               select (ch)
               when (BS) {
                  call vtputl (" "s, COMMAND_LINE, cursor)
                  cursor -= 1
                  }
               when (DEL) {
                  cursor = plen
                  call vtclr (COMMAND_LINE, cursor, COMMAND_LINE, MAXCOL)
                  }
               when (NEWLINE) {
                  command_mode = NO
                  call vtgetl (cmdbuf, COMMAND_LINE, plen, cursor - plen + 1)
                  call vtclr  (COMMAND_LINE, 1, COMMAND_LINE, MAXCOL)
                  call vtupd (NO)
                  duplex = duplx$ (-1)
                  call duplx$ (:020000)
                  call vtmove (next_line, 1)
                  call sys$$ (cmdbuf, ERR)
                  call duplx$ (duplex)
                  }
               else {
                  cursor += 1
                  call vtprt (COMMAND_LINE, cursor, "*c"s, ch)
                  }

               call vtupd (NO)
               }
            }
         }
      }



   procedure copy_stats {

      call move$ (s_new, s_old, SYS_SIZE)
      call move$ (f_new, f_old, FS_SIZE)
      call move$ (i_new, i_old, INT_SIZE)
      call move$ (u_new, u_old, USER_SIZE * nusr)
      }



   procedure get_new_meters {

      call gmetr$ (GM_SYS, loc (s_new), SYS_SIZE, code, 0)
      do i = 1, nusr
         call gmetr$ (GM_USER, loc (u_new (1, i)), USER_SIZE, code, i)
      call gmetr$ (GM_INT, loc (i_new), INT_SIZE, code, 0)
      call gmetr$ (GM_FS,  loc (f_new), FS_SIZE,  code, 0)
      call gmetr$ (GM_MEM, loc (m_new), MEM_SIZE, code, 0)
      m_new (1) = 0
      }



   procedure print_system_stats {

      call vtprt (1, 1,  "                 Total"s)
      call vtprt (1, 30, " Change"s)
      call vtprt (1, 41, "                   Total Change / Sec"s)

      calculate_delta_cpu
      d_io  = (iotot - o_iotot) / float (clrate)
      d_sec = (gclok - o_gclok) / float (clrate)

      cp_time = (cptot / 1000000.0) * cptick
      io_time = iotot / float (clrate)
      up_time = gclok / float (clrate)

      d_iocnt = iocnt - o_iocnt
      d_pfcnt = pfcnt - o_pfcnt
      d_bhcnt = found - o_found + same - o_same + used - o_used

      pf_sec = d_pfcnt / d_sec
      da_sec = d_iocnt / d_sec
      bh_sec = d_bhcnt / d_sec
      if (d_bhcnt + misses - o_misses > 0)
         bh_pct = (d_bhcnt * 100.0) / (d_bhcnt + misses - o_misses)
      else
         bh_pct = 0.0

      call hms (up_time, hrs, min, sec)
      call vtprt (2, 1, "Up Time:   *5i:*2,,0i:*5,2,0r"s, hrs, min, sec)
      call vtpad (80)
      call vtprt (2, 30, "*7,2r"s, d_sec)
      call vtprt (2, 41, "Disk Accesses:  *8l *6l *5,1r"s,
                  iocnt, d_iocnt, da_sec)

      call hms (cp_time, hrs, min, sec)
      call vtprt (3, 1, "User Time: *5i:*2,,0i:*5,2,0r"s, hrs, min, sec)
      call vtpad (80)
      call vtprt (3, 30, "*7,2r"s, d_ucpu)
      call vtprt (3, 41, "Page Faults:    *8l *6l *5,1r"s,
                  pfcnt, d_pfcnt, pf_sec)

      call hms (io_time, hrs, min, sec)
      call vtprt (4, 1, "I/O Time:  *5i:*2,,0i:*5,2,0r"s, hrs, min, sec)
      call vtpad (80)
      call vtprt (4, 30, "*7,2r"s, d_io)
      call vtprt (4, 41, "Buffer Hit Rate: *7,2r% *5l *5,1r"s,
                  bh_pct, d_bhcnt, bh_sec)
      }



   procedure calculate_delta_cpu {


      d_ucpu = ((cptot - o_cptot) / 1000000.0) * cptick
      d_cpu = d_ucpu + ((idle1 - o_idle1 + _
                idle2 - o_idle2 + clock - o_clock + _
                farnet - o_farnet + smlc - o_smlc + _
                amlc - o_amlc + mpc1 - o_mpc1 + _
                mpc2 - o_mpc2 + plot - o_plot + _
                ring - o_ring + spare - o_spare + _
                disk1 - o_disk1 + disk2 - o_disk2) / 1000000.0) * cptick
      }



   procedure print_process_stats {

      select (display)
      when (LONG) {
         call vtprt (6, 1, "Name   Pid  Cp Total  dCpu  Pct  Mem |"s)
         call vtpad (80)
         call vtprt (6, 41, "Name   Pid  Cp Total  dCpu  Pct  Mem |"s)
         }

      when (SHORT) {
         call vtprt (6, 1,  "Name   Pid Time  dCp  Pct| "s)
         call vtpad (80)
         call vtprt (6, 28, "Name   Pid Time  dCp  Pct| "s)
         call vtprt (6, 55, "Name   Pid Time  dCp  Pct| "s)
         }

      when (MEMORY) {
         call vtprt (6, 1,  "Name   Pid  Mem  dCp  Pct| "s)
         call vtpad (80)
         call vtprt (6, 28, "Name   Pid  Mem  dCp  Pct| "s)
         call vtprt (6, 55, "Name   Pid  Mem  dCp  Pct| "s)
         }

      position = 0

      call pps ("Idle1 ", 0,  idle1, o_idle1 )
      call pps ("Idle2 ", 0,  idle2, o_idle2 )
      call pps ("Clock ", 0,  clock, o_clock )
      call pps ("Farnet", 0, farnet, o_farnet)
      call pps ("Smlc  ", 0,   smlc, o_smlc  )
      call pps ("Amlc  ", 0,   amlc, o_amlc  )
      call pps ("Mpc1  ", 0,   mpc1, o_mpc1  )
      call pps ("Mpc2  ", 0,   mpc2, o_mpc2  )
      call pps ("Plot  ", 0,   plot, o_plot  )
      call pps ("Ring  ", 0,   ring, o_ring  )
      call pps ("Spare ", 0,  spare, o_spare )
      call pps ("Disk1 ", 0,  disk1, o_disk1 )
      call pps ("Disk2 ", 0,  disk2, o_disk2 )


      do i = 1, nusr; {
         if (u_old (UTYPE, i) > 0)
            call pps (u_new (LOGNAM,i), i, u_new (CPUSED,i), u_old (CPUSED,i))
         }

      next_line = (position + (factor - 1)) / factor + PROCESS_LINE
      call vtclr (next_line, 1, COMMAND_LINE - 1, MAXCOL)
      if (command_mode == NO)
         call vtclr (COMMAND_LINE, 1, COMMAND_LINE, MAXCOL)
      if (just_after_help) {
         call vtupd (YES)
         just_after_help = FALSE
         }
      else
         call vtupd (NO)
      if (command_mode == NO)
         call vtmove (COMMAND_LINE, 1)
      else
         call vtmove (COMMAND_LINE, cursor + 1)
      }



   procedure show_help {

      local dummy; integer dummy

      call vtclr (1, 1, MAXROW, MAXCOL)
      call vtputl ("Available commands are:"s, 2, 20)
      call vtputl ("l   Use LONG format"s, 4, 25)
      call vtputl ("s   Use SHORT format"s, 5, 25)
      call vtputl ("m   Use SHORT MEMORY format"s, 6, 25)
      call vtputl ("c   CLEAR screen and redraw data"s, 7, 25)
      call vtputl ("q      \"s, 8, 25)
      call vtputl ("cntrl-p >  Quit"s, 9,25)
      call vtputl ("BREAK  /"s, 10,25)
      call vtputl ("x   Execute a PRIMOS command"s, 11, 25)
      call vtputl ("?   Display this information"s, 12, 25)
      call vtputl ("Type any character to continue"s, 14, 20)
      call vtupd (YES)
      call t1in (dummy)
      call vtclr (1, 1, MAXROW, MAXCOL)
      }

   end



   subroutine pps (name, pid, new, old)

   character name (3)
   integer pid
   longint new, old

   integer s_new (SYS_SIZE), position, cptick, display, factor
   integer m_new (MEM_SIZE)
   real d_cpu

   common s_new, position, d_cpu, display, factor, m_new
   equivalence (cptick, s_new (12))

   integer hrs, min, isec, row, col, time
   character ch
   real sec, cp_time, d_user, percent


   if (new == 0)
      return

   d_user = ((new - old) / 1000000.0) * cptick
   cp_time = (new / 1000000.0) * cptick
   percent = d_user * 100.0 / d_cpu
   call hms (cp_time, hrs, min, sec)
   isec = sec

   row = position / factor + PROCESS_LINE
   col = (81 / factor) * mod (position, factor) + 1

   select (display)
   when (LONG)
      call vtprt (row, col, "*,6h *3i *3i:*2,,0i:*2,,0i *5,2r *5,2r *3i |"s,
                  name, pid, hrs, min, isec, d_user, percent, m_new (pid + 1))

   when (SHORT) {
      if (hrs == 0)
         if (min == 0) {
            time = isec
            ch = 's'c
            }
         else {
            time = min
            ch = 'm'c
            }
      else {
         time = hrs
         ch = 'h'c
         }

      call vtprt (row, col, "*,6h *3i *3i*c *4,1r *4,1r|"s,
            name, pid, time, ch, d_user, percent)
      }

   when (MEMORY)
      call vtprt (row, col, "*,6h *3i *4i *4,1r *4,1r|"s,
            name, pid, m_new (pid + 1), d_user, percent)

   call vtpad (80)
   position += 1

   return
   end



   subroutine hms (sec, h, m, s)

   integer h, m
   real sec, s

   h = sec / 3600
   m = (sec - h * 3600.0) / 60
   s = amod (sec, 60.0)

   return
   end



# quit --- BREAK handler and normal quit routine

   subroutine quit (ptr)
   long_int ptr

   integer inh_cnt
   common /quit$/ inh_cnt

   call break$ (SET_COUNTER, inh_cnt)      # Reset breaks before returning
   call vtstop

   stop
   end
