# lf_com.r.i --- common declarations for the 'lf' program

   # Miscellaneous variables:

   integer Keypos,               # entry offset of sort key
           Keylen,               # length of sort key
           Level,                # current nesting level
           Max_level,            # maximum nesting level
           Col                   # next available output column
   pointer Root                  # pointer to root node of sort tree
   bool Opts (MAXOPTS)           # option flags
   integer Pl                    # length of Parent string
   character Parent (MAXPATH)    # pathname of current directory

   common /lf$com/ Keypos, Keylen, Level, Max_level, Col, Root,
      Opts, Pl, Parent


   # Definition of file entry fields:

   integer Mem (MEMSIZE)         # dynamic memory
   pointer E_llink (1),          # pointer to left subtree of this node
           E_rlink (1)           # pointer to right subtree of this node
   integer E_fsize (1),          # file size (in words)
           E_fsize1 (1),         # second word of file size
           E_owner (1),          # name of ufd's owner
           E_passwd (1),         # non-owner password of ufd
           E_ecw (1),            # entry control word
           E_name (1),           # file name
           E_protec (1),         # protection flags
           E_nondefprot (1),     # non-default protected (has ACL or ACAT)
           E_filtyp (1),         # file type
           E_datmod (1),         # date of last modification
           E_timmod (1),         # time of last modification
           E_logtyp (1),         # logical file type
           E_trunc (1),          # truncated by FIX_DISK
           E_dtlsav (1)          # date/time last saved

   equivalence _
      (E_llink,  Mem ( 1)),
      (E_rlink,  Mem ( 2)),
      (E_fsize,  Mem ( 3)),
      (E_fsize1, Mem ( 4)),
      (E_owner,  Mem ( 5)),
      (E_passwd, Mem ( 8)),
      (E_ecw,    Mem (11)),
      (E_name,   Mem (12)),
      (E_protec, Mem (28)),
      (E_nondefprot, Mem (29)),
      (E_filtyp, Mem (30)),
      (E_datmod, Mem (31)),
      (E_timmod, Mem (32)),
      (E_logtyp (1), Mem (33)),
      (E_trunc (1),  Mem (35)),
      (E_dtlsav (1), Mem (36))

   common /ds$mem/ Mem
