# Common areas for quick-and-dirty assembler

# Dynamic storage area:
   integer mem (MEMSIZE)
   common /ds$mem/ mem

# Parser variables:
   integer symbol,
      lcnt,
      ibp,
      constval
   character token (MAXTOK),
      inbuf (INBUFSIZE)
   common /parcom/ symbol, lcnt, ibp, token, inbuf, constval

# Symbol table:
   integer sym_sym (MAXSYMTOP),
      sym_typ (MAXSYMTOP),
      sym_val (MAXSYMTOP),
      sym_brlist (MAXSYMTOP),
      symtop
   common /symtab/ sym_sym, sym_typ, sym_val, sym_brlist, symtop

# Relocation bit map:
   integer rmap (MAPSIZE)
   common /relmap/ rmap

# Stuff related to emitting code:
   integer lc,
      code
   common /ccom/ lc, code
