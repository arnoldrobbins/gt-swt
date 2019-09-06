* init_stack --- initialize the Subsystem stack

               SEG
               RLIT

HEADER_FREE    EQU     XB%+0                 Free pointer
HEADER_EXTEND  EQU     XB%+2                 Extension pointer

SB_REG         EQU     PB%+13
LB_REG         EQU     PB%+14
XB_REG         EQU     PB%+15

INIT_STACK     E64V

               LDL     STACK_FRAME
               CRB
               STLR    XB_REG
               LDX     =16
               CRL
CLEAR_LOOP     STL     XB%,X                 Zero low end of root segment
               DRX
               BDX     CLEAR_LOOP

               EAL     STACK_FRAME,*
               STL     HEADER_FREE           Initialize free pointer
               STLR    SB_REG                Initialize SB register

               STA     SB%+1                 Initialize first_frame.root

               CRL
               STL     HEADER_EXTEND
               STL     HEADER_EXTEND+2
               STL     HEADER_EXTEND+4

               EALB    MAIN_PTR,*            Give LB reg a known value

               PCL     LB%
               HLT

               EXT     STACK$
STACK_FRAME    IP      STACK$

               EXT     MAIN
MAIN_PTR       IP      MAIN

               END     INIT_STACK
