# swt_com.r.i --- Software Tools Subsystem common block definition
#            Version 9 -- 07/30/84

   common /swt$cm/ _

     ### I/O related areas (pages 1-3)
      Termbuf (MAX_TERMBUF),        # Terminal input buffer
      Termcp,                       # Terminal input pointer
      Termcount,                    # Terminal input count
      Echar,                        # Erase character
      Kchar,                        # Kill character
      Nlchar,                       # Newline character
      Eofchar,                      # End of file character
      Escchar,                      # Escape character
      Rtchar,                       # Retype character
      Isphantom,                    # True if process is a phantom
      Cputype,                      # Processor model number
      Errcod,                       # File system error code
      Stdporttbl (MAX_STD_PORTS),   # Standard port map
      Kill_resp (MAXKILLRESP),      # Line kill response
      Fdmem (FDSIZE, NFILES),       # Array of file descriptors
      Reserved_io (846),            # Force a page boundary

     ### I/O buffers (pages 4-19)
      Fdbuf (MAXFDBUF),             # Space for file buffers

     ### File open areas (pages 20-24)
      Passwd (7),                   # Password of vars directory
      Bplabel (4),                  # Bad password label
      Utemptop,                     # User template free pointer
      Fdlastfd,                     # Last fd allocated
      Prt_dest (MAXPRTDEST),        # Destination for printer output
      Prt_form (MAXPRTFORM),        # Form for printer output
      Uhashtb (MAXTEMPHASH),        # User template hash table
      Utempbuf (MAXTEMPBUF),        # User template buffer
      Reserved_open (985),          # Force a page boundary

     ### Program initiation/shell areas (pages 25-41)
      Cmdstat,                      # Command return status
      Comunit,                      # Cominput unit number
      Rtlabel (4),                  # Target label for rtn$$
      Firstuse,                     # Initialization indicator
      Argc,                         # Argument count
      Argv (MAX_ARGV),              # Argument pointer vector
      Termattr (MAX_TERMATTR),      # Terminal attributes
      Termtype (MAX_TERMTYPE),      # Terminal type
      Lword,                        # Saved terminal configuration
      Lsho,                         # Linked string high water mark
      Lstop,                        # Linked string maximum space
      Lsna,                         # Linked string next available
      Lsref (MAXLSBUF),             # Linked string buffer
      Reserved_shell (743),         # Force a page boundary

     ### Tscan$ common block (pages 42-43)
      Ts_state,                     # Current state
      Ts_gt,                        # YES if Ga. Tech Primos
      Ts_at,                        # YES if reattach done on this call
      Ts_eos,                       # intermediate EOS position
      Ts_un (MAXLEV),               # file unit stack
      Ts_ps (MAXLEV),               # end of path stack
      Ts_bf (MAXDIRENTRY, MAXLEV),  # directory buffer stack
      Ts_pw (3, MAXLEV),            # directory password stack
      Ts_path (MAXPATH),            # original pathname
      Reserved_tscan(680)           # force page boundary



   integer _
      Termbuf, Termcp, Termcount, Echar, Kchar, Nlchar, Eofchar,
      Escchar, Rtchar, Isphantom, Cputype, Errcod, Stdporttbl,
      Fdmem, Reserved_io, Fdbuf, Passwd, Bplabel, Utemptop,
      Uhashtb, Utempbuf, Reserved_open, Cmdstat, Comunit, Rtlabel,
      Firstuse, Argc, Argv, Termattr, Termtype, Lsho, Lstop,
      Lsna, Lsref, Reserved_shell, Fdlastfd, Kill_resp,
      Prt_dest, Prt_form, Lword, Ts_state, Ts_gt, Ts_at,
      Ts_eos, Ts_un, Ts_ps, Ts_bf, Ts_pw, Ts_path, Reserved_tscan

   integer Fdesc (FDSIZE), Fddev (1), Fdunit (1), Fdbufstart (1),
         Fdbuflen (1), Fdbufend (1), Fdcount (1), Fdbcount (1),
         Fdflags (1), Fdvcstat1 (1), Fdvcstat2 (1), Fdopstat1 (1),
         Fdopstat2 (1), Fdopstat3 (1)

   equivalence _
      (Fdmem, Fdesc),
      (Fddev, Fdesc (1)),
      (Fdunit, Fdesc (2)),
      (Fdbufstart, Fdesc (3)),
      (Fdbuflen, Fdesc (4)),
      (Fdbufend, Fdesc (5)),
      (Fdcount, Fdesc (6)),
      (Fdbcount, Fdesc (7)),
      (Fdflags, Fdesc (8)),
      (Fdvcstat1, Fdesc (9)),
      (Fdvcstat2, Fdesc (10)),
      (Fdopstat1, Fdesc (11)),
      (Fdopstat2, Fdesc (12)),
      (Fdopstat3, Fdesc (13))
