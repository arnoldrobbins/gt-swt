* realloc --- call PL/1 storage allocator from C programs
*
*  char *realloc (ptr, size);
*  char *ptr;
*  int size;

            SEG
            SYML
            RLIT

            SUBR     REALLOC

            LINK
REALLOC     ECB      ALLOC$,,PTRP,2
            DATA     7,C'realloc'
            PROC

            DYNM     =20
            DYNM     PTRP(3),SIZEP(3),TRSTOP,TRSTART(2),NEWPTRP(2)

ALLOC$      ARGT
            EAL      REALLOC
            STL      SB%+18
            LDA      ='4000
            STA      SB%+0          set up debug name
*
*  The compiler always passes a pointer by value:
*  PTRP contains the actual pointer argument rather
*  than a pointer to the pointer argument - so we
*  load it directly
*
            LDL      PTRP           what happens if we get a null ptr?
            BLEQ     QUIT1          we fall out
            EAXB     PTRP,*         get PL/I double-word count
            LDA      XB%-1          from word before storage
            ANA      ='77777        & mask out in use flag (sign bit)
            ALL      1              shift to convert to single words
            STA      TRSTOP

            EAL      XB%-1          compute transfer start address
            STL      TRSTART

            LDA      SIZEP,*
            A1A                     round up to even # words
            ARL      1
            ALL      1
            BEQ      QUIT1          error if 0 words requested

            CAS      TRSTOP         compare with old word count
            JMP#     GET$ST         to compute number words to transfer
            JMP#     QUIT2          asked for same amount - quit
            STA      TRSTOP

GET$ST      CALL     P$ALC          allocate a block of the new size
            STLR     PB%+'17        set return pointer value in XB
            STL      NEWPTRP

            LDX      TRSTOP         load number words to transfer
TRANSFER    LDA      TRSTART,*X     and do it
            STA      XB%-1,X
            BDX      TRANSFER

            LDL      PTRP
            CALL     P$FREE         free block originally allocated

            LDL      NEWPTRP        return new storage pointer
            PRTN

QUIT2       EAL      XB%            return old pointer
            PRTN

QUIT1       EQU      *              return null pointer
            CRL
            PRTN
            END
