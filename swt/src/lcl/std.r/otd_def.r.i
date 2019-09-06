define (MAXNAME,65)
define (OTD_COMMON,"otd_com.r.i")
define (LINK,1)
define (PROC,2)
define (PABS,3)
define (COMM,4)

# Object Block Definitions:

   define (BLOCKSZ,1024)      # Size of an object block
   define (PREFIX_TYPE,:11)   # Prefix block type
   define (DATA_TYPE,:12)     # Data block type
   define (END_TYPE,:13)      # End block type


# Group Type Definitions:

   define (ENDBLK,0)          # Premature end of block
   define (COMDEF,1)          # Short common block definition
   define (ENTABS,2)          # Absolute procedure entry point
   define (ENTREL,3)          # Relative procedure entry point
   define (ORGABS,4)          # Absolute precedure origin
   define (ORGREL,5)          # Relative procedure origin
   define (SETBABS,6)         # Declare absolute base area
   define (SETBREL,7)         # Declare relative base area
   define (DATAGRP,8)         # Data words
   define (GENERIC,9)         # Generic instructions
   define (DATARPT,10)        # Repeated data words
   define (MEMREF,11)         # Memory reference instructions
   define (MEMREFCOM,12)      # Memory references to common storage
   define (MEMREFEXT,13)      # Memory references to external symbols
   define (ENDABS,14)         # End defining absolute start address
   define (ENDREL,15)         # End defining relative start address
   define (SFL,16)            # Set force load flag
   define (RFL,17)            # Reset force load flag
   define (DDM,18)            # Process in default desectorization mode
   define (ELM,19)            # Enter loader defined addressing mode
   define (SDM,20)            # Set default desectorization mode
   define (LINKMODE,21)       # Set desectorization mode
   define (MBR,22)            # Must be relative
   define (N64R,23)           # Never 64r addressing mode
   define (UIIREQ,24)         # Declare instruction set requirement
   define (UIIDEF,25)         # Define UIIs implemented by this module
   define (ORGCOM,26)         # Origin into common block
   define (FWDDEF,27)         # Define forward references
   define (LIR,28)            # Load if required
   define (SKIPGR,29)         # Pointer to next block if this one to be skipped
   define (PROCDEF,30)        # Procedure definition
   define (ENTLB,31)          # Absolute linkage entry point
   define (ENTLBA,32)         # Relative linkage entry point
   define (ORGLB,33)          # Absolute linkage origin
   define (ORGLBA,34)         # Relative linkage origin
   define (EXTREF32,35)       # Two word reference to external symbol
   define (COMREF32,36)       # Two word reference to common block
   define (ECBDEF,37)         # Entry control block definition
   define (ENDLB,38)          # End defining link-relative start address
   define (PBIP,39)           # Indirect pointer to procedure frame
   define (LBIP,40)           # Indirect pointer to linkage frame
   define (LCOMDEF,41)        # Long common block definition
   define (LCOMREF,42)        # Reference to long common block
   define (DYNT,43)           # Direct entry to supervisor
   define (COMREFSP,44)       # Special common block reference
