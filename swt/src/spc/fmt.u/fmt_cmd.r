# comand --- perform formatting command

   subroutine comand (buf)
   character buf (ARB)

   include FMT_COMMON

   integer i, argtyp, ct, spval, val, val2, need
   integer comtyp, getval, domac, esc, getstr, ctoi
   character title (MAXOUT), tbuf (MAXOUT)

   ct = comtyp (buf)
   val = getval (buf, argtyp)

   if (domac (buf) == OK)  # check for macro invocation
      ;                    # if so, do nothing here

   else select (ct)        # branch on command type

      when (fi_REQ) {   # enable "fill" mode
         call brk
         Fill = YES
         }

      when (nf_REQ) {   # disable "fill" mode
         call brk
         Fill = NO
         }

      when (br_REQ) {   # force a break
         Nobreak = NO   # override "no-break" control character
         call brk
         }

      when (ls_REQ)     # set line spacing
         call set (Lsval, val, argtyp, 1, 1, HUGE)

      when (bp_REQ) {   # skip to the bottom of the page
         call brk
         if (Lineno > 0)
            call space (HUGE)
         call set (Newpag, val, argtyp, Newpag, -HUGE, HUGE)
         }

      when (ps_REQ) {   # skip pages
         call brk
         if (Lineno > 0)   # empty out current page
            call space (HUGE)
         i = 1
         SKIPCM (buf, i)
         val = ctoi (buf, i)
         SKIPBL (buf, i)
         val2 = ctoi (buf, i)
         if (val2 <= 0)
            val2 = Newpag
         for (i = mod (Newpag, val2); i < val; i += 1)
            call space (HUGE)
         }

      when (sp_REQ) {   # generate blank lines
         call brk
         if (Nospace == NO) {
            call set (spval, val, argtyp, 1, 0, HUGE)
            call space (spval)
            }
         }

      when (in_REQ) {   # set indent value
         call brk
         call set (Inval, val, argtyp, 0, 0, Rmval - 1)
         Tival = Inval
         }

      when (rm_REQ) {   # set right margin
         call brk
         call set (Rmval, val, argtyp, PAGEWIDTH,
               Tival + 1, MAXLINE - 2)
         call set (Tiwidth, Rmval - Lmval + 1, '0'c, Tiwidth, 0, HUGE)
         }

      when (ti_REQ) {   # set temporary indent value
         call brk
         call set (Tival, val, argtyp, 0, 0, Rmval)
         }

      when (ce_REQ) {   # center subsequent lines
         call brk
         call set (Ceval, val, argtyp, 1, 0, HUGE)
         }

      when (it_REQ)     # italicize subsequent lines
         call set (Itval, val, argtyp, 1, 0, HUGE)

      when (ul_REQ)     # underline subsequent lines
         call set (Ulval, val, argtyp, 1, 0, HUGE)

      when (he_REQ) {   # set page headings
         call getstr (buf, Even_header, MAXOUT)
         call scopy (Even_header, 1, Odd_header, 1)
         }

      when (fo_REQ) {   # set page footings
         call getstr (buf, Even_footer, MAXOUT)
         call scopy (Even_footer, 1, Odd_footer, 1)
         }

      when (pl_REQ) {   # set page length
         call set (Plval, val, argtyp, PAGELEN,
            M1val + M2val + M3val + M4val + 1, HUGE)
         Bottom = Plval - M3val - M4val
         }

      when (bf_REQ)     # boldface subsequent lines
         call set (Bfval, val, argtyp, 1, 0, HUGE)

      when (so_REQ)     # divert input stream
         if (getstr (buf, File_name, MAXPATH) > 0)
            call newinp (File_name)

      when (de_REQ)     # define a macro
         call defmac (buf)

      when (en_REQ)     # end a macro definition (processed by defmac)
         ;

      when (ta_REQ)     # set tab stops
         call settab (buf)

      when (tc_REQ)     # set the tab character
         call getsc (buf, Tabch, TAB)

      when (cc_REQ)     # set the control character
         call getsc (buf, Cmdch, '.'c)

      when (c2_REQ)     # set the "no-break" control character
         call getsc (buf, Nbcch, '`'c)

      when (hy_REQ)     # enable automatic hyphenation
         Hyphenation = YES

      when (nh_REQ)     # disable automatic hyphenation
         Hyphenation = NO

      when (ne_REQ)     # check availability of contiguous lines
         if (Nospace == NO) {
            call brk
            need = 0
            call set (need, val, argtyp, 1, 0, HUGE)
            if (Lineno + need - 1 > Bottom  &&  Lineno > 0)
               call space (HUGE)
            }

      when (po_REQ) {   # set page offset
         call brk
         call set (Poval, val, argtyp, 0, 0, HUGE)
         }

      when (oo_REQ) {   # set odd page offset
         call brk
         call set (Ooval, val, argtyp, 0, -HUGE, HUGE)
         }

      when (eo_REQ) {   # set even page offset
         call brk
         call set (Eoval, val, argtyp, 0, -HUGE, HUGE)
         }

      when (lm_REQ) {   # set left margin
         call brk
         call set (Lmval, val, argtyp, 1, 1, Rmval)
         call set (Tiwidth, Rmval - Lmval + 1, '0'c, Tiwidth, 0, HUGE)
         }

      when (er_REQ) {   # write a message to the terminal
         i = 1
         SKIPCM (buf, i)
         if (buf (i) == "'"c || buf (i) == '"'c)
            i += 1
         for (; buf (i) ~= NEWLINE && buf (i) ~= EOS; i += 1)
            call putch (esc (buf, i), ERROUT)
         }

      when (lt_REQ)     # set title length
         call set (Tiwidth, val, argtyp, PAGEWIDTH, 1, HUGE)

      when (tl_REQ) {   # generate a three-part title
         call brk
         call getstr (buf, title, MAXOUT)
         call mktl (title, Curpag, tbuf, MAXOUT)
#        Tival = 0      # titles are never indented
         call put (tbuf)
         }

      when (rc_REQ)     # set the tab replacement
         call getsc (buf, Replch, PHANTOMBL)

      when (ad_REQ) {   # set adjustment mode
         call getsc (buf, Adjust, 'b'c)
         if (Adjust ~= 'l'c && Adjust ~= 'r'c && Adjust ~= 'c'c)
            Adjust = 'b'c
         }

      when (na_REQ)     # disable margin adjustment
         Adjust = 'l'c

      when (ns_REQ)     # enable no-space mode
         Nospace = YES

      when (rs_REQ)     # disable no-space mode
         Nospace = NO

      when (pn_REQ)     # set next page number
         call set (Newpag, val, argtyp, Newpag, -HUGE, HUGE)

      when (ex_REQ) {   # exit
         call brk
         call reset_files
         stop
         }

      when (nx_REQ) {   # proceed to next input file
         call reset_files
         if (getstr (buf, File_name, MAXPATH) > 0)
            call newinp (File_name)
         elif (getarg (Next_arg, File_name, MAXPATH) ~= EOF) {
            Next_arg += 1
            call newinp (File_name)
            }
         else
            stop
         }

      when (xb_REQ)     # enable extra-blank mode
         Extra_blank_mode = YES

      when (sb_REQ)     # disable extra-blank mode
         Extra_blank_mode = NO

      when (m1_REQ)     # set margin-1 value
         call set (M1val, val, argtyp, MARGIN1, 0,
               Plval - M2val - M3val - M4val - 1)

      when (m2_REQ)     # set margin-2 value
         call set (M2val, val, argtyp, MARGIN2, 0,
               Plval - M1val - M3val - M4val - 1)

      when (m3_REQ) {   # set margin-3 value
         call set (M3val, val, argtyp, MARGIN3, 0,
               Plval - M1val - M2val - M4val - 1)
         Bottom = Plval - M3val - M4val
         }

      when (m4_REQ) {   # set margin-4 value
         call set (M4val, val, argtyp, MARGIN4, 0,
               Plval - M1val - M2val - M3val - 1)
         Bottom = Plval - M3val - M4val
         }

      when (dv_REQ) {   # divert output stream
         call brk
         if (getstr (buf, File_name, MAXPATH) > 0) {
            Dvflag = YES
            call newout (File_name)
            }
         else
            Dvflag = NO
         }

      when (mc_REQ) {   # set margin character
         call getsc (buf, Mcch, ' 'c)
         if (Mcch ~= ' 'c || Outp <= 1 && Mcout == YES)
            Tmcch = Mcch
         Mcout = NO
         }

      when (mo_REQ)     # set margin-offset
         call set (Moval, val, argtyp, 0, 0, HUGE)

      when (oh_REQ)     # set odd-numbered page heading
         call getstr (buf, Odd_header, MAXOUT)

      when (of_REQ)     # set odd-numbered page footing
         call getstr (buf, Odd_footer, MAXOUT)

      when (eh_REQ)     # set even-numbered page heading
         call getstr (buf, Even_header, MAXOUT)

      when (ef_REQ)     # set even-numbered page footing
         call getstr (buf, Even_footer, MAXOUT)

      when (if_REQ)     # conditional macro execution
         call chkif (buf)

      when (am_REQ)     # append to a macro
         call apndmac (buf)

   elif (ct == COMMENT)
      ;

   else     # not a recognizable command
      call text (buf)

   return
   end



