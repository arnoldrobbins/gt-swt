# ed_com.r.i --- common declarations for the 'ed' subroutine

common /clines/ line1, line2, nlines, curln, lastln
   integer line1   # first line number
   integer line2   # second line number
   integer nlines  # number of line numbers specified
   integer curln   # current line: value of dot
   integer lastln  # last line: value of $

common /cpat/ pat(MAXPAT), tlpat (MAXPAT), subs (MAXPAT), tset (MAXPAT)
   character pat      # pattern
   character tlpat    # character list for 't' command
   character subs     # replacement
   character tset     # saved replacement for 't' command

common /ctxt/ txt(MAXLINE)
   character txt      # text line for matching and output

common /cfile/ savfil(MAXLINE), Fdin, Fdout
   character savfil   # remembered file name
   integer Fdin       # standard input unit
   integer Fdout      # stanard output unit

common /cbuf/ buf(MAXBUF), lastbf, fence, free, line0,
   robin
   character buf   # structure of pointers for all lines:
      # buf(k+0)   PREV      previous line
      # buf(k+1)   NEXT      next line
      # buf(k+2)   MARK      mark for global commands
      # buf(k+3)   SEEKADR   where line is on scratch file
        # buf(k+3) SEEKREC   scratch file record number
        # buf(k+4) SEEKWORD  scratch file word number
      # buf(k+5)   LENG      length on scratch
      # buf(k+6)   NAME       user's mark
                   # structure of pointers for file buffers
      # buf(b+0)   RECNO       record number on file
      # buf(b+1)   PRIORITY    eligibility to stay in memory
      # buf(b+2)   WRITTEN     written to file
      # buf(b+3)   POOP        buffer contents; RECLENG long
   integer lastbf   # last pointer used in buf
   integer fence    # first file buffer used in buf
   integer line0    # head of list of lines in buffer
   integer free     # head of free list
   integer robin # pointer in round robin swap policy

common /cundo/ limbo, limcnt
   integer limbo    # head of limbo list for undo
   integer limcnt   # number of lines in limbo list

common /cscrat/ scr, scrend(2), scrfil(20)
   integer scr      # scratch file id
   integer scrend   # end of info on scratch file
   integer scrfil   # scratch file name

common /cmisc/ updflg, errcode, saverrcode, probation, safety_logfile
   integer updflg   # buffer has been updated since last write
   integer errcode  # cause of error
   integer saverrcode # cause of previous error
   integer probation  # involved in destruction of unsaved buffer
   integer safety_logfile # file descriptor for logging input

common /cmark/ savknm
   character savknm # saved mark name for < and >

common /copt/ prompt(MAXLINE), ddir, nldef(MAXLINE), tune, globals
   character prompt # command prompt
   integer ddir     # delete direction
   character nldef  # default line number for newline command
   integer tune     # print scratch file I/O trace
   integer globals  # controls behavior of substitutes inside globals

common /cvir/ vaddr(2), truend, curbuf
   integer vaddr    # virtual seek address
   integer truend   # end of real file (record number)
   integer curbuf    # id of current buffer

