# Definitions for phase 2 of the C program checker

   define (MAXBUF, 4096)
   define (MAXARGS, 32)
   define (MAXMODES, 16)

   define (GOOD, 0)
   define (FATAL, 1)
   define (WARN, 2)

   define(CHARMODE,1)         # Character
   define(CHARUNSMODE,2)      # Character unsigned
   define(INTMODE,3)          # Integer
   define(SHORTMODE,4)        # Short integer   #########################
   define(LONGMODE,5)         # Long integer    #       WARNING         #
   define(UNSIGNEDMODE,6)     # Unsigned integer#  There is a table in  #
   define(SHORTUNSMODE,7)     # Short unsigned  #    'conv_type' that   #
   define(LONGUNSMODE,8)      # Long unsigned   # depends on the values #
   define(FLOATMODE,9)        # Short floating  # of these definitions  #
   define(DOUBLEMODE,19)      # Long floating   #########################
   define(FIELDMODE,11)       # Field
   define(POINTERMODE,12)     # Pointer
   define(ARRAYMODE,13)       # Array
   define(ENUMMODE,14)        # Enumeration
   define(FUNCTIONMODE,15)    # Function
   define(STRUCTMODE,16)      # Structure
   define(UNIONMODE,17)       # Union
   define(LABELMODE,18)       # Label
   define(TYPEDEFMODE,19)     # Typedef
   define(DEFAULTMODE,20)     # No mode specified

   define (DB,#)