# comtyp --- decode command type

   integer function comtyp (buf)
   character buf (MAXLINE)

   include FMT_COMMON

   integer lookup
   character comstr (3)

   comstr (1) = buf (2)
   comstr (2) = buf (3)
   comstr (3) = EOS

   if (lookup (comstr, comtyp, Com_table) == NO)
      if (comstr (1) == '#'c)
         comtyp = COMMENT
      else
         comtyp = UNKNOWN

   return
   end



# processline --- process line of input (text or commands)

   subroutine processline (inbuf)
   character inbuf (MAXOUT)

   include FMT_COMMON

   Nobreak = NO
   if (inbuf (1) == Cmdch || inbuf (1) == Nbcch) { # it's a command
      if (inbuf (1) == Nbcch)
         Nobreak = YES
      call comand (inbuf)
      }
   else               # it's text
      call text (inbuf)

   return
   end



# text --- process text lines

   subroutine text (inbuf)
   character inbuf (MAXOUT)

   include FMT_COMMON

   integer i
   integer getwrd
   character wrdbuf (MAXOUT)

   if (Dvflag == YES) {
      call putlin (inbuf, Out_file)
      return
      }

   if (inbuf (1) == ' 'c || inbuf (1) == NEWLINE)
      call leadbl (inbuf)   # move left, set tival

   if (Itval > 0) {      # italicizing
      call italic (inbuf, wrdbuf, MAXOUT, NO)
      call ctoc (wrdbuf, inbuf, MAXOUT)
      Itval -= 1
      }

   if (Ulval > 0) {      # underlining
      call underl (inbuf, wrdbuf, MAXOUT, NO)
      call ctoc (wrdbuf, inbuf, MAXOUT)
      Ulval -= 1
      }

   if (Bfval > 0) {      # boldface type
      call boface (inbuf, wrdbuf, MAXOUT)
      call ctoc (wrdbuf, inbuf, MAXOUT)
      Bfval -= 1
      }

   if (Ceval > 0) {      # centering
      call center (inbuf)
      call put (inbuf)
      Ceval -= 1
      }
   elif (inbuf (1) == NEWLINE)   # all blank line
      call put (inbuf)
   elif (Fill == NO)      # unfilled text
      call put (inbuf)
   else            # filled text
      for (i = 1; getwrd (inbuf, i, wrdbuf) > 0; )
         call putwrd (wrdbuf)

   return
   end
