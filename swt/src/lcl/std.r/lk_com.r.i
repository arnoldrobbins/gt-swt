# Dynamic storage area:
   integer Mem (MEMSIZE)
   common /ds$mem/ Mem

# Symbol table:
   integer _
      Sym_sym (MAXSYMTOP),
      Sym_typ (MAXSYMTOP),
      Sym_val (MAXSYMTOP),
      Symtop
   common /symtab/ Sym_sym, Sym_typ, Sym_val, Symtop

# Relocation bit map:
   integer Rmap (MAPSIZE)
   common /relmap/ Rmap

# Special lk stuff
   integer _
      First_time,
      Infile,
      Machine,
      Mode,
      Outfile,
      Segstart (MAXFD)
   common /lkstuf/ First_time, Infile, Machine, Mode, Outfile, Segstart
