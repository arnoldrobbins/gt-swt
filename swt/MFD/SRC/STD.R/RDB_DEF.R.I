#  rdb_def.r.i --- definitions for the 'rdb' programs

   define (MAXDATASIZE, 400)
   define (MAXFIELDS, 40)
   define (MAXKEYS, 41)       # MAXFIELDS + 1
   define (relation_des, integer)
   define (RDSIZE, 884)       # RDHEADERSIZE + MAXFIELDS * RDENTRYSIZE + 1
   define (RDHEADERSIZE, 3)
   define (RDENTRYSIZE, 22)   # RFNAMESIZE + 5
   define (RFNAMESIZE, 17)
   define (RDATASIZE, 500)
   define (RPNSIZE, 200)

   define (RDLEN (rd),      rd (1))
   define (RDLASTFLD (rd),  rd (2))
   define (RDROWLEN (rd),   rd (3))

   define (RFTYPE (rd, i),  rd (i))
      define (INTEGER_TYPE, 1)
      define (REAL_TYPE, 2)
      define (STRING_TYPE, 3)
   define (RFLEN (rd, i),   rd (i + 1))
   define (RFSPOS (rd, i),  rd (i + 2))
   define (RFEPOS (rd, i),  rd (i + 3))
   define (RFPLEN (rd, i),  rd (i + 4))
   define (RFNAME (rd, i),  rd (i + 5))

   define (init_rd (rd),    RDLEN (rd) = RDHEADERSIZE
                            RDLASTFLD (rd) = RDHEADERSIZE - RDENTRYSIZE + 1
                            RDROWLEN (rd) = 0)

   define (get_field_pos (rd, i, s, l), s = RFSPOS (rd, i)
                                        l = RFLEN (rd, i))

   define (FIRSTRF (rd), RDHEADERSIZE + 1)
   define (ISLASTRF (rd, i), i <= RDLASTFLD (rd))
   define (NEXTRF (rd, i), i + RDENTRYSIZE)

   define (LESYM, '/'c)    # Symbols, along with '>', '<', '=',
   define (GESYM, '\'c)    #     '&', '|', '~' for rpn string
   define (NESYM, '^'c)
   define (IDSYM, 'A'c)
   define (NUSYM, '0'c)
   define (QTSYM, '"'c)
