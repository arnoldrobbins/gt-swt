# banner_com.r.i --- common declarations for the 'banner' program

   character foreground_sym   # foreground character
   character background_sym   # background character
   character line             # output line buffer
   integer   move             # vertical character offset
   character syma             # sorted list of printable symbols
   longint   symn             # sorted character size descriptions
                              # NOTE: the elements of syma and symn
                              #     correspond one to one.
   longint   nchar            # array of character descriptions

   common /cbaner/ foreground_sym, background_sym, line (132),
      move, syma (MAXSYM), symn (MAXSYM), nchar (3000)

# The following definitions are used only by the Block Data segment:

   longint ia (186), ib (180), ic (181), id (179), ie (174),
      if (184), ig (180), ih (173), ii (179), ij (187), ik (179),
      il (180), im (176), in (171), io (168), ip (163), iq (160)

   equivalence (ia (187), ib (1)), (ib (181), ic (1)),
               (ic (182), id (1)), (id (180), ie (1)),
               (ie (175), if (1)), (if (185), ig (1)),
               (ig (181), ih (1)), (ih (174), ii (1)),
               (ii (180), ij (1)), (ij (188), ik (1)),
               (ik (180), il (1)), (il (181), im (1)),
               (im (177), in (1)), (in (172), io (1)),
               (io (169), ip (1)), (ip (164), iq (1)),
               (nchar (1), ia (1))
