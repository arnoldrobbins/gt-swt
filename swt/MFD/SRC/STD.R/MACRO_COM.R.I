# macro_com.r.i --- common declarations for the 'macro' program

   common /cdefio/ bp, buf(BUFSIZE), ifp, ifst (MAXIFILES),
      ofp, ofst (MAXOFILES)
      integer bp      # next available character; init = 0
      character buf   # pushed-back characters
      integer ifp     # input file pointer; init = 1
      integer ifst    # input file descriptor stack; init ifst (1) = STDIN
      integer ofp     # output file pointer; init = 1
      integer ofst    # output file descriptor stack; init ofst (2) = STDOUT

   common /clook/ lastp, namptr(MAXPTR)
      integer lastp      # last used in namptr; init = 0
      integer namptr      # name pointers

   common /cmacro/ cp, ep, evalst(EVALSIZE)
      integer cp         # current call stack pointer
      integer ep         # next free position in evalst
      character evalst      # evaluation stack
